//
//  fourthScreen.swift
//  Tutorial
//
//  Created by raji on 17/09/19.
//  Copyright © 2019 raji. All rights reserved.
//

import UIKit

class fourthScreen: UIViewController {

    @IBOutlet weak var comecarSimular: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comecarSimular.layer.masksToBounds = true
        comecarSimular.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
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
