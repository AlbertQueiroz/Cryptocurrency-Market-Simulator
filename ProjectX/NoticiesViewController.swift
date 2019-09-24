//
//  NoticiesViewController.swift
//  ProjectX
//
//  Created by Albert on 16/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import CryptoNewsApi

class NoticiesViewController: UIViewController{


    @IBOutlet var tableView: UITableView!
    
    var articles: [CCArticle] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notícias"
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let api = CryptoControlApi(apiKey: "b8d3767b03073fb38780eb1de50198ea")
        
        api.getTopNews { (error, articles) in
            if (error == CCErrors.invalidAPIKey) {
                print("bad api key")
                }
            
            if let art = articles {
                self.articles = art
                }
            }
        
            api.getTopNewsByCategory { (error, categories) in
                print(categories?.analysis.count)
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Alta no BitCoin"
        
        cell.textLabel?.textColor = .actionColor
        
        cell.detailTextLabel?.text = "De acordo com estatisticas bitcoin subiu 2%"
        cell.detailTextLabel?.textColor = .actionColor
        
        cell.backgroundColor = .primaryColor
        
        
        let image = UIImage(named: "folded-newspaper")
        
        if let imageView = cell.imageView {
            imageView.image = image
        }
        return cell
    }



extension NoticiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = articles[indexPath.row].title
        cell.textLabel?.textColor = .actionColor
        cell.detailTextLabel?.numberOfLines = 3
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.text = articles[indexPath.row].description
        
        return cell
        
    }
}
