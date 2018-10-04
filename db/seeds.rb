# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create(
  [
    {
      name: 'Água',
      description: 'Marca Minalba 1,5L',
      price: 1.0,
      image: 'https://mambo.vteximg.com.br/arquivos/ids/207140/135287.jpg'
    }, {
      name: 'Salgado',
      description: 'Unidade',
      price: 2.0,
      image: 'https://lucrandocomsalgados.com.br/wp-content/uploads/2018/01/salgado.png'
    }, {
      name: 'Refrigerante',
      description: 'Lata 350ml',
      price: 3.0,
      image: 'https://decisaoentrega.fbitsstatic.net/img/p/refrigerante-coca-cola-lata-350ml-260249/427115-2.jpg?w=420&h=420&v=no-change'
    }
  ]
)

p "======Creating Reasons======"
reasons = Reason.create(
  [
    {
      name: 'Adicionar Estoque',
      action: 'add'
    }, {
      name: 'Remover Estoque',
      action: 'remove'
    }, {
      name: 'Venda',
      action: 'remove'
    }, {
      name: 'Cancelamento venda',
      action: 'add'
    }
  ]
)

p "======Creating WarehouseChange======"
warehouse_change = WarehouseChange.create(
  [
    {
      product_id: Product.first.id,
      reason_id: Reason.first.id,
      quantity: 100.0,
      created_at: (DateTime.now - 1.month).beginning_of_month
    },
    {
      product_id: Product.first.id,
      reason_id: Reason.all[1].id,
      quantity: 2.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 5.days
    },
    {
      product_id: Product.all[1].id,
      reason_id: Reason.first.id,
      quantity: 200.0,
      created_at: (DateTime.now - 10.days)
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.first.id,
      quantity: 300.0,
      created_at: (DateTime.now).beginning_of_month
    },
    {
      product_id: Product.all[1].id,
      reason_id: Reason.all[1].id,
      quantity: 2.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 10.days
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.all[1].id,
      quantity: 2.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 5.days
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.all[1].id,
      quantity: 2.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 5.days
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.all[1].id,
      quantity: 5.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 6.days
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.all[1].id,
      quantity: 10.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 7.days
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.all[1].id,
      quantity: 15.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 8.days
    },
    {
      product_id: Product.all[2].id,
      reason_id: Reason.all[1].id,
      quantity: 1.0,
      created_at: (DateTime.now - 1.month).beginning_of_month + 12.days
    }
  ]
)

p "======Creating Some Sales======"

3.times do
  random_product_id = Product.all.map{|p| p.id}.sample

  sale = Sale.new
  2.times {sale.sale_products.build}

  sale.sale_products.each do |sale_product|
    sale_product.product_id = random_product_id
    sale_product.quantity = [2, 3, 4, 5].sample
  end
  sale.save!
end

