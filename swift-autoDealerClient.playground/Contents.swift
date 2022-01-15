import CoreGraphics
import Foundation
import Security
import UIKit

// enumeration with possible errors
enum SomeError: Error {
    case notFound
    case wrongPlace
    case unauthorized
    case unexpected
}

protocol Car {
    var model: String { get }                           // car brand
    var color: UIColor { get }                          // car color
    var buildDate: Int { get }                          // date of manufacture
    var price: Double { get set }                       // price
    var accessories: String { get set }                 // additional accessories
    var isServiced: Bool { get set }                    // is the vehicle ready for sale
    var isDiscount: Bool { get set }                    // is there a discount applied to the car
}

protocol Dealership {
    var name: String { get }                            // dealer name
    var showroomCapacity: Int { get }                   // capacity
    var stockCars: [Car] { get set }                    // cars in the parking lot
    var showroomCars: [Car] { get set }                 // cars in showroom
    var cars:[Car] { get set }                          // all cars
    var tagline: String { get }                         // brand's tagline
    
    // method offers to buy additional equipment
    func offerAccessories(_ accessories: [String])
    
    // method sends the car for pre-sale preparation
    func presaleService(car: Car)
    
    // method takes the car from the warehouse and sends it to the showroom
    // at the same time, pre-sale preparation is carried out
    func addToShowroom(car: Car)
    
    // the method sells the car from the dealership, it checks if the preparation is done
    func sellCar(car: Car)
    
    // method - ordering a new car from the factory (adding a car to the warehouse parking lot)
    func orderCar()
}

// the protocol responsible for the special offer for cars
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer() throws
    func checkCarsForSpecialOffer()
    func checkStockCars()
}

struct Volvo: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    var isDiscount: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool, isDiscount: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
        self.isDiscount = isDiscount
    }
}

struct Haval: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    var isDiscount: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool, isDiscount: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
        self.isDiscount = isDiscount
    }
}

struct Mazda: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    var isDiscount: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool, isDiscount: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
        self.isDiscount = isDiscount
    }
}

struct Opel: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    var isDiscount: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool, isDiscount: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
        self.isDiscount = isDiscount
    }
}

struct Subaru: Car {
    var model: String
    var color: UIColor
    var buildDate: Int
    var price: Double
    var accessories: String
    var isServiced: Bool
    var isDiscount: Bool
    
    init(model: String, color: UIColor, buildDate: Int, price: Double, accessories: String, isServiced: Bool, isDiscount: Bool) {
        self.model = model
        self.color = color
        self.buildDate = buildDate
        self.price = price
        self.accessories = accessories
        self.isServiced = isServiced
        self.isDiscount = isDiscount
    }
}

class VolvoDealer: Dealership {
    let name: String = "Official dealer of Volvo"
    let showroomCapacity: Int = 100
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "The Ultimate Driving Machine"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    func presaleService(car: Car) {
        print("Pre-sale preparation has been completed for the: \(car.model)!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // removal of the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) && (item.isDiscount == car.isDiscount) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) moved from parking to showroom in \"\(self.name)\"")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    func orderCar() {
        self.stockCars.append(contentsOf: volvoCars)
        for item in self.stockCars {
            print("\(item.model) added to parking in \"\(self.name)\"")
        }
        // clearing out the warehouse
        volvoCars = []
    }
}

class HavalDealer: Dealership {
    let name: String = "Official dealer of Haval"
    let showroomCapacity: Int = 50
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "I have all"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    func presaleService(car: Car) {
        print("Pre-sale preparation has been completed for the: \(car.model)!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // removal of the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) && (item.isDiscount == car.isDiscount) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) moved from parking to showroom in \"\(self.name)\"")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}

    func orderCar() {
        self.stockCars.append(contentsOf: havalCars)
        for item in self.stockCars {
            print("\(item.model) added to parking in \"\(self.name)\"")
        }
        // clearing out the warehouse
        havalCars = []
    }
}

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

    func presaleService(car: Car) {
        print("Pre-sale preparation has been completed for the: \(car.model)!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // removal of the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) && (item.isDiscount == car.isDiscount) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) moved from parking to showroom in \"\(self.name)\"")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    func orderCar() {
        self.stockCars.append(contentsOf: mazdaCars)
        for item in self.stockCars {
            print("\(item.model) added to parking in \"\(self.name)\"")
        }
        // clearing out the warehouse
        mazdaCars = []
    }
}

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

    func presaleService(car: Car) {
        print("Pre-sale preparation has been completed for the: \(car.model)!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // removal of the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) && (item.isDiscount == car.isDiscount) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) moved from parking to showroom in \"\(self.name)\"")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    func orderCar() {
        self.stockCars.append(contentsOf: opelCars)
        for item in self.stockCars {
            print("\(item.model) added to parking in \"\(self.name)\"")
        }
        // clearing out the warehouse
        opelCars = []
    }
}

class SubaruDealer: Dealership {
    let name: String = "Official dealer of Subaru"
    let showroomCapacity: Int = 120
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars:[Car] = []
    let tagline = "Confidence in Motion"
    
    func offerAccessories(_ accessories: [String]) {
        print("Would you like to additionally purchase: \(accessories)?")
    }
    
    func presaleService(car: Car) {
        print("Pre-sale preparation has been completed for the: \(car.model)!")
    }
    
    // method that sends the car from the parking lot to the showroom
    func addToShowroom(car: Car) {
        if self.stockCars.isEmpty {
            print("We can't add anything to the showroom - there are no cars in the parking lot!")
        } else {
            self.showroomCars.append(car)
            // removal of the car from the parking lot
            var index = 0
            for item in self.stockCars {
                if (item.model == car.model) && (item.color == car.color) && (item.buildDate == car.buildDate) && (item.price == car.price) && (item.accessories == car.accessories) && (item.isServiced == car.isServiced) && (item.isDiscount == car.isDiscount) {
                    self.stockCars.remove(at: index)
                    print("\(car.model) moved from parking to showroom in \"\(self.name)\"")
                }
                index += 1
            }
            print("\(car.model) added to showroom in \"\(self.name)\"")
            self.presaleService(car: car)
        }
    }
    
    func sellCar(car: Car) {}
    
    func orderCar() {
        self.stockCars.append(contentsOf: subaruCars)
        for item in self.stockCars {
            print("\(item.model) added to parking in \"\(self.name)\"")
        }
        // clearing out the warehouse
        subaruCars = []
    }
}


// we receive cars from factories (we create a collection of cars of different brands)
// Volvo cars
var volvoCars:[Car] = [Volvo(model: "Volvo XC90 Recharge", color: UIColor.blue, buildDate: 2019, price: 110_200, accessories: "Toning", isServiced: false, isDiscount: true),
                       Volvo(model: "Volvo XC60 Recharge", color: UIColor.gray, buildDate: 2020, price: 100_000, accessories: "No", isServiced: false, isDiscount: false),
                       Volvo(model: "Volvo XC40 Recharge", color: UIColor.red, buildDate: 2021, price: 80_000, accessories: "Car alarm system", isServiced: false, isDiscount: false),
                       Volvo(model: "Volvo XC90 Recharge", color: UIColor.green, buildDate: 2020, price: 200_000, accessories: "Car alarm system, toning, leather interior", isServiced: false, isDiscount: true)]

// Haval cars
var havalCars:[Car] = [Haval(model: "Haval Jolion", color: UIColor.blue, buildDate: 2019, price: 50_000, accessories: "No", isServiced: false, isDiscount: false),
                       Haval(model: "Haval Jolion", color: UIColor.red, buildDate: 2021, price: 70_000, accessories: "Tonins", isServiced: false, isDiscount: true),
                       Haval(model: "Haval F7", color: UIColor.gray, buildDate: 2021, price: 100_000, accessories: "Toning, car alarm system", isServiced: false, isDiscount: false),
                       Haval(model: "Haval F7x", color: UIColor.black, buildDate: 2021, price: 120_000, accessories: "Car alarm system, toning, leather interior", isServiced: false, isDiscount: true)]

// Mazda cars
var mazdaCars:[Car] = [Mazda(model: "Mazda CX-5", color: UIColor.red, buildDate: 2019, price: 75_000, accessories: "Toning", isServiced: false, isDiscount: false),
                       Mazda(model: "Mazda CX-5", color: UIColor.white, buildDate: 2019, price: 50_000, accessories: "No", isServiced: false, isDiscount: true),
                       Mazda(model: "Mazda MX-5 RF", color: UIColor.black, buildDate: 2019, price: 100_000, accessories: "Toning, car alarm system", isServiced: false, isDiscount: false),
                       Mazda(model: "Mazda MX-5 RF", color: UIColor.blue, buildDate: 2022, price: 130_000, accessories: "Car alarm system, toning, leather interior", isServiced: false, isDiscount: true)]

// Opel cars
var opelCars:[Car] = [Opel(model: "Opel Astra", color: UIColor.green, buildDate: 2019, price: 30_000, accessories: "No", isServiced: false, isDiscount: false),
                      Opel(model: "Opel Mokka", color: UIColor.white, buildDate: 2021, price: 40_000, accessories: "No", isServiced: false, isDiscount: false),
                      Opel(model: "Opel Insignia", color: UIColor.black, buildDate: 2020, price: 100_000, accessories: "Toning, car alarm system", isServiced: false, isDiscount: true),
                      Opel(model: "Opel Insignia", color: UIColor.blue, buildDate: 2021, price: 120_000, accessories: "Toning, car alarm system, leather interior", isServiced: false, isDiscount: true)]

// Subaru cars
var subaruCars:[Car] = [Subaru(model: "Subaru Forester", color: UIColor.blue, buildDate: 2019, price: 75_000, accessories: "Toning", isServiced: false, isDiscount: false),
                        Subaru(model: "Subaru XV", color: UIColor.green, buildDate: 2020, price: 60_000, accessories: "No", isServiced: false, isDiscount: true),
                        Subaru(model: "Subaru Forester", color: UIColor.red, buildDate: 2020, price: 100_000, accessories: "Toning, car alarm system", isServiced: false, isDiscount: false),
                        Subaru(model: "Subaru XV", color: UIColor.blue, buildDate: 2021, price: 80_000, accessories: "Toning, car alarm system, leather interior", isServiced: false, isDiscount: true)]

// we create instances of classes and once again cast them to the "Dealership" and "SpecialOffer" protocols
var volvoDealer = VolvoDealer() as Dealership & SpecialOffer
var havalDealer = HavalDealer() as Dealership & SpecialOffer
var mazdaDealer = MazdaDealer() as Dealership & SpecialOffer
var opelDealer = OpelDealer() as Dealership
var subaruDealer = SubaruDealer() as Dealership

// extending the VolvoDealer class
extension VolvoDealer: SpecialOffer {
    
    // method that adds a first aid kit and a fire extinguisher to the list of accessories
    func addEmergencyPack() {
        var index = 0
        for item in self.showroomCars {
            self.showroomCars[index].accessories += " + First aid kit + Fire extinguisher"
            print("The car \(item.model) has an add. equipment: first aid kit and fire extinguisher added")
        }
        index += 1
    }
    
    func checkCarsForSpecialOffer() {
        do {
            try self.makeSpecialOffer()
        } catch SomeError.notFound {
            print("Error. Vehicle not eligible")
        } catch {
            print("An unexpected error occurred during validation")
        }
    }
    
    func checkStockCars() {
        do {
            try self.checkingParkingAndTrytoCatchErrors()
        } catch SomeError.wrongPlace {
            print("Error. Discount car is in the parking lot! Urgently put in the showroom!")
        } catch {
            print("An unexpected error occurred during validation")
        }
    }
    
    // method that gives a 15% discount on last year's car
    func makeSpecialOffer() throws {
        var index = 0
        for item in self.showroomCars {
            if item.buildDate < 2021 {
                let oldPrice = Int(item.price)
                self.showroomCars[index].price *= 0.85
                self.showroomCars[index].isDiscount = true
                print("The price of the \(item.model) has been updated! It used to be - \(oldPrice), but now - \(Int(self.showroomCars[index].price))")
            } else {
                // if there is no such car - we throw an error up
                throw SomeError.notFound
            }
            index += 1
        }
    }
    
    // additional parking check
    func checkingParkingAndTrytoCatchErrors() throws {
        for stockCar in self.stockCars {
            if stockCar.isDiscount == true {
                self.showroomCars.append(stockCar)
            } else {
                throw SomeError.wrongPlace
            }
        }
    }
}

// расширяем класс HavalDealer
extension HavalDealer: SpecialOffer {
    
    // method that adds a first aid kit and a fire extinguisher to the list of accessories
    func addEmergencyPack() {
        var index = 0
        for item in self.showroomCars {
            self.showroomCars[index].accessories += " + First aid kit + Fire extinguisher"
            print("The car \(item.model) has an add. equipment: first aid kit and fire extinguisher added")
        }
        index += 1
    }
    
    func checkCarsForSpecialOffer() {
        do {
            try self.makeSpecialOffer()
        } catch SomeError.notFound {
            print("Error. Vehicle not eligible")
        } catch {
            print("An unexpected error occurred during validation")
        }
    }
    
    func checkStockCars() {
        do {
            try self.checkingParkingAndTrytoCatchErrors()
        } catch SomeError.wrongPlace {
            print("Error. Discount car is in the parking lot! Urgently put in the showroom!")
        } catch {
            print("An unexpected error occurred during validation")
        }
    }
    
    // method that gives a 15% discount on last year's car
    func makeSpecialOffer() throws {
        var index = 0
        for item in self.showroomCars {
            if item.buildDate < 2021 {
                let oldPrice = Int(item.price)
                self.showroomCars[index].price *= 0.85
                self.showroomCars[index].isDiscount = true
                print("The price of the \(item.model) has been updated! It used to be - \(oldPrice), but now - \(Int(self.showroomCars[index].price))")
            } else {
                // if there is no such car - we throw an error up
                throw SomeError.notFound
            }
            index += 1
        }
    }
    
    // additional parking check
    func checkingParkingAndTrytoCatchErrors() throws {
        for stockCar in self.stockCars {
            if stockCar.isDiscount == true {
                self.showroomCars.append(stockCar)
            } else {
                throw SomeError.wrongPlace
            }
        }
    }
}

// расширяем класс MazdaDealer
extension MazdaDealer: SpecialOffer {
    
    // method that adds a first aid kit and a fire extinguisher to the list of accessories
    func addEmergencyPack() {
        var index = 0
        for item in self.showroomCars {
            self.showroomCars[index].accessories += " + First aid kit + Fire extinguisher"
            print("The car \(item.model) has an add. equipment: first aid kit and fire extinguisher added")
        }
        index += 1
    }
    
    func checkCarsForSpecialOffer() {
        do {
            try self.makeSpecialOffer()
        } catch SomeError.notFound {
            print("Error. Vehicle not eligible")
        } catch {
            print("An unexpected error occurred during validation")
        }
    }
    
    func checkStockCars() {
        do {
            try self.checkingParkingAndTrytoCatchErrors()
        } catch SomeError.wrongPlace {
            print("Error. Discount car is in the parking lot! Urgently put in the showroom!")
        } catch {
            print("An unexpected error occurred during validation")
        }
    }
    
    // method that gives a 15% discount on last year's car
    func makeSpecialOffer() throws {
        var index = 0
        for item in self.showroomCars {
            if item.buildDate < 2021 {
                let oldPrice = Int(item.price)
                self.showroomCars[index].price *= 0.85
                self.showroomCars[index].isDiscount = true
                print("The price of the \(item.model) has been updated! It used to be - \(oldPrice), but now - \(Int(self.showroomCars[index].price))")
            } else {
                // if there is no such car - we throw an error up
                throw SomeError.notFound
            }
            index += 1
        }
    }
    
    // additional parking check
    func checkingParkingAndTrytoCatchErrors() throws {
        for stockCar in self.stockCars {
            if stockCar.isDiscount == true {
                self.showroomCars.append(stockCar)
            } else {
                throw SomeError.wrongPlace
            }
        }
    }
}

var dealersArray: [Dealership] = [volvoDealer, havalDealer, mazdaDealer, opelDealer, subaruDealer]
for item in dealersArray {
    print("We are - \(item.name). Our tagline is: \"\(item.tagline)\"")
}

// add cars ordered by dealers to the parking lot and showrooms

volvoDealer.orderCar()
volvoDealer.addToShowroom(car: volvoDealer.stockCars[0])
volvoDealer.addToShowroom(car: volvoDealer.stockCars[0])
volvoDealer.addToShowroom(car: volvoDealer.stockCars[0])

havalDealer.orderCar()
havalDealer.addToShowroom(car: havalDealer.stockCars[0])
havalDealer.addToShowroom(car: havalDealer.stockCars[0])

mazdaDealer.orderCar()
mazdaDealer.addToShowroom(car: mazdaDealer.stockCars[0])
mazdaDealer.addToShowroom(car: mazdaDealer.stockCars[0])
mazdaDealer.addToShowroom(car: mazdaDealer.stockCars[0])
mazdaDealer.addToShowroom(car: mazdaDealer.stockCars[0])

opelDealer.orderCar()
opelDealer.addToShowroom(car: opelDealer.stockCars[0])
opelDealer.addToShowroom(car: opelDealer.stockCars[0])
opelDealer.addToShowroom(car: opelDealer.stockCars[0])

subaruDealer.orderCar()
subaruDealer.addToShowroom(car: subaruDealer.stockCars[0])
subaruDealer.addToShowroom(car: subaruDealer.stockCars[0])

// add first-aid kits and fire extinguishers to cars in the showroom
volvoDealer.addEmergencyPack()
havalDealer.addEmergencyPack()
mazdaDealer.addEmergencyPack()

print("")

// we will check if there are cars younger than 2021, and if so, we will provide a discount on them
volvoDealer.checkCarsForSpecialOffer()
havalDealer.checkCarsForSpecialOffer()
mazdaDealer.checkCarsForSpecialOffer()

// checking parking lots for discounted cars
// if there is one, we send it to the showroom
volvoDealer.checkStockCars()
havalDealer.checkStockCars()
mazdaDealer.checkStockCars()
