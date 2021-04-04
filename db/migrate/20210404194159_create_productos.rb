class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :codigo
      t.string :existencia, default: 0
      t.text :descripcion
      t.decimal :precio_de_compra, default: 0
      t.string :iva, default: 16
      t.string :type
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
