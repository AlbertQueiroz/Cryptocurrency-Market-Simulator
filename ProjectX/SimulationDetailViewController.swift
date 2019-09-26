//
//  SimulationDetailViewController.swift
//  ProjectX
//
//  Created by Albert on 24/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class SimulationDetailViewController: UIViewController {

    var resource: Resource? {
        didSet {
            DispatchQueue.main.async {
                self.reloadViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ApiManager.downloadSimulationData { (simulationData) in
//            guard let simulationData = simulationData else { return }
//            self.resource = simulationData
//        }
        
    }
    
    func reloadViews() {
        
        guard let resource = self.resource else {
            print("tururu...")
            return
        }
        
        //atualiza views acesando resource
        
        //            self.navigationItem.title = "raji"
        //            self.totalLabel.text = "total: \(NSString(format: "%.2f",resource.total) as String)"
        //            self.marketLabel.text = "market: \(resource.market)"
        //            self.initialDateLabel.text = "initialDate: \(resource.initialDate)"
        //            self.gainPercentageLabel.text = "gainPercentage: \(NSString(format: "%.2f",resource.gainPercentage) as String)"
        //            self.baseInvestimentLabel.text = "baseInvestiment: \(NSString(format: "%.2f",resource.baseInvestiment) as String)"
        //            self.currentPriceLabel.text = "currentPrice: \(NSString(format: "%.2f",resource.currentPrice) as String)"
        //            self.gainPriceLabel.text = "gainPriceUSD: \(NSString(format: "%.2f",resource.gainPriceUSD) as String)"
        //            self.totalLabel.text = "total: \(NSString(format: "%.2f",resource.total) as String)"
        //            self.pastPriceLabel.text = "pastPrice: \(NSString(format: "%.2f",resource.pastPrice) as String)"
        //            self.quantityBTCPastLabel.text = "quantityBTCPastLabel: \(NSString(format: "%.2f",resource.quantityBTC_past) as String)"
        //            self.quantityBTCTodayLabel.text = "quantityBTCTodayLabel: \(NSString(format: "%.2f",resource.quantityBTC_today) as String)"
        //
    }
}
