//
//  SimulatorViewController.swift
//  ProjectX
//
//  Created by Albert on 16/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class SimulatorViewController: UIViewController {

    @IBOutlet var regressivaView: UIView!
    @IBOutlet var progressivaView: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Simulador"
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SimulationTypeSwitch(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            regressivaView.isHidden = false
            progressivaView.isHidden = true
        case 1:
            regressivaView.isHidden = true
            progressivaView.isHidden = false
        default:
            break
        }
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
