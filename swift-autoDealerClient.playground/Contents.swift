import CoreGraphics
import Foundation
import Security
import UIKit

protocol Car {
    var model: String { get }
    var color: UIColor { get }
    var buildDate: Int { get }
    var price: Double { get set }
    var accessories: String { get set }
    var isServiced: Bool { get set }
}

protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars:[Car] { get set }
    var tagline: String { get }
    
    // method offers to buy additional equipment
    func offerAccessories(_ accessories: [String])
    
    // method sends the car for presale
    func presaleService(car: Car)
    
    // the method takes the car from the warehouse and sends it to the showroom
    // in this case, pre-sale preparation is performed
    func addToShowroom(car: Car)
    
    func sellCar(car: Car)
    
    // method - ordering a new car from the factory (adding a car to the warehouse parking)
    func orderCar()
}

// create a protocol that implements special offers for cars
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}

struct Volvo: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
    }
}

struct Haval: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
    }
}

struct Mazda: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
    }
}

struct Opel: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
    }
}

struct Subaru: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
    }
}

class VolvoDealer: Dealership {
    let name: String = "Official Volvo dealer"
    let showroomCapacity: Int = 100
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "The Ultimate Driving Machine"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    // method that simulates the execution of presales
    func presaleService(car: Car) {
        print("For the car \(car.model) pre-sale preparation has been completed!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // remove the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) transported from parking in \"\(self.name)\" to showroom")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    // method adding a new car to the parking lot
    func orderCar() {
        self.stockCars.append(contentsOf: volvoCars)
        for item in self.stockCars {
            print("\(item.model) added to parking lot in \"\(self.name)\"")
        }
        volvoCars = []
    }
}

// creating a class "Dealer of Haval brand" signed under the DealerShip protocol
class HavalDealer: Dealership {
    let name: String = "Official dealer of Haval"
    let showroomCapacity: Int = 50
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "I have all."
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    // method that simulates the execution of presales
    func presaleService(car: Car) {
        print("For the car \(car.model) pre-sale preparation has been completed!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // remove the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) transported from parking in \"\(self.name)\" to showroom")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    // method adding a new car to the parking lot
    func orderCar() {
        self.stockCars.append(contentsOf: havalCars)
        for item in self.stockCars {
            print("\(item.model) added to parking lot in \"\(self.name)\"")
        }
        havalCars = []
    }
}

// creating a class "Mazda Dealer" signed under the DealerShip protocol
class MazdaDealer: Dealership {
    let name: String = "Official dealer of Mazda"
    let showroomCapacity: Int = 90
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "Driving matters"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    // method that simulates the execution of presales
    func presaleService(car: Car) {
        print("For the car \(car.model) pre-sale preparation has been completed!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // remove the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) transported from parking in \"\(self.name)\" to showroom")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    // method adding a new car to the parking lot
    func orderCar() {
        self.stockCars.append(contentsOf: mazdaCars)
        for item in self.stockCars {
            print("\(item.model) added to parking lot in \"\(self.name)\"")
        }
        mazdaCars = []
    }
}

// creating a class "Dealer of the Opel brand" signed under the DealerShip protocol
class OpelDealer: Dealership {
    let name: String = "Official dealer of Opel"
    let showroomCapacity: Int = 100
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "Wir Leben Autos"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    // method that simulates the execution of presales
    func presaleService(car: Car) {
        print("For the car \(car.model) pre-sale preparation has been completed!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // remove the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) transported from parking in \"\(self.name)\" to showroom")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    // method adding a new car to the parking lot
    func orderCar() {
        self.stockCars.append(contentsOf: opelCars)
        for item in self.stockCars {
            print("\(item.model) added to parking lot in \"\(self.name)\"")
        }
        opelCars = []
    }
}

// creating a class "Dealer of Subaru brand" signed under the DealerShip protocol
class SubaruDealer: Dealership {
    let name: String = "Official Subaru Dealer"
    let showroomCapacity: Int = 120
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "Confidence in Motion"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    // method that simulates the execution of presales
    func presaleService(car: Car) {
        print("For the car \(car.model) pre-sale preparation has been completed!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // remove the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) transported from parking in \"\(self.name)\" to showroom")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    // method adding a new car to the parking lot
    func orderCar() {
        self.stockCars.append(contentsOf: subaruCars)
        for item in self.stockCars {
            print("\(item.model) added to parking lot in \"\(self.name)\"")
        }
        subaruCars = []
    }
}

// get cars from factories (create a collection of cars of different brands)
// Volvo cars
var volvoCars:[Car] = [Volvo(model: "Volvo XC90 Recharge", color: UIColor.blue, buildDate: 2021, price: 110_200, accessories: "Tinting", isServiced: false),
                       Volvo(model: "Volvo XC60 Recharge", color: UIColor.gray, buildDate: 2020, price: 100_000, accessories: "no", isServiced: false),
                       Volvo(model: "Volvo XC40 Recharge", color: UIColor.red, buildDate: 2021, price: 80_000, accessories: "Alarm system", isServiced: false),
                       Volvo(model: "Volvo XC90 Recharge", color: UIColor.green, buildDate: 2020, price: 200_000, accessories: "Tinting, alarm system, leather interior", isServiced: false)]

// Haval cars
var havalCars:[Car] = [Haval(model: "Haval Jolion", color: UIColor.blue, buildDate: 2020, price: 50_000, accessories: "no", isServiced: false),
                       Haval(model: "Haval Jolion", color: UIColor.red, buildDate: 2021, price: 70_000, accessories: "Tinting", isServiced: false),
                       Haval(model: "Haval F7", color: UIColor.gray, buildDate: 2021, price: 100_000, accessories: "Tinting, alarm system", isServiced: false),
                       Haval(model: "Haval F7x", color: UIColor.black, buildDate: 2021, price: 120_000, accessories: "Tinting, alarm system, leather interior", isServiced: false)]

// Mazda cars
var mazdaCars:[Car] = [Mazda(model: "Mazda CX-5", color: UIColor.red, buildDate: 2020, price: 75_000, accessories: "Tinting", isServiced: false),
                       Mazda(model: "Mazda CX-5", color: UIColor.white, buildDate: 2021, price: 50_000, accessories: "no", isServiced: false),
                       Mazda(model: "Mazda MX-5 RF", color: UIColor.black, buildDate: 2021, price: 100_000, accessories: "Tinting, alarm system", isServiced: false),
                       Mazda(model: "Mazda MX-5 RF", color: UIColor.blue, buildDate: 2020, price: 130_000, accessories: "Tinting, alarm system, leather interior", isServiced: false)]

// Opel cars
var opelCars:[Car] = [Opel(model: "Opel Astra", color: UIColor.green, buildDate: 2021, price: 30_000, accessories: "no", isServiced: false),
                      Opel(model: "Opel Mokka", color: UIColor.white, buildDate: 2021, price: 40_000, accessories: "no", isServiced: false),
                      Opel(model: "Opel Insignia", color: UIColor.black, buildDate: 2020, price: 100_000, accessories: "Tinting, alarm system", isServiced: false),
                      Opel(model: "Opel Insignia", color: UIColor.blue, buildDate: 2021, price: 120_000, accessories: "Tinting, alarm system, leather interior", isServiced: false)]

// Subaru cars
var subaruCars:[Car] = [Subaru(model: "Subaru Forester", color: UIColor.blue, buildDate: 2021, price: 75_000, accessories: "Tinting", isServiced: false),
                        Subaru(model: "Subaru XV", color: UIColor.green, buildDate: 2020, price: 60_000, accessories: "no", isServiced: false),
                        Subaru(model: "Subaru Forester", color: UIColor.red, buildDate: 2020, price: 100_000, accessories: "Tinting, alarm system", isServiced: false),
                        Subaru(model: "Subaru XV", color: UIColor.blue, buildDate: 2021, price: 80_000, accessories: "Tinting, alarm system, leather interior", isServiced: false)]

var volvoDealer = VolvoDealer() as Dealership & SpecialOffer
var havalDealer = HavalDealer() as Dealership & SpecialOffer
var mazdaDealer = MazdaDealer() as Dealership & SpecialOffer
var opelDealer = OpelDealer() as Dealership
var subaruDealer = SubaruDealer() as Dealership

extension VolvoDealer: SpecialOffer {
    // method that adds a first aid kit and a fire extinguisher to accessories
    func addEmergencyPack() {
        for var item in self.showroomCars {
            item.accessories += " + First aid kit + Fire extinguisher"
            print("In \(item.model) updated add. equipment: added first aid kit and fire extinguisher")
        }
    }
    
    // method that gives a 15% discount on last year's car
    func makeSpecialOffer() {
        for var item in self.showroomCars {
            if item.buildDate < 2021 {
                let oldPrice = Int(item.price)
                item.price *= 0.85
                print("The price of \(item.model) has been updated! She used to be \(oldPrice), and now it's - \(Int(item.price))")
            }
        }
    }
}

extension HavalDealer: SpecialOffer {
    // method that adds a first aid kit and a fire extinguisher to accessories
    func addEmergencyPack() {
        for var item in self.showroomCars {
            item.accessories += " + First aid kit + Fire extinguisher"
            print("In \(item.model) updated add. equipment: added first aid kit and fire extinguisher")
        }
    }
    
    // method that gives a 15% discount on last year's car
    func makeSpecialOffer() {
        for var item in self.showroomCars {
            if item.buildDate < 2021 {
                let oldPrice = Int(item.price)
                item.price *= 0.85
                print("The price of \(item.model) has been updated! She used to be \(oldPrice), and now it's - \(Int(item.price))")
            }
        }
    }
}

extension MazdaDealer: SpecialOffer {
    // method that adds a first aid kit and a fire extinguisher to accessories
    func addEmergencyPack() {
        for var item in self.showroomCars {
            item.accessories += " + First aid kit + Fire extinguisher"
            print("In \(item.model) updated add. equipment: added first aid kit and fire extinguisher")
        }
    }
    
    // method that gives a 15% discount on last year's car
    func makeSpecialOffer() {
        for var item in self.showroomCars {
            if item.buildDate < 2021 {
                let oldPrice = Int(item.price)
                item.price *= 0.85
                print("The price of \(item.model) has been updated! She used to be \(oldPrice), and now it's - \(Int(item.price))")
            }
        }
    }
}

var dealersArray: [Dealership] = [volvoDealer, havalDealer, mazdaDealer, opelDealer, subaruDealer]
for item in dealersArray {
    print("We are - \(item.name). Our tagline is: \"\(item.tagline)\"")
}

// add cars ordered by dealers to parking and showrooms
// Volvo car dealership - to the parking lot
volvoDealer.orderCar()
// Volvo showroom - to showroom
volvoDealer.addToShowroom(car: volvoDealer.stockCars[0])
volvoDealer.addToShowroom(car: volvoDealer.stockCars[0])

// Haval car dealership - to the parking lot
havalDealer.orderCar()
// Haval car dealership - to the showroom
havalDealer.addToShowroom(car: havalDealer.stockCars[0])
havalDealer.addToShowroom(car: havalDealer.stockCars[0])

// Mazda car dealership - to the parking lot
mazdaDealer.orderCar()
// Mazda car dealership - in the showroom
mazdaDealer.addToShowroom(car: mazdaDealer.stockCars[0])
mazdaDealer.addToShowroom(car: mazdaDealer.stockCars[0])

// Opel car dealership - to the parking lot
opelDealer.orderCar()
// Mazda car dealership - in the showroom
opelDealer.addToShowroom(car: opelDealer.stockCars[0])
opelDealer.addToShowroom(car: opelDealer.stockCars[0])

// Subaru car dealership - to the parking lot
subaruDealer.orderCar()
// Subaru showroom - to showroom
subaruDealer.addToShowroom(car: subaruDealer.stockCars[0])
subaruDealer.addToShowroom(car: subaruDealer.stockCars[0])

// add first aid kits and fire extinguishers to cars in the showroom
volvoDealer.addEmergencyPack()
havalDealer.addEmergencyPack()
mazdaDealer.addEmergencyPack()

// check if there is a car younger than 2021, and if so, give them a discount
volvoDealer.makeSpecialOffer()
havalDealer.makeSpecialOffer()
mazdaDealer.makeSpecialOffer()

