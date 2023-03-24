//
//  ViewController.swift
//  tableViewWithXibCreate
//
//  Created by Mac on 24/03/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var tableView: UITableView!
    var firstName:[String] = ["ghj","asddds","sdassad"]
    var lastName:[String] = ["patil","patil","patil"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let uinib = UINib(nibName: "dataShowTableViewCell", bundle: nil)
        tableView.register(uinib, forCellReuseIdentifier: "dataShowTableViewCell")
    }

    @IBAction func saveDataButton(_ sender: Any) {
        guard let addFirstName = firstNameTextField.text,addFirstName != "",let addLastName = lastNameTextField.text,addLastName != ""
        else {
            let alertBox = UIAlertController(title: "Empty Textfield", message: "Enter data please", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alertBox.addAction(alertAction)
            present(alertBox, animated: true)
            print("Enter Data")
            return  }
        firstName.append(addFirstName)
        lastName.append(addLastName)
        tableView.reloadData()
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88.0
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataShowTableViewCell", for: indexPath) as! dataShowTableViewCell
        cell.firstNameLabel.text = firstName[indexPath.row]
        //cell.firstNameLabel.backgroundColor = .black
        //cell.firstNameLabel.textColor = .blue
        cell.lastNameLabel.text = lastName[indexPath.row]
        //cell.lastNameLabel.textColor = .brown
        cell.backgroundColor = .green
    
        return cell
    }
    
    
}
