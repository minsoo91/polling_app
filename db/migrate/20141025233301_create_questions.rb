class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer :poll_id
    	t.string :question_text
    end
  end
end
