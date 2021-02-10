class AddFirstNameToExplorers < ActiveRecord::Migration[6.0]
  def change
    add_column :explorers, :first_name, :string
  end
end
