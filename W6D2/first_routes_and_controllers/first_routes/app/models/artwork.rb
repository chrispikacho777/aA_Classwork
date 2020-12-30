class Artwork < ApplicationRecord
    validates :artist_id, presence: true, uniqueness: {scope: :title}
    validates :title, presence: true
    validates :image_url, presence: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

end
