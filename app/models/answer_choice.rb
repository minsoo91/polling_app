class AnswerChoice << ActiveRecord::Base
	validates :answer_choice_text, presence: true
	validates :question_id, presence: true
end