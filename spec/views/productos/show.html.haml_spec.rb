require "rails_helper"

RSpec.describe "productos/show", type: :view do
  let(:usuario) { create :usuario }

  before(:each) do
    @producto = assign(:producto, Producto.create!(
      nombre: "Nombre",
      codigo: "Codigo",
      descripcion: "MyText",
      type: "Mofle",
      usuario: usuario
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Mofle/)
  end
end
