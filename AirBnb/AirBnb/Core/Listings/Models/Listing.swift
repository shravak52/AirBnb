//
//  Listing.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import Foundation
struct Listing: Identifiable , Codable, Hashable{
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrls: String
    let numberOfBeds: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBedrooms: Int
    var priceForNight : Int
    let latitude : Double
    let Longitude :  Double
    var imageUrls: [String]
    let address: String
    let city: String
    let state : String
    
    let title : String
    let raiting : Double
    var features: [ListingFeatures]
    var amenities : [ListingAmenities]
    var type: [ListingTypes]
    
}
enum ListingFeatures: Int, Codable, Identifiable, Hashable{
    case selfCheckIn
    case superHost
    var imagesName: String{
        switch self{
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    var title: String{
        switch self{
        case .selfCheckIn: return "Self-Check-in"
        case .superHost: return "Superhost"
        }
    }
    var subtitle: String{
        switch self{
        case .selfCheckIn: return "Check yourself with in keypad."
        case .superHost: return "Superhost are experiened, highly rated hosts who are commited to provideing great stars for guests."
        }
    }
    var id : Int {return  self.rawValue}
}
enum ListingAmenities : Int, Codable, Identifiable, Hashable{
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String{
        switch self{
        case .pool: return "Pool"
        case .kitchen : return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry :return "Laundry"
        case .tv :return "TV"
        case .alarmSystem: return "Alarm System"
        case .office : return "Office"
        case .balcony : return "Balcony"
        }
    }
     
    var imageName: String {
        switch self{
        case .pool: return "figure.pool.swim"
        case .kitchen : return "fork.knife"
        case .wifi: return "wifi"
        case .laundry :return "washer"
        case .tv :return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office : return "pencil.and.ruler.fill"
        case .balcony : return "building"
        }
    }
    var id: Int { self.rawValue}
}

enum ListingTypes : Int, Codable, Identifiable, Hashable{
    case apartment
    case house
    case townHouse
    case vila
    var description : String{
        switch self{
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town House"
        case .vila: return "Villa"
        }
    }
    var id: Int{
        return self.rawValue
    }
}
