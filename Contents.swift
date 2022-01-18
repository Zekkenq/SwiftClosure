import UIKit

var greeting = "Hello, playground"


let numbers = [1,12,60,7,12,36,63,75,8,11,9,2]



func filteredArray(array: [Int], f: (Int) -> Bool) -> [Int]{
    var filtred = [Int]()
    
    for i in array{
        if f(i){
            filtred.append(i)
        }
    }
    return filtred
}

/*
func compare(i : Int) -> Bool{
    return i % 2 == 0
}*/

filteredArray(array: numbers, f: {(i : Int) -> Bool in
    return i % 2 == 0
    
})

filteredArray(array: numbers, f: {(i : Int) -> Bool in
    return i < 10
    
})

let a =
filteredArray(array: numbers) {$0 % 3 == 0}

let b =
filteredArray(array: numbers) {$0 < 12}


let numbers2 = [1,2,3,4,5,6,7,8]

var count = 0

let c =
filteredArray(array: numbers) { value in
    
    for include in numbers2{
        count += 1
        if include == value {
            return true
        }
    }
    return false
}

count

count = 0

var dict = [Int:Bool]()
for value in numbers2{
    dict[value] = true
    
}


let d =
filteredArray(array: numbers) { value in
    count += 1
    return dict[value] != nil
}

count

let e =
filteredArray(array: numbers) {dict[$0] != nil}


/*1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
*/


func firstTask(f:() -> ()){
    
    for i in 1...10{
        print("\(i) + i")
    }
    f()
}
firstTask {
    print("end")
}

//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.


numbers.sorted()
print(numbers)
var numbers3 = numbers.sorted()
numbers3.reverse()
print(numbers3)

//or

print(numbers.sorted())
print(numbers.sorted{$0 > $1})


//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.

func filter(array: [Int], closure:(Int?, Int) -> Bool) -> Int? {
    var number: Int?
    for i in array{
        if closure(number, i){
            number = i
        }
    }
    return number
}


let numbers5 = [1,3,5,6,4,7,8,9,12,6]

let min =
filter(array: numbers5){$0 == nil || $0! > $1}

let max =
filter(array: numbers5){$0 == nil || $0! < $1}

print(min ?? 0)
print(max ?? 0)
