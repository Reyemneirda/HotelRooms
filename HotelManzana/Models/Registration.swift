//
//  Registration.swift
//  HotelManzana
//
//  Created by Adrien Meyer on 12/13/17.
//  Copyright © 2017 Adrien Meyer. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    
    var price: Int
}

// Equatable Protocol Implementation for RoomType

func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}
