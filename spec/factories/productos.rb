FactoryBot.define do
  factory :producto do
    sequence(:nombre) { |n| "MyString #{n}" }
    sequence(:codigo) { |n| "mystring_#{n}" }
    existencia { 4 }
    descripcion { "MyText" }
    precio_de_compra { 10 }
    iva { 16 }
    type { "" }
    usuario

    trait :mofle do
      type { "Mofle" }
    end

    trait :junta do
      type { "Mofle" }
    end

    trait :aro do
      type { "Mofle" }
    end
  end
end
