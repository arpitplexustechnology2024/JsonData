//
//  ViewController.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 03/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = [Welcome1Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        fetchinhJsonArray()
    }
    
    func fetchinhJsonArray() {
        guard let fileLocation = Bundle.main.url(forResource: "employeeShit", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: fileLocation)
            let result = try JSONDecoder().decode([Welcome1Element].self, from: data)
            self.model = result
        } catch {
            print("Parsing Error")
        }
    }	
}

// MARK: - TableView Dalegate & Datasource -
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.idLbl.text = model[indexPath.row].id
        cell.nameLbl.text = model[indexPath.row].employee_name
        cell.salaryLbl.text = "$ \(model[indexPath.row].employee_salary)"
        cell.ageLbl.text = model[indexPath.row].employee_age
        
        return cell
    }
}
