# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
    { category_name: '東京' },
    { category_name: '埼玉' },
    { category_name: '千葉'},
    { category_name: '神奈川'},
    { category_name: '群馬'},
    { category_name: '栃木'},
    { category_name: '茨城'}
    ])