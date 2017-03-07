//
//  User.swift
//  TableView with API Data
//
//  Created by Hayden Goldman on 3/6/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import Foundation

class User {
    
    var id :Int
    var name :String
    var username :String
    var email :String
//    var address :Address
    var phone :String
    var website :String
//    var company :Company
    
    init(id :Int, name :String, username :String, email :String, phone :String, website :String) {
        
        self.id = id
        self.name = name
        self.username = username
        self.email = email
//        self.address = address
        self.phone = phone
        self.website = website
//        self.company = company
        
    }
    
    
}

class Address {
    
    var street :String
    var suite :String
    var city :String
    var zipcode :String
    var geo :Geo
    
    init(street :String, suite :String, city :String, zipcode :String, geo :Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    
    
}

class Geo {
    
    var lat :String
    var lng :String
    
    init(lat :String, lng :String) {
        self.lat = lat
        self.lng = lng
    }
    
}

class Company {
    
    var name :String
    var catchPhrase :String
    var bs :String
    
    init(name :String, catchPhrase :String, bs :String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
}
