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



reasons = Reason.create(
  [
    {
      name: 'Adicionar Estoque',
      action: 'add'
    }, {
      name: 'Remover Estoque',
      action: 'remove'
    }
  ]
)

warehouse_change = WarehouseChange.create(
  [
    {
      product_id: Product.first.id,
      reason_id: Reason.first.id,
      quantity: 10.0
    },
    {
      product_id: Product.first.id,
      reason_id: Reason.all[1].id,
      quantity: 2.0
    }
  ]
)
