class Card < ActiveRecord::Base
  belongs_to :quiz
  has_attached_file :photo,
    styles: { thumb: ["50x50#", :jpg],
              medium: ["200x200>", :jpg],
              original: ['500x500>', :jpg] },
    convert_options: { thumb: "-quality 75 -strip",
                        medium: "-quality 85 -strip",
                        original: "-quality 85 -strip" }
  validates_attachment :photo,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :photo, presence: true
  validates :name, presence: true
  validates :role, presence: true
end
