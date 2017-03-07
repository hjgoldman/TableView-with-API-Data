//
//  PhotoCollectionViewController.swift
//  TableView with API Data
//
//  Created by Hayden Goldman on 3/6/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var customImageView: UIImageView!
    
}

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {
    
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        self.loadAPIData()
        
    }
    
    private func loadAPIData() {
        
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
                self.collectionView?.reloadData()
            }
            
            }.resume()
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
    
        // Configure the cell
        
        let photo = self.photos[indexPath.row]
        
        
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
