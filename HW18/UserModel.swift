//
//  UserModel.swift
//  HW18
//
//  Created by Павел on 05.03.2023.
//

import Foundation

struct UserModel: Codable {
    let birth: Int
    let occupation: String
    let name, lastname: String
    let country: String
    
}
