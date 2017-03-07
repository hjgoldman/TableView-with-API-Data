//
//  PhotoInformationTableViewController.swift
//  TableView with API Data
//
//  Created by Hayden Goldman on 3/6/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
}

class PhotoInformationTableViewController: UITableViewController {
    
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadData()
        
    }
    
    private func loadData() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let dictionaries = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
            
            for dictionary in dictionaries {
                
                let id = dictionary["id"] as! Int
                let title = dictionary["title"] as! String
                let thumbnailUrl = dictionary["thumbnailUrl"] as! String
                
                let photo = Photo(id: id, title: title, thumbnailUrl: thumbnailUrl)
                
                self.photos.append(photo)
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
        return self.photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoInfoCell", for: indexPath) as! CustomTableViewCell

        let photo = self.photos[indexPath.row]
        
        cell.customLabel.text = photo.title
        
        
        DispatchQueue.global().async {
            
            
            let imageData = NSData(contentsOf: URL(string: photo.thumbnailUrl)!)
            let imagePhoto = UIImage(data: imageData as! Data)
            
            DispatchQueue.main.async {
                cell.customImageView.image = imagePhoto

            }
        }
        
        return cell
    }
 

 
}
