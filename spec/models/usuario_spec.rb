require "rails_helper"

RSpec.describe Usuario, type: :model do
  context "validaciones" do
    it "es valido" do
      usuario = build :usuario

      expect(usuario).to be_valid
    end

    it "es invalido" do
      usuario = build :usuario, username: nil

      expect(usuario).to be_invalid
      expect(usuario.errors.size).to eq 1
      expect(usuario.errors[:username][0]).to eq "no puede estar en blanco"
    end

    context "cuando el username fue tomado" do
      it "regresa un mensaje de error" do
        create :usuario, username: "Mateo"

        usuario = build :usuario, username: "mateo"
        expect(usuario).to be_invalid
        expect(usuario.errors.size).to eq 1
        expect(usuario.errors[:username][0]).to eq "ya ha sido tomado"
      end
    end # context cuando el username fue tomado
  end # context validaciones
end
