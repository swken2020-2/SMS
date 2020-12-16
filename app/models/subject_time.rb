class SubjectTime < ApplicationRecord
    belongs_to :subject
    
    has_many :attachment
end
