//
//  AddNewSimulationViewController.swift
//  ProjectX
//
//  Created by Albert on 23/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import CoreData

class AddNewSimulationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    var coins = [    "BTC",
                     "ETH",
                     "ETC",
                     "LTC",
                     "BCH",
                     "XRP",
                     "EOS",
                     "BNB",
                     "XLM",
                     "XMR",
                     "ADA",
                     "TRX",
                     "DASH",
                     "ZEC",
                     "DOGE",
                     "NEO",
                     "NANO",
                     "IOTA"] 

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
 
    @IBOutlet var criptoativoLabel: UITextField!
    @IBOutlet var simularButton: UIButton!

    @IBOutlet var dataDaVendaLabel: UITextField!
    @IBOutlet var dataDaCompraLabel: UITextField!
    @IBOutlet weak var valorTextLabel: UITextField!
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Simular(_ sender: Any) {
        if (criptoativoLabel.text == "" || valorTextLabel.text == "" || dataDaCompraLabel.text == "" || dataDaVendaLabel.text == "") {
            showAlert()
            return
        }
        
        
        
        
        
        guard let criptoativo = criptoativoLabel.text else {return showAlert()}
        guard let valorCompra = valorTextLabel.text else {return}
        guard let dataCompra = dataDaCompraLabel.text else {return print("Deu ruim")}
        guard let dataVenda = dataDaVendaLabel.text else {return print("Deu merda")}
        
        let entity = NSEntityDescription.entity(forEntityName: "SimulationData", in: self.context)!
        
        let simulationInputData = NSManagedObject(entity: entity, insertInto: context)
        
        
        simulationInputData.setValue(criptoativo, forKey: "criptomoeda")
        simulationInputData.setValue(valorCompra, forKey: "valorCompra")
        simulationInputData.setValue(dataCompra, forKey: "dataCompra")
        simulationInputData.setValue(dataVenda, forKey: "dataVenda")
        
       
        SimulationApi.getSimulationData(withCoin: criptoativo, withValue: valorCompra, withDataBuy: dataCompra, withDataSell: dataVenda) { (resource) in
            if let resourceNotNil = resource {
                //MARK: TODO Salvar SimulationData no CoreData
                print(resource)
            }
        }
        
        
        do{
            try self.context.save()
        } catch{
            print("Saving Data ERROR")
        }
        
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
        
        let criptoPicker = UIPickerView()
        criptoPicker.delegate = self
        criptoativoLabel.inputView = criptoPicker
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coins.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coins[row]
    }
    
    func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        criptoativoLabel.text = coins[row]
    }
    
    
    
    
    
    
    fileprivate func showAlert() {
        let alert = UIAlertController(title: "Voce não setou um campo", message: "Por favor sete um campo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (alert) in
            print("Ok")
        }))
        present(alert, animated: true, completion: nil)
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
