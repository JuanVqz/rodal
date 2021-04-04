require 'rails_helper'

RSpec.describe "productos/new", type: :view do
  before(:each) do
    assign(:producto, Producto.new(
      nombre: "MyString",
      codigo: "MyString",
      descripcion: "MyText",
      precio_de_compra: 10,
      iva: 16,
      type: "Mofle"
    ))
  end

  it "renders new producto form" do
    render

    assert_select "form[action=?][method=?]", productos_path, "post" do

      assert_select "input[name=?]", "producto[nombre]"

      assert_select "input[name=?]", "producto[codigo]"

      assert_select "textarea[name=?]", "producto[descripcion]"

      assert_select "input[name=?]", "producto[precio_de_compra]"

      assert_select "select[name=?]", "producto[type]"
    end
  end
end
