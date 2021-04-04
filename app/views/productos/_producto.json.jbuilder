json.extract! producto, :id, :nombre, :codigo, :descripcion, :precio_de_compra, :iva, :type, :created_at, :updated_at
json.url producto_url(producto, format: :json)
