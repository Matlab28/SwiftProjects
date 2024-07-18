import Foundation

enum Animal {
    case cat
    case dog
    case rabbit
    case hedgehog
}

let cat = Animal.cat
cat


if cat == Animal.cat {
    "This is a cat"
} else if cat == Animal.dog {
    "This is a dog"
} else {
    "This is something else"
}

switch cat {
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
case .rabbit:
    "This is a rabbit"
    break
case .hedgehog:
    "This is a hedgehog"
    break
}


enum ShortCut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = ShortCut.wwwUrl(path: URL(string: "https://apple.com")!)

switch wwwApple {
case .fileOrFolder(path: let path, name: let name):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(artist: let artist, songName: let songName):
    artist
    songName
    break
}


switch wwwApple {
case .fileOrFolder(let path, let name):
    path
    name
    break
case .wwwUrl(let path):
    path
    break
case .song(let artist, let songName):
    artist
    songName
    break
}


switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

let withoutYou = ShortCut.song(artist: "Symphony X", songName: "without You")


if case let .song(_, songName) = wwwApple {
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manifacturer: String, yearMade: Int)
    
    var manufacturer: String {
        switch self {
        case let .car( manufacturer, _),
            let .bike(manufacturer, _):
            return manufacturer
        }
    }
}


let car = Vehicle.car(manufacturer: "Tesla", model: "X")

car.manufacturer

let bike = Vehicle.bike(manifacturer: "HD", yearMade: 1987)

bike.manufacturer


enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊") {
    "Found the blush emoji"
    blush
} else {
    "This emaji doesn't exist"
}


if let snow = FavoriteEmoji(rawValue: "❄️") {
    "Snow exists?! Really?"
    snow
} else {
    "As expected, snow doesn't exist in our enum"
}


enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeigth = Height.medium
myHeigth.makeLong()
myHeigth

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(of operation: IntOperation? = nil) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}


let freeHand  = IntOperation.freeHand(.add(2, 4))
freeHand.calculateResult()
