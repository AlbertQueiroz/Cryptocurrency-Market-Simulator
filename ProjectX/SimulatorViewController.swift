//
//  SimulatorViewController.swift
//  ProjectX
//
//  Created by Albert on 16/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import CoreData

class SimulatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var simulations = [SimulationData]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
 
    
    
    @IBOutlet var tableView: UITableView!
    
    func loadData(){
        let request: NSFetchRequest<SimulationData> = SimulationData.fetchRequest()
        do{
            self.simulations = try context.fetch(request)
        } catch{
            print("Cant load Data")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simulations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = simulations[indexPath.row].value(forKey: "criptomoeda") as! String
        
        cell.textLabel?.textColor = .actionColor
        
//        cell.detailTextLabel?.text = "Rendeu R$ 300,00 até 20/10/2018"
        cell.detailTextLabel?.textColor = .actionColor
        
        cell.backgroundColor = .primaryColor
        
        let image = UIImage(named: "currency-exchange")
        
        if let imageView = cell.imageView {
            imageView.image = image
        }
        
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
            let obj = self.simulations[indexPath.row] as! NSManagedObject
            
            self.simulations.remove(at: indexPath.row)
            
            self.context.delete(obj)
            do{
                try self.context.save()
            } catch{
                print("Context error")
            }
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSimulationSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destiny = segue.destination as? SimulationDetailViewController, segue.identifier == "detailSimulationSegue", let index = sender as? Int {
            destiny.detailIndex = index
        }
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

