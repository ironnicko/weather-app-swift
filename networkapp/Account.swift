//
//  Account.swift
//  networkapp
//
//  Created by Nikhil Ivannan on 11/06/22.
//

import Foundation

struct Account : Codable, Hashable{
    let id: Int
    let name : String
    let category : String
    let description : String
    let wealth_type : String
    let balance : String
    let created_at : String
}
