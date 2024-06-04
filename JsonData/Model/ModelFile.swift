//
//  ModelFile.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 04/06/24.
//

import Foundation
import UIKit
import HandyJSON

struct Welcome1Element: Codable {
    var id: String
    var employee_name: String
    var employee_salary: String
    var employee_age: String
}

struct WelcomeElement: HandyJSON {
    
    var name: String = ""
    var code: String = ""
}
