class AddLastNameToExplorers < ActiveRecord::Migration[6.0]
  def change
    add_column :explorers, :last_name, :string
  end
end
