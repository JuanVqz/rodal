require 'rails_helper'

RSpec.describe "productos/edit", type: :view do
  let(:usuario) { create :usuario }

  before(:each) do
    @producto = assign(:producto, Producto.create!(
      nombre: "MyString",
      codigo: "MyString",
      descripcion: "MyText",
      precio_de_compra: "9.99",
      iva: 16,
      type: "Mofle",
      usuario: usuario
    ))
  end

  it "renders the edit producto form" do
    render

    assert_select "form[action=?][method=?]", producto_path(@producto), "post" do

      assert_select "input[name=?]", "producto[nombre]"

      assert_select "input[name=?]", "producto[codigo]"

      assert_select "textarea[name=?]", "producto[descripcion]"

      assert_select "input[name=?]", "producto[precio_de_compra]"

      assert_select "select[name=?]", "producto[type]"
    end
  end
end
