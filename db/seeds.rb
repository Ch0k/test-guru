# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ title: 'frontend' },{ title: 'backend' },{ title: 'devops' }])
users = User.create([{  email: 'sergey@example.com',
                        password: '123456',
                        confirm_password: '123456'},
                     {  email: 'vasya@example.com',
                        password: '123456',
                        confirm_password: '123456'},
                     {  email: 'petya@example.com',
                        password: '123456',
                        confirm_password: '123456'}])
tests = Test.create([ {  title: 'html',
                        level: 1,
                        category_id: categories[0].id},
                      { title: 'css',
                        level: 1,
                        category_id: categories[1].id},
                      { title: 'ruby',
                        level: 2,
                        category_id: categories[2].id},
                      { title: 'ansible',
                        level: 2,
                        category_id: categories[2].id}])
Question.create([ { body: 'Что такое тег body',
                    test_id: tests[0].id},
                  { body: 'Что такое тег head',
                    test_id: tests[0].id},
                  { body: 'Какое css свойсвто меняет размер шрифта',
                    test_id: tests[1].id},
                  { body: 'Какое css свойство меняет цвет шрифта',
                    test_id: tests[1].id},
                  { body: 'Есть ли в ruby тип данных boolean',
                    test_id: tests[2].id},
                  { body: 'Какой метод отдаст последний элемент массива',
                    test_id: tests[2].id},
                  { body: 'нужен ли агент на хосте для ansible',
                    test_id: tests[3].id},
                  { body: 'файлы какого типа использует ansible',
                    test_id: tests[3].id}])

UserTest.create([ {user_id: users[0].id, test_id: tests[0].id},
                  {user_id: users[0].id, test_id: tests[1].id},
                  {user_id: users[1].id, test_id: tests[2].id},
                  {user_id: users[1].id, test_id: tests[3].id},
                  {user_id: users[2].id, test_id: tests[1].id},
                  {user_id: users[2].id, test_id: tests[2].id}])