// Домашнее задание по теме "Коллекции"

/*
 Исходный массив.
 */
let array = [1, 8, 4, 10, -254, 800, 1005, 12, -2, 32]

// Добавляем переменную для перечислений
let residual = (array.max() != nil && array.min() != nil ? array.max()! - array.min()! : nil)

/*
 Нужно вывести в консоль разность
 наибольшего и наименьшего элементов массива.
 */
print(residual != nil ? "Разность наибольшего и наименьшего элементов массива: \(residual!)" : "Массив пустой, невозможно вычислить разность.")
// Вместо пустой строки напишите ваше решение.


var numbers: [Int] = []
for i in stride(from: 1, to: 11, by: 1) {
    numbers.append(i)
}
print(numbers)

for i in 1...10 {
    numbers.append(i)
}
print(numbers)

