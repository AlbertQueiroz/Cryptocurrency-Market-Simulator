//
//  NoticiesViewController.swift
//  ProjectX
//
//  Created by Albert on 16/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class NoticiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

//    var webView:WKWebView!
    
    @IBOutlet var tableView: UITableView!
    
    var articles: [LatestNewsResource] = [] {
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
        
//        let url = URL(string :"https://www.google.com")!
//        webView.load(URLRequest(url:url))
//
        NewApi.downloadNewsData{(latestNewsResources) in
            guard let latestNewsResource = latestNewsResources else{ return }
            self.articles = latestNewsResources!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = web
//    }
}

extension NoticiesViewController {
    
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
        
//        if
//            let urlString = articles[indexPath.row].image_article,
//            let imageURL = URL(string: urlString) {
//
//            let task = URLSession.shared.dataTask(with: imageURL) {
//                (data,response,error) in
//
//                if error == nil{
//                    let loadedImage = UIImage(data: data!)
//
//                    DispatchQueue.main.async {
//                        if let imageView = cell.imageView {
//                            imageView.image = loadedImage
//                            cell.layoutSubviews()
//                        }
//                    }
//
//                }
//            }
//            task.resume()
//
//        } else {
        
            cell.imageView?.image = UIImage(named: "folded-newspaper")
        
//        }
        
        return cell
    }
}
