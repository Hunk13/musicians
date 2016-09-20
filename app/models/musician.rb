class Musician < ActiveRecord::Base
  self.per_page = 4
  belongs_to :genre
  belongs_to :user
  validates :name, presence: true

  has_attached_file :avatar,
                    storage: :s3,
                    s3_region: ENV['S3_REGION'],
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials },
                    styles: { musician_index: '250x450>',
                              musician_show: '325x475>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def s3_credentials
    { bucket: ENV['S3_BUCKET'],
     access_key_id: ENV['S3_ACCESS_KEY_ID'],
     secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
     s3_host_name: ENV['S3_HOST_NAME'] }
  end
end
