class Response < ActiveRecord::Base
	validates :user_id, :answer_choice_id, presence: true
	validate :respondent_has_not_already_answered_question

	belongs_to(
		:user,
		class_name: "User",
		foreign_key: :user_id,
		primary_key: :id
	)

	belongs_to(
		:answer_choice,
		class_name: "AnswerChoice",
		foreign_key: :answer_choice_id,
		primary_key: :id
	)

	has_one(
		:question,
		through: :answer_choice,
		source: :question
	)

	def sibling_responses
		self.question.responses
			.where('responses.user_id != ?', self.user_id)
			.where('(:id IS NULL) OR (responses.id != :id)', id: self.id)
	end

	private
	def respondent_has_not_already_answered_question
		return if self.sibling_responses.empty?
		errors[:response] << "The respondent already answered this question!"
	end
end