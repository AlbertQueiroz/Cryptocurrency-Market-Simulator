//
//  CotationsViewController.swift
//  ProjectX
//
//  Created by Albert on 16/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class CotationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Cotação"
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "BTC"
        
        cell.textLabel?.textColor = .actionColor
        
        cell.detailTextLabel?.text = "R$" + "0,00"
        cell.detailTextLabel?.textColor = .actionColor
        
        cell.backgroundColor = .primaryColor
        
        let image = UIImage(named: "Grupo 61")
        
        if let imageView = cell.imageView {
            imageView.image = image
        }
        return cell
    }
    

}
