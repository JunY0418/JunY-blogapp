# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Article.create({title: '新しい記事です', content: '素晴らしい記事です。'})
Article.create({title: '②さらに新しい記事です', content: '②さらに素晴らしい記事です。'})
