//
//  AddNewSimulationViewController.swift
//  ProjectX
//
//  Created by Albert on 23/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class AddNewSimulationViewController: UIViewController {

 
    @IBOutlet var criptoativoLabel: UITextField!
    @IBOutlet var simularButton: UIButton!

    @IBOutlet var dataDaVendaLabel: UITextField!
    @IBOutlet var dataDaCompraLabel: UITextField!
    @IBOutlet weak var valorTextLabel: UITextField!
    
    @IBAction func cancelButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Simular(_ sender: Any) {
        let criptoativo = criptoativoLabel.text
        let valorCompra = valorTextLabel.text
        let dataCompra = dataDaCompraLabel.text
        let dataVenda = dataDaVendaLabel.text
        print(criptoativo,valorCompra,dataCompra,dataVenda)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        criptoativoLabel.layer.masksToBounds = true
        criptoativoLabel.layer.cornerRadius = 12
        dataDaCompraLabel.layer.masksToBounds = true
        dataDaCompraLabel.layer.cornerRadius = 12
        dataDaVendaLabel.layer.masksToBounds = true
        dataDaVendaLabel.layer.cornerRadius = 12
        valorTextLabel.layer.masksToBounds = true
        valorTextLabel.layer.cornerRadius = 12
        simularButton.layer.masksToBounds = true
        simularButton.layer.cornerRadius = 24
        
        hideKeyboardWhenTappedAround()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
