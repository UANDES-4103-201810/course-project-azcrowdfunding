class RemovePasswordEmailQuestionAnswerFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password, :string
    remove_column :users, :email, :string
    remove_column :users, :security_question, :string
    remove_column :users, :answer, :string
  end
end
