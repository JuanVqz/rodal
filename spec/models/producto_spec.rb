require "rails_helper"

RSpec.describe Producto, type: :model do
  context "validaciones" do
    it "es valido" do
      producto = build :producto, :mofle

      expect(producto).to be_valid
    end

    it "es invalido" do
      producto = build :producto, nombre: nil, codigo: nil, type: nil

      expect(producto).to be_invalid
      expect(producto.errors.size).to eq 3
      expect(producto.errors["nombre"][0]).to eq "no puede estar en blanco"
      expect(producto.errors["codigo"][0]).to eq "no puede estar en blanco"
      expect(producto.errors["type"][0]).to eq "no puede estar en blanco"
    end

    context "cuando el codigo fue tomado" do
      it "regresa un error" do
        create :producto, :mofle, codigo: "mofle_1"

        producto = build :producto, :mofle, codigo: "mofle_1"
        expect(producto).to be_invalid
        expect(producto.errors.size).to eq 1
        expect(producto.errors["codigo"][0]).to eq "ya ha sido tomado"
      end
    end # context cuando el codigo fue tomado

    context "cuando el nombre fue tomado" do
      it "regresa un error" do
        create :producto, :mofle, nombre: "Mofle 1"

        producto = build :producto, :mofle, nombre: "Mofle 1"
        expect(producto).to be_invalid
        expect(producto.errors.size).to eq 1 
        expect(producto.errors["nombre"][0]).to eq "ya ha sido tomado"
      end
    end # context cuando el nombre fue tomado
  end # context validaciones
end
