class AddNicknameToExplorers < ActiveRecord::Migration[6.0]
  def change
    add_column :explorers, :nickname, :string
  end
end
