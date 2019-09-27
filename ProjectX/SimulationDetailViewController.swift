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
    
    @IBOutlet var lucroTotal: UILabel!
    
    @IBOutlet var valorCompra: UILabel!
    @IBOutlet var mercado: UILabel!
    @IBOutlet var porcentagem: UILabel!
    @IBOutlet var valorVenda: UILabel!
    @IBOutlet var valorTotal: UILabel!
    @IBOutlet var dataCompra: UILabel!
    @IBOutlet var dataVenda: UILabel!
    
    
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
        
        mercado.layer.cornerRadius = 20
        mercado.layer.masksToBounds = true
        valorCompra.layer.cornerRadius = 20
        valorCompra.layer.masksToBounds = true
        valorVenda.layer.cornerRadius = 20
        valorVenda.layer.masksToBounds = true
        dataVenda.layer.cornerRadius = 20
        dataVenda.layer.masksToBounds = true
        dataCompra.layer.cornerRadius = 20
        dataCompra.layer.masksToBounds = true
        porcentagem.layer.cornerRadius = 20
        porcentagem.layer.masksToBounds = true
        valorTotal.layer.cornerRadius = 20
        valorTotal.layer.masksToBounds = true
    }
    
    func reloadViews() {
        
        guard let resource = self.resource else {
            print("tururu...")
            return
        }
        
        self.mercado.text = resource.market
        self.valorCompra.text = "R$ "+String(resource.base_investiment_fiat)
        self.porcentagem.text = String(resource.profit_percentage) + "%"
        self.valorVenda.text = "R$ " + String(format: "%.2f  ",resource.sell_price)
        
        self.lucroTotal.text = "R$ "+String(resource.profit_fiat_price)
        
        self.valorTotal.text = String("R$ \(resource.base_investiment_fiat + resource.profit_fiat_price)")
        
        self.dataCompra.text = resource.buy_date
        self.dataVenda.text = resource.sell_date
        
        
    }
}
