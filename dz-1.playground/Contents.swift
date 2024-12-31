/*
 Количество яблок.
 */
let count: UInt = 23

/*
 Строка, содержащая слово "яблоко" в правильном склонении:
 яблоко, яблок, яблока.
 */
let apples = (count % 10 == 1 && count % 100 != 11) ? "яблоко" :
((count % 10 >= 2 && count % 10 <= 4) && !(count % 100 >= 12 && count % 100 <= 14)) ? "яблока" :
"яблок"
// Напишите ваше решение вместо пустой строки.
// Используйте условный тернарный оператор.

/*
 Примеры результата:
 В корзине 1 яблоко.
 В корзине 15 яблок.
 В корзине 154 яблока.
 */
let result = "В корзине \(count) \(apples)"
print(result)

/*
 Для проверки вашего решения
 запустите этот код
 со следующими значениями count:
 1, 15, 154.
 */



// Массивы
let arr = ["Для", "проверки", "вашего", "решения", "запустите", "этот", "код"]
print(!arr.isEmpty ? arr[arr.count - 2] : "Пусто")


// Callback
func greeting(before: () -> Void, for names: [String], completion: (Int) -> Void) {
    before()
    for name in names {
        print("Hello, \(name)!")
    }
    completion(names.count)
}
let names = ["Oleg", "Dmitriev", "Mary"]

greeting(before: {
    print("Hello all!")
}, for: names) {
    print("\($0) users!")
}

