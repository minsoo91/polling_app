class Question << ActiveRecord::Base
	validates :question_text, presence: true
	validates :poll_id, presence: true
end