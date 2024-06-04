//
//  TableViewCell.swift
//  JsonData
//
//  Created by Arpit iOS Dev. on 03/06/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
