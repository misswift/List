//
//  List.swift
//  ListForAvito
//
//  Created by Халим Магомедов on 26.08.2021.
//

import UIKit


struct List: Decodable {
    let company: Company
}

// MARK: - Company
struct Company: Decodable {
    var name: String?
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Decodable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}




