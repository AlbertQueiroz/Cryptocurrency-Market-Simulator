//
//  firstScreen.swift
//  Tutorial
//
//  Created by raji on 16/09/19.
//  Copyright © 2019 raji. All rights reserved.
//

import UIKit

class firstScreen: UIViewController {
    
    @IBOutlet var test: UIView!
    
    @IBOutlet weak var avancarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avancarButton.layer.masksToBounds = true
        avancarButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    @IBAction func avancarScreenAction(_ sender: Any) {
        if let pageViewController = self.parent as? CustomPageViewController {
            pageViewController.goToNextPage()
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
