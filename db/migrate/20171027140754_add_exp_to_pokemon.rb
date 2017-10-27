class AddExpToPokemon < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :exp, :integer
  end
end
