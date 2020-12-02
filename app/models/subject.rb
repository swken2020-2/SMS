class Subject < ApplicationRecord
    has_many :course_registrations
    has_many :course_registration_users, through: :course_registrations, source: :user
end

# コース.course_registration_users << ユーザー