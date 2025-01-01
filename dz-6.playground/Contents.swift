/*
 Домашнее задание по теме "Обработка ошибок":
 1. Функция verifyAge должна возвращать true, если пользователь совершеннолетний.
 2. Функция verifyAge должна выбрасывать ошибку, если пользователь не является совершеннолетним. Для этого потребуется определить собственный тип ошибок на основе типа Error.
 3. Перехват ошибки при вызове verifyAge внутри print не требуется.
 */

// В этом месте нужно описать собственный тип ошибок.

enum AgeError: Error {
    case tooYoung
}

func verifyAge(_ age: UInt) throws -> Bool {
    if age < 18 {
        throw AgeError.tooYoung
    }
    return true
}

do {
    print(try verifyAge(24))
} catch AgeError.tooYoung {
    print("Too young")
}



//
let values: [Any] = [1, 2, 0.86, "Hello", true]
values.forEach { print(type(of: $0)) }
