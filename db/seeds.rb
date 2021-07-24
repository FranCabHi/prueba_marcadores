# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 15.times do
#     Kind.create(
#         kind_name: Faker::Commerce.material
#     )
# end

# 20.times do
#     Category.create(
#         cat_name: Faker::Internet.slug,
#         parent_category_id: category_list.sample,
#         status: rand(0..1)
#     )
# end

Bookmark.delete_all
category_list = Category.all.pluck(:id)
kind_list = Kind.all.pluck(:id)
50.times do
    Bookmark.create(
        url: Faker::Internet.url,
        name: Faker::Commerce.product_name,
        category_id: category_list.sample,
        kind_id: kind_list.sample
    )
end
