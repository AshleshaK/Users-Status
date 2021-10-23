//
//  ViewController.swift
//  apiDemo
// In this project, a rest API has been taken and it's response has been stored inside a tableview.(Tableview, API Call, Data Passing by Protocol Delegate)
//  Created by Mac on 28/09/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayTodo = [ToDo]()
    
   
    @IBAction func reload(_ sender: Any) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        toDoApiCalling()
    }
    
    
    func toDoApiCalling() {
        let apiString = "https://jsonplaceholder.typicode.com/todos"
        if let apiUrl = URL(string: apiString) {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: apiUrl) { dataFromServer, response, error in
                print("dataFromServer is : \(dataFromServer)")
                
                guard let data = dataFromServer else {
                    print("Put Valid Data")
                    return
                }
                guard let json = try! JSONSerialization.jsonObject(with: data, options: [] ) as? [[String: Any]] else {
                    print("Array is Missing!")
                    return
                }
                
                print("Json is: \(json)")
                
                for todo in json {
                    let todo = ToDo(userId: (todo["userId"] as? Int ?? 0),
                                id:(todo["id"] as? Int ?? 0),
                                title: (todo["title"] as? String ?? ""),
                                taskStatus: (todo["completed"] as? Bool ?? false))
                    
                    self.arrayTodo.append(todo)
                    
                    print(self.arrayTodo)
                }
            }
                
            dataTask.resume()
        }
        else
        {
            print("Invalid URL")
        }

    }

}


//MARK: Table View Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayTodo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            
            let myData = self.arrayTodo[indexPath.row]
            
            cell.userIdLbl.text = "User ID"
            cell.idLbl.text = "ID"
            
            cell.userIdTxtField.text = String(myData.userId)
            cell.idTxtField.text = String(myData.id)
           
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myData = arrayTodo[indexPath.row]
        if let vc2 = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            
            vc2.user = myData
            self.navigationController?.pushViewController(vc2, animated: true)
        }
    }
}
