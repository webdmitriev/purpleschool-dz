/*
 Домашнее задание по теме "Функции".
 
 Напишите функцию getTextSize,
 которая принимает строку и возвращает длину этой строки в callback.
 
 Для тестирования вашего решения, раскомментируйте блок внизу файла.
 */

func getTextSize(_ name: String, completion: (Int) -> Void) {
    completion(name.count)
}

getTextSize("Привет!") { print("Длина строки: \($0)") }

