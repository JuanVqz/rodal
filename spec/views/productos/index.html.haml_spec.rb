require "rails_helper"

RSpec.describe "productos/index", type: :view do
  let(:usuario) { create :usuario }

  before(:each) do
    assign(:productos, [
      Producto.create!(
        nombre: "Nombre 1",
        codigo: "Codigo 1",
        type: "Mofle",
        usuario: usuario
      ),
      Producto.create!(
        nombre: "Nombre 2",
        codigo: "Codigo 2",
        type: "Mofle",
        usuario: usuario
      )
    ])
  end

  it "renders a list of productos" do
    render
    assert_select "tr>td", text: "Nombre 1".to_s, count: 1
    assert_select "tr>td", text: "Codigo 1".to_s, count: 1
    assert_select "tr>td", text: "Nombre 2".to_s, count: 1
    assert_select "tr>td", text: "Codigo 2".to_s, count: 1
    assert_select "tr>td", text: "Mofle".to_s, count: 2
  end
end
