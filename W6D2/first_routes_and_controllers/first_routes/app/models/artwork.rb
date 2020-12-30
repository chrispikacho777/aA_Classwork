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

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :likes,
        as: :likeable


end
