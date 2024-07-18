import Foundation

struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
}

let book1 = Book(title: "Guns, Gems, and Steel", author: "James Diamond", pages: 645, price: 20.4)
let book2 = Book(title: "God", author: "Rza Aslan", pages: 367, price: 12)

let sumClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = sumClosure(645, 367)

let totalPrices: (Double, Double) -> Double = {(a: Double, b: Double) -> Double in
    return a + b
}

let prices = totalPrices(book1.price, book2.price)

if book1.price > book2.price {
    "First book is more expensive"
    let difference: (Double, Double) -> Double = {(a: Double, b: Double) -> Double in
        if a > b {
            "A is higher than B"
            return a - b
        } else {
            "B is less than A"
            return b - a
        }
    }
    
    let minus = difference(book1.price, book2.price)
} else {
    "Second book is more expensive than first one..."
    let divide: (Double, Double) -> Double = { (a: Double, b: Double) -> Double in
        return a / b
    }
    
    let calc = divide(book1.price, book2.price)
}

struct Customer {
    let name: String
    let surname: String
    let age: Int
}

let customer1 = Customer(name: "Alice", surname: "William", age: 21)
let customer2 = Customer(name: "John", surname: "Doe", age: 22)

print(customer1)

//Weather ⬇️

enum Weather {
    case sunny
    case rainy
    case cloudy
    case snowy
}

func messaging(weather: Weather) {
    switch weather {
    case .sunny:
        "Today weather is very sunny!"
        break
    case .rainy:
        "Today weather is very rainy!"
        break
    case .cloudy:
        "Today weather is very cloudy!"
        break
    case .snowy:
        "Today weather is very snowy!"
        break
    }
}

// Library ⬇️

enum LibraryTypes {
    case book
    case magazine
}

enum CustomerOfLibrary {
    case id
    case name
    case surname
    case age
}

struct Libraries {
    var title: String
    var year: Int
    var pageCount: Int
    var borrowed: Bool
    var borrowedBy: String
    
    func getFunc() {
        "Title: \(title)"
        "Year: \(year)"
        if borrowed {
            "Status: \(title) has been borrowed by \(CustomerOfLibrary.name)"
        } else {
            "Status: available"
        }
    }
}

