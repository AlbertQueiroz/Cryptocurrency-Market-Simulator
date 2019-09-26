//
//  CotationsViewController.swift
//  ProjectX
//
//  Created by Albert on 16/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import CoreData

class CotationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var cotations: [CotationResource] = [] {
        didSet {
            //reload das views
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            cotations.forEach { print($0) }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Cotação"
        
        CotationApi.downloadCotationData { (cotationResources) in
            guard let cotationResources = cotationResources else {
                return }
            self.cotations = cotationResources
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         
            
        }
        // Do any additional setup after loading the view.
    }
    

}

extension CotationsViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cotations.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        cell.textLabel?.text = cotations[indexPath.row].name
        cell.textLabel?.textColor = .actionColor
        cell.detailTextLabel?.numberOfLines = 3
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.text = String(format: "R$ %.2f", cotations[indexPath.row].price)
        
//        let imageURL = cotations[indexPath.row].logo
//
//        let task = URLSession.shared.dataTask(with: imageURL){(data,response,error) in
//            if error == nil{
//                let loadedImage = UIImage(data: data!)
//
//                DispatchQueue.main.async {
//                    if let imageView = cell.imageView {
//                        imageView.image = loadedImage
//                    }
//                }
//            }
//        }
//        task.resume()
        cell.imageView?.image = UIImage(named: "Grupo 61")
        
        return cell
    }
}
