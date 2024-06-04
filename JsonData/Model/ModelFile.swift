//
//  ModelFile.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 04/06/24.
//

import Foundation
import UIKit

struct Welcome1Element: Codable {
    var id: String
    var employee_name: String
    var employee_salary: String
    var employee_age: String
}

struct WelcomeElement: Codable {
    var name: String
    var code: String
}
