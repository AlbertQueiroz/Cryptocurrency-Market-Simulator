//
//  simulatorRegressiveViewController.swift
//  Tutorial
//
//  Created by raji on 18/09/19.
//  Copyright © 2019 raji. All rights reserved.
//

import UIKit

class simulatorRegressiveViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var criptoativoButton: UIButton!
    @IBOutlet weak var dataButton: UIButton!
    @IBOutlet weak var valorTextLabel: UITextField!
    @IBOutlet weak var simularButton: UIButton!
    
    
    //pickers
    @IBOutlet weak var criptoativoPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        criptoativoButton.layer.masksToBounds = true
        criptoativoButton.layer.cornerRadius = 12
        dataButton.layer.masksToBounds = true
        dataButton.layer.cornerRadius = 12
        valorTextLabel.layer.masksToBounds = true
        valorTextLabel.layer.cornerRadius = 12
        simularButton.layer.masksToBounds = true
        simularButton.layer.cornerRadius = 24
//        valorTextLabel.textContei
        // Do any additional setup after loading the view.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
