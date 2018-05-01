# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products = Product.create!([
  {
    name: 'Product 1',
    unit: 'Bo',
    price: 10000,
    description: 'Description product 1',
    external_urls: 'www.google.com'
  },
  {
    name: 'Product 2',
    unit: 'Doi',
    price: 20000,
    description: 'Description product 2',
    external_urls: 'www.facebook.com'
  },
  {
    name: 'Product 3',
    unit: 'Cai',
    price: 30000,
    description: 'Description product 3',
    external_urls: 'www.microsoft.com'
  },
])

suppliers = Supplier.create!([
  {
    name: 'Supplier 1',
    address: 'Hoang Mai, Ha Noi',
    phone_number: '111111111',
    external_urls: 'www.facebook.com/supplier1'
  },
  {
    name: 'Supplier 2',
    address: 'Dong Da, Ha Noi',
    phone_number: '222222222',
    external_urls: 'www.facebook.com/supplier2'
  },
  {
    name: 'Supplier 3',
    address: 'Hai Ba Trung, Ha Noi',
    phone_number: '333333333',
    external_urls: 'www.facebook.com/supplier3'
  },
])

customers = Customer.create!([
  {
    name: 'Customer 1',
    address: 'Ha Noi',
    phone_number: '111111111',
    external_urls: 'www.facebook.com/customer1'
  },
  {
    name: 'Customer 2',
    address: 'Hai Phong',
    phone_number: '222222222',
    external_urls: 'www.facebook.com/customer2'
  },
  {
    name: 'Customer 3',
    address: 'Da Nang',
    phone_number: '333333333',
    external_urls: 'www.facebook.com/customer3'
  },
])

orders = Order.create([
  {
    customer: customers.first,
    shipping_address: customers.first.address,
    notes: 'Notes for first order',
    shipment_total: 10000,
    adjustment_total: -5000,
    order_items_attributes: [
      {
        product: products.first,
        price: products.first.price,
        quantity: 10,
      }
    ],
    state: 3
  },
  {
    customer: customers.second,
    shipping_address: customers.second.address,
    notes: 'Notes for second order',
    shipment_total: 20000,
    adjustment_total: 0,
    order_items_attributes: [
      {
        product: products.second,
        price: products.second.price,
        quantity: 20,
      }
    ]
  },
])

purchase_orders = PurchaseOrder.create!([
  {
    supplier: suppliers.first,
    notes: 'Notes for first purchase order',
    shipment_total: 10000,
    adjustment_total: -5000,
    purchase_order_items_attributes: [
      {
        product: products.first,
        price: products.first.price * 0.8,
        quantity: 20,
      }
    ],
    state: 2
  },
  {
    supplier: suppliers.second,
    notes: 'Notes for second purchase order',
    shipment_total: 20000,
    adjustment_total: 0,
    purchase_order_items_attributes: [
      {
        product: products.second,
        price: products.second.price * 0.8,
        quantity: 30,
      }
    ]
  },
])