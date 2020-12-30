class Like < ApplicationRecord
    validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type] }
    
    belongs_to :likeable,
        polymorphic: true
        
    belongs_to :liker,
        foreign_key: :user_id,
        class_name: :User

end
