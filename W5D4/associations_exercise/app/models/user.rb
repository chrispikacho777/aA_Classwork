#   create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

class User < ApplicationRecord

    has_many :enrollments,
        class_name: 'Enrollment',
        foreign_key: :student_id,
        primary_key: :id

    has_many :courses,
        through: :enrollments,
        source: :course
        # class_name: 'Course'


end
