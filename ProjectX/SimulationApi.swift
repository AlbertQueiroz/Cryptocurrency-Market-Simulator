//
//  SimulationApi.swift
//  ProjectX
//
//  Created by Albert on 24/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

struct SimulationApi {
    
    
    static func downloadSimulationData(completion: @escaping (_ simulationData: Resource?) -> Void) {
        
        let url = URL(string: Routes.simulationData)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let errorMsg = error?.localizedDescription {
                print(errorMsg)
                completion(nil)
            }
            
            guard let data = data else {
                print("Data is nil")
                completion(nil)
                return
            }
            
            do {
                
                let simulationData = try JSONDecoder().decode(Resource.self, from: data)
                completion(simulationData)
                
            } catch {
                print("💣 Erro no decode: "+error.localizedDescription)
                print("\(String(data: data, encoding: .utf8)!)")
                completion(nil)
            }
            
            }.resume()
    
    }
        
    static func getSimulationData(withCoin coin: String, withValue value: String, withDataBuy dataBuy: String, withDataSell dataSell: String, completion: @escaping(_ simulationData: Resource?) -> Void) {
        let urlString = "http://localhost:5000/api/v1/simulation/\(coin)/\(value)/\(dataBuy)T12:00:00+0300/\(dataSell)T12:00:00+0300"
            
            guard let url = URL(string: urlString) else {return completion(nil)}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let errorMsg = error?.localizedDescription {
                    print(errorMsg)
                    completion(nil)
                }
                
                guard let data = data else {
                    print("Data is nil")
                    completion(nil)
                    return
                }
                
                do {
                    
                    let simulationData = try JSONDecoder().decode(Resource.self, from: data)
                    completion(simulationData)
                    
                } catch {
                    print("💣 Erro no decode: "+error.localizedDescription)
                    print(error)
                    print("\(String(data: data, encoding: .utf8)!)")
                    completion(nil)
                }
                
                }.resume()
            
        }
        
        
        
    }


struct Routes {
    
    private init() {}
    
    static let simulationData: String = "http://localhost:5000/api/v1/simulation/BTC/USD/50/2018-09-23T18:34:34+0000"
}

