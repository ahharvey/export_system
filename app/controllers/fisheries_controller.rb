class FisheriesController < InheritedResources::Base
  load_and_authorize_resource
  skip_before_filter :authenticate!
  
  respond_to :html, :xml, :json, :except => [ :edit, :new, :update, :create ]

  def show
    #@chart = @fishery.surveys.group("DATE_TRUNC('month', survey.date_published)").order("DATE_TRUNC('month', survey.date_published)").average('landings.cpue_kg')
    #@chart = Hash[@chart.map { |k, v| [Time.parse(k).utc.to_i*1000, v.to_f.round(0)] }].to_a
    respond_to do |format|
      @date_from = (DateTime.now - 1.years).strftime("%d/%m/%Y")
      @date_to = DateTime.now.strftime("%d/%m/%Y")
      @fishery = Fishery.find(params[:id])

      format.html { render }
      format.xml { render :xml=>@fishery.to_xml(include: { :surveys => {include: { :landings => { include: :catches }}}} ) }
      format.json do
        graph_catch_per_effort() if params[:method] == "catch_per_effort"
        graph_length_frequency() if params[:method] == "length_frequency"
        graph_values() if params[:method] == "value"
        graph_catch_composition() if params[:method] == "catch_composition"
      end
      format.xls
    end
  end

  protected

  def graph_catch_per_effort
    @fisheries = Fishery.find(params[:id])
    col_headers = []
    month_counts = []
    from = DateTime.parse(params[:date_from])
    to = DateTime.parse(params[:date_to])
    (from.year..to.year).each do |y|
      start_month = (from.year == y) ? from.month : 1
      end_month = (to.year == y) ? to.month : 12

      (start_month..end_month).each do |m|
        col_headers.push "#{Date::MONTHNAMES[m].slice(0,3)} #{y.to_s.slice(2,2)}"
        landings = []
        surveys = @fisheries.surveys.select{ |s| s.date_published.year == y && s.date_published.month == m}.each do |s|
          landings.concat(s.landings)
        end
        res = landings.map{ |l| l.weight / ((l.time_in.to_time - l.time_out.to_time) / 1.hour)}.inject(0, :+)
        res = res / landings.count if landings.count > 0
        month_counts.push res
      end
    end
    render json: {:col_headers => col_headers, :month_counts => month_counts }
  end

  def graph_catch_composition
    @fishery = Fishery.find(params[:id])
    from = DateTime.parse(params[:date_from])
    to = DateTime.parse(params[:date_to])
    catches = Catch.
        joins(:survey, :fishery).
        where("fisheries.id = ? AND surveys.date_published >= ? AND surveys.date_published <= ?", @fishery.id, from, to)
    counts = catches.group('catches.fish_id').count
    formatted = Hash[counts.map { |k, v| [Fish.find(k).scientific_name, v] }]
    render json: formatted.to_a
  end

  def graph_length_frequency
    catches = []
    from = DateTime.parse(params[:date_from])
    to = DateTime.parse(params[:date_to])
    @fisheries = Fishery.find(params[:id]).surveys.where(:date_published => from..to ).each do |s|
      s.landings.each do |l|
        catches.concat l.catches
      end
    end
    step = 5
    catches = catches.sort_by &:length
    lengths = catches.map{ |c| c.length - (c.length % step) }.uniq
    length_counts = lengths.map{ |l| catches.select{ |c| c.length - (c.length % step) == l }.count}

    render json: {:col_headers => lengths, :length_counts => length_counts }
  end

  def graph_values
    @fisheries = Fishery.find(params[:id])
    col_headers = []
    month_counts = []
    from = DateTime.parse(params[:date_from])
    to = DateTime.parse(params[:date_to])
    (from.year..to.year).each do |y|
      start_month = (from.year == y) ? from.month : 1
      end_month = (to.year == y) ? to.month : 12

      (start_month..end_month).each do |m|
        col_headers.push "#{Date::MONTHNAMES[m].slice(0,3)} #{y.to_s.slice(2,2)}"
        landings = []
        surveys = @fisheries.surveys.select{ |s| s.date_published.year == y && s.date_published.month == m}.each do |s|
          landings.concat(s.landings)
        end
        res = landings.map{ |l| l.value/ ((l.time_in.to_time - l.time_out.to_time) / 1.hour) }.inject(0, :+)
        res = res / landings.count if landings.count > 0
        month_counts.push res
      end
    end
    render json: {:col_headers => col_headers, :month_counts => month_counts }
  end
end
