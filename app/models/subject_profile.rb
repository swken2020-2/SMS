class SubjectProfile < ApplicationRecord
    belongs_to :subject, dependent: :destroy
    #belongs_to :user
    
    validates :name, presence: true, length: { minimum: 1, maximum: 20 }
end
