import UIKit

//enum Planet: Int {
//    case mercury
//    case venus
//    case earth
//    case mars
//}
//
//let earth = Planet(rawValue: 2)
//
//let meaningOfLife = 42
//let doubleMeaning = 42 + 42
////print(meaningOfLife, doubleMeaning)
////print("hello there")
//
////print("Taylor" <= "Swift")
//
////let albums = ["Red", "1989", "Reputation"]
////for album in albums {
////    print("\(album) is on apple music!!")
////}
//
//func printHelp() {
//    let message = """
//Welcome to my first swift app
//
//Run this app inside a directory of images and
//My app will resize them all into thumbnails
//"""
//    print(message)
//}
//
////printHelp()
//
//func square(numbers: Int...) {
//    for num in numbers {
//        print("The square of \(num) is \(num * num)")
//    }
//}
//
////square(numbers: 1,2,3,4,5)
//
//let driving = { (vehicle: String) in
//    return "I'm driving in my \(vehicle)"
//}
////
////func travel(h: (String) -> String) -> (String) -> Void {
////    print("I'm getting ready to go.")
////    return {
////        h("Car")
////    }
////    print("I've arrived!")
////}
////
//////travel(action: driving)
//////travel {
//////    "I'm driving in my \($0) at \($1)km/h"
//////}
////
////let result = travel()
////result(driving)
//
//func travel() -> (String) -> Void {
//    var counter = 1
//
//    return {
//        print("\(counter). I'm going to \($0)")
//        counter += 1
//    }
//}
//
////let result = travel()
////result("London")
////result("Singapore")
//
//struct Sport {
//    var name: String
//    var isOlympicSport: Bool
//
//    var olympicStatus: String {
//        if isOlympicSport {
//            return "\(name) is an Olympic Sport"
//        } else {
//            return "\(name) is not an Olympic Sport"
//        }
//    }
//}
//
////var tennis = Sport(name: "Tennis", isOlympicSport: true)
////print(tennis.olympicStatus)
//
//struct Progress {
//    var task: String
//    var amount: Double {
//        didSet {
//            print("\(task) is now \(amount / 100 * 100)% complete")
//        }
//    }
//}
//
////var progress = Progress(task: "Loading Data", amount: 0)
////progress.amount = 30
////progress.amount = 70
////progress.amount = 100
//
////let string = "Do or do not, there is no try"
////print(string.count)
////print(string.sorted())
////print(string.uppercased())
//
//struct User {
//    var username: String
//
//    init() {
//        self.username = "Anonymous"
//        print("Created a new user!")
//    }
//}
//
////var user = User()
////print(user.username)
//
//struct FamilyTree {
//    init() {
//        print("Creating a family tree")
//    }
//}
//
////struct Person {
////    var name: String
////    lazy var familyTree = FamilyTree()
////
////    init(name: String) {
////        self.name = name
////    }
////}
//
////var ed = Person(name: "Ed")
////ed.familyTree
//
//class Person {
//    var name = "bob"
//
//    init() {
//        print("\(name) is created")
//    }
//
//    func printGreeting() {
//        print("Hello, I am \(name)")
//    }
//
//    deinit {
//        print("\(name) is no more")
//    }
//}

//for _ in 1...3 {
//    let person = Person()
//    person.printGreeting()
//}

//struct Test1 {
//    var name = "Bob"
//}
//
//class Test2 {
//    var name = "Bob"
//}
//
//let test1 = Test1()
//test1.name = "Tom"
//print(test1.name)
//
//let test2 = Test2()
//test2.name = "Tom"
//print(test2.name)

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My id is \(thing.id)")
}

displayID(thing: User(id: "9"))
