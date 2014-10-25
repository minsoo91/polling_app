class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
    	t.string :answer_choice_text
    	t.integer :question_id
    end
  end
end
