class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :number
      t.integer :type1
      t.integer :type2

      t.timestamps
    end
  end
end
