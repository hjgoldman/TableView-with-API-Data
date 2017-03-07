//
//  UserInformationTableViewController.swift
//  TableView with API Data
//
//  Created by Hayden Goldman on 3/6/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class UserInformationTableViewController: UITableViewController {
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.loadData()
    
        
    }
    
    private func loadData() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let dictionaries = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
            
            for dictionary in dictionaries {
                
                let id = dictionary["id"] as! Int
                let name = dictionary["name"] as! String
                let username = dictionary["username"] as! String
                let email = dictionary["email"] as! String
//                let address = dictionary["address"] as! Address
                let phone = dictionary["phone"] as! String
                let website = dictionary["website"] as! String
//                let company = dictionary["company"] as! Company
                
                let user = User(id: id, name: name, username: username, email: email, phone: phone, website: website)
                
                self.users.append(user)
                
                
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            }.resume()

        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)

        let user = self.users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(user.id)    

        return cell
    }
    

}
