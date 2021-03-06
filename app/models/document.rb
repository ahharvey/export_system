# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  file              :string
#  content_type      :string
#  file_size         :string
#  documentable_id   :integer
#  documentable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true
  mount_uploader :file, DocumentUploader

  before_save :update_document_attributes

  validates :documentable,
    presence: true

  validates :file,
    integrity: true,
    processing: true,
    presence: true

  scope :default, -> { order('documents.created_at DESC') }

  def is_word?
    doc   = 'application/msword'
    docx  = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    content_type == doc || content_type == docx
  end

  def is_excel?
    xls   = 'application/octet-stream'
    xlsx  = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    content_type == xls  || content_type == xlsx
  end

  def is_pdf?
    pdf = 'application/pdf'
    content_type == pdf
  end

  def is_image?
    jpeg  = 'image/jpeg'
    png   = 'image/png'
    content_type == jpeg || content_type == png
  end

  private

  def update_document_attributes
    if file.present? && file_changed?
      self.content_type  =  file.file.content_type
      self.file_size = file.file.size
      self.title = file.file.original_filename if self.title.blank?
    end
  end

end
