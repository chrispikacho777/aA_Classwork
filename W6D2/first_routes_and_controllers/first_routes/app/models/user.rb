class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :shared_artworks,
        through: :artworks,
        source: :shares

    has_many :comments,
        foreign_key: :commenter_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :likes,
        foreign_key: :user_id,
        class_name: :Like,
        dependent: :destroy

    has_many :liked_artworks,
        through: :likes,
        source: :likeable
        source_type: 'Artwork'

    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: 'Comment'


end
