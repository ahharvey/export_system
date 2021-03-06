#require "email_processor"

Griddler.configure do |config|
  #config.processor_class = EmailProcessor # MyEmailProcessor
  # config.to = :hash # :full, :email, :hash
  config.processor_method = :process # :create_comment (A method on CommentViaEmail)
  # :raw    => 'AppName <s13.6b2d13dc6a1d33db7644@mail.myapp.com>'
  # :email  => 's13.6b2d13dc6a1d33db7644@mail.myapp.com'
  # :token  => 's13.6b2d13dc6a1d33db7644'
  # :hash   => { raw: '', email: '', token: '', host: '' }
  config.reply_delimiter = '-- REPLY ABOVE THIS LINE --'
  config.email_service = :mandrill
end
