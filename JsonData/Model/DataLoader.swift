//
//  DataLoader.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 04/06/24.
//

import Foundation
import HandyJSON

class DataLoader {
    static let shared = DataLoader()
    
    private init() {}
    
    func loadUsers(completion: @escaping (Result<[WelcomeElement], Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "country", withExtension: "json") else {
            let error = NSError(domain: "FileNotFoundError", code: -10002, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            if let jsonString = String(data: data, encoding: .utf8), let users = [WelcomeElement].deserialize(from: jsonString) as? [WelcomeElement] {
                completion(.success(users))
            } else {
                let error = NSError(domain: "ParsingError", code: -10003, userInfo: nil)
                completion(.failure(error))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
