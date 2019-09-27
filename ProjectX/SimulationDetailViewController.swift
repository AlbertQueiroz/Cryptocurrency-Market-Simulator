//
//  SimulationDetailViewController.swift
//  ProjectX
//
//  Created by Albert on 24/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class SimulationDetailViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    
    let coreDao = CoreDao<ResourceData>(with: "ProjectX")
    
    var resources: [ResourceData]?
    
    var detailIndex: Int?
    
    var resource: ResourceData? {
        didSet {
            DispatchQueue.main.async {
                self.reloadViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resources = coreDao.fetchAll()
        
        guard let resources = resources, let index = detailIndex else { return }
        resource = resources[index]
        
    }
    
    func reloadViews() {
        
        guard let resource = self.resource else {
            print("tururu...")
            return
        }
        
        textView.text = """
        Market: \(resource.market!)
        Market: \(resource.market!)
        Market: \(resource.market!)
        Market: \(resource.market!)
        """
        
    }
}
