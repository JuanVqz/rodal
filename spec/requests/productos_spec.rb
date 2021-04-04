 require "rails_helper"

RSpec.describe "/productos", type: :request do

  let(:usuario) { create :usuario }
  before(:each) { sign_in usuario }

  let(:valid_attributes) do
    {
      nombre: "Mofle A",
      codigo: "mofle_a",
      type: "Mofle",
      usuario: usuario
    }
  end

  let(:invalid_attributes) do
    {
      nombre: nil,
      codigo: nil,
      type: "Mofle"
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Producto.create! valid_attributes
      get productos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      producto = Producto.create! valid_attributes
      get producto_url(producto)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_producto_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      producto = Producto.create! valid_attributes
      get edit_producto_url(producto)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Producto" do
        expect {
          post productos_url, params: { producto: valid_attributes }
        }.to change(Producto, :count).by(1)
      end

      it "redirects to the created producto" do
        post productos_url, params: { producto: valid_attributes }
        expect(response).to redirect_to(producto_url(Producto.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Producto" do
        expect {
          post productos_url, params: { producto: invalid_attributes }
        }.to change(Producto, :count).by(0)
      end

      xit "displays the 'new' template" do
        post productos_url, params: { producto: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { nombre: "Otro nombre" }
      end

      it "updates the requested producto" do
        producto = Producto.create! valid_attributes
        patch producto_url(producto), params: { producto: new_attributes }
        expect(producto.reload.nombre).to eq "Otro nombre"
      end

      it "redirects to the producto" do
        producto = Producto.create! valid_attributes
        patch producto_url(producto), params: { producto: new_attributes }
        producto.reload
        expect(response).to redirect_to(producto_url(producto))
      end
    end

    xcontext "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        producto = Producto.create! valid_attributes
        patch producto_url(producto), params: { producto: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested producto" do
      producto = Producto.create! valid_attributes
      expect {
        delete producto_url(producto)
      }.to change(Producto, :count).by(-1)
    end

    it "redirects to the productos list" do
      producto = Producto.create! valid_attributes
      delete producto_url(producto)
      expect(response).to redirect_to(productos_url)
    end
  end
end
