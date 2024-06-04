//
//  CountryViewController.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 04/06/24.
//

import UIKit

class CountryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = [WelcomeElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        fetchinhJsonCountry()
    }
    
    func fetchinhJsonCountry() {
        guard let fileLocation = Bundle.main.url(forResource: "country", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: fileLocation)
           // let result = try JSONDecoder().decode([WelcomeElement].self, from: data)
           // self.model = result
        } catch {
            print("Parsing Error")
        }
    }
}

// MARK: - TableView Dalegate & Datasource
extension CountryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        
        cell.nameLbl.text = model[indexPath.row].name
        cell.codeLbl.text = model[indexPath.row].code
        
        return cell
    }
}
