//
//  SecondViewController.swift
//  apiDemo
//
//  Created by Mac on 05/10/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var userIdVc2: UITextField!
    @IBOutlet weak var idVc2: UITextField!
    @IBOutlet weak var titleVc2: UITextView!
    @IBOutlet weak var statusVc2: UITextField!
    
    
    var userId: Int?
    var id: Int?
    var titleTxtView: String?
    var status: String?
    
    var user: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        userIdVc2.text = String(user!.userId)
        idVc2.text = String(user!.id)
        titleVc2.text = user!.title
        statusVc2.text = String(user!.taskStatus)
        
    }
    

}
