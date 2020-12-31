require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ['white', 'brown', 'orange', 'black']
    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: COLORS
    validates :sex, inclusion: ['M', 'F']

    def age
        time_ago_in_words(birth_date)
    end

end
