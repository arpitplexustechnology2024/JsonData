//
//  HandyJsonViewController.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 04/06/24.
//

import UIKit

class HandyJsonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [WelcomeElement] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
                tableView.delegate = self
                
                loadUsers()
            }
            
            func loadUsers() {
                DataLoader.shared.loadUsers { [weak self] result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let users):
                            self?.users = users
                            self?.tableView.reloadData()
                        case .failure(let error):
                            print("Failed to load users: \(error)")
                        }
                    }
                }
            }
            
            // MARK: - UITableViewDataSource
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return users.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
                let user = users[indexPath.row]
                cell.nameLbl.text = user.name
                cell.codeLbl.text = user.code
                return cell
            }
        }
