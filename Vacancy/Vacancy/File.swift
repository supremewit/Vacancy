//
//  File.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 11. 10..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import Foundation


class Location: NSObject, NSCoding {
    let name:String
    /*var locationImage:UIImage? { get{
        if let _locationImage = self.locationImage {
            return UIImage(named: _locationImage)
        } else {
            return nil
        }*/
    var stores:[Store]?
    
    init(name:String) {
        self.name = name
        
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.stores = aDecoder.decodeObject(forKey: "stores") as? [Store]
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey:"name")
        aCoder.encode(self.stores, forKey:"stores")
        
        
    }
}




class Store: NSObject, NSCoding  {
    
    let name: String
    let address: String
    let price: Int
    var capacity: Int
    
    init(name: String, address: String, price: Int, capacity: Int) {
        self.name = name
        self.address = address
        self.price = price
        self.capacity = capacity
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.address = aDecoder.decodeObject(forKey: "address") as! String
        self.price = aDecoder.decodeInteger(forKey: "price")
        self.capacity = aDecoder.decodeInteger(forKey: "capacity")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.capacity, forKey: "capacity")
    }
    
    
    
    
    
    
}


class Reservation {
    var storename:String
    var dateAndTime:NSDate
    var reservator: String
    var storeAddress: String
    var parkOrNot: Bool
    var setReservation: Bool
    
    init() {
        self.storename = "Store"
        self.dateAndTime = NSDate()
        self.reservator = "사용자"
        self.storeAddress = "주소지"
        self.parkOrNot = false
        self.setReservation = false
    }
    
}


func dataSet() -> [Location] {
    
    var hongdaeLoc = Location(name: "홍대")
    var garosuLoc = Location(name: "가로수길")
    var gangnamLoc = Location(name: "강남")
    var seobukLoc = Location(name: "서북촌")
    var sharosuLoc = Location(name: "샤로수길")
    var yeoidoLoc = Location(name: "여의도")
    
    
    var jopokDduk = Store(name: "홍대 조폭떡볶이" , address: "마포구 어울마당로 60", price: 5000, capacity: 3)
    var trackThree = Store(name: "track03", address: "마포구 와우산로29다길 10", price: 8000, capacity: 2)
    var sujeongOkdol = Store(name: "수정옥돌 생소금구이", address: "마포구 어울마당로 146-1", price: 10000, capacity: 2)
    var hyobong = Store(name: "효봉포차", address: "마포구 와우산로18길 12", price: 8000, capacity: 2)
    var clubEvans = Store(name: "클럽에반스", address: "마포구 와우산로 63", price: 10000, capacity: 2)
    var yoonMil = Store(name: "윤씨밀방", address: "마포구 와우산로15길 15", price: 10000, capacity: 2)
    var badaSarang = Store(name: "바다회사랑", address: "마포구 동교로27길 60", price: 8000, capacity: 2)
    var peony = Store(name: "피오니", address: "마포구 어울마당로 56", price: 7000, capacity: 3)
    var puhaha = Store(name: "푸하하크림빵", address: "마포구 양화로19길 22-25", price: 5000, capacity: 3)

    hongdaeLoc.stores = [jopokDduk, trackThree, sujeongOkdol, hyobong, clubEvans, yoonMil, badaSarang, peony, puhaha]
    
    var betterThanBeep = Store(name: "베러댄비프", address: "강남구 도산대로11길 5", price: 3000, capacity: 3)
    var deuxAmi = Store(name: "듀자미", address: "강남구 도산대로11길 28", price: 4000, capacity: 3)
    var kingkongSteak = Store(name: "킹콩스테이크", address: "강남구 논현로175길 69",  price: 4000, capacity: 3)
    var elbonTheTable = Store(name: "엘본더테이블 본점", address: "강남구 논현로175길 88", price: 2000,  capacity: 4)
    var able = Store(name: "에이블", address: "강남구 압구정로14길 12", price: 5000, capacity: 4)
    
    garosuLoc.stores = [betterThanBeep, deuxAmi, kingkongSteak, elbonTheTable, able]
    
    var tokkiJung = Store(name: "토끼정", address: "강남구 봉은사로 1길" , price: 4000, capacity: 2)
    var shakeShak = Store(name: "쉑쉑버거", address: "강남구 강남대로 452", price: 5000, capacity: 10)
    var pasha = Store(name: "파샤", address: "서초구 서초대로로73길 12", price: 4000, capacity: 5)
    var witchKitchen = Store(name: "마녀주방", address: "강남구 강남대로94길 9", price: 5000, capacity: 3)
    var iHaveADream = Store(name: "아이해브어드림", address: "강남구 테헤란로5길 7", price: 4000, capacity: 2)
    var machoChef = Store(name: "마초쉐프", address: "강남대로98길 16", price: 5000, capacity: 3)
    
    gangnamLoc.stores = [tokkiJung, shakeShak, pasha, witchKitchen, iHaveADream, machoChef]

    
    var locArray = [hongdaeLoc, gangnamLoc, garosuLoc, seobukLoc, sharosuLoc, yeoidoLoc]
    
    return locArray
    
    
    
}

