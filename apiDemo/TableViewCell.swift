//
//  TableViewCell.swift
//  apiDemo
//
//  Created by Mac on 28/09/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    
    
    @IBOutlet weak var userIdTxtField: UITextField!
    @IBOutlet weak var idTxtField: UITextField!
  
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
    
}
