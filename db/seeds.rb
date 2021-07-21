# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: 'frontend')
Category.create(title: 'backend')
Category.create(title: 'devops')
User.create(email: 'sergey@example.com',
            password: '123456',
            confirm_password: '123456')
User.create(email: 'vasya@example.com',
            password: '123456',
            confirm_password: '123456')
User.create(email: 'petya@example.com',
            password: '123456',
            confirm_password: '123456')
Test.create(title: 'html',
            level: 1,
            category_id: 1)
Test.create(title: 'css',
            level: 1,
            category_id: 1)
Test.create(title: 'ruby',
            level: 2,
            category_id: 2)
Test.create(title: 'ansible',
            level: 2,
            category_id: 3)
Question.create(body: 'Что такое тег body',
                test_id: 1)
Question.create(body: 'Что такое тег head',
                test_id: 1)
Question.create(body: 'Какое css свойсвто меняет размер шрифта',
                test_id: 2)
Question.create(body: 'Какое css свойство меняет цвет шрифта',
                test_id: 2)
Question.create(body: 'Есть ли в ruby тип данных boolean',
                test_id: 3)
Question.create(body: 'Какой метод отдаст последний элемент массива',
                test_id: 3)
Question.create(body: 'нужен ли агент на хосте для ansible',
                test_id: 4)
Question.create(body: 'файлы какого типа использует ansible',
                test_id: 4)

UserTest.create(user_id: 1, test_id: 1)
UserTest.create(user_id: 1, test_id: 2)
UserTest.create(user_id: 2, test_id: 3)
UserTest.create(user_id: 2, test_id: 4)
UserTest.create(user_id: 3, test_id: 2)
UserTest.create(user_id: 3, test_id: 3)