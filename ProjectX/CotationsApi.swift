//
//  CotationsApi.swift
//  ProjectX
//
//  Created by Albert on 25/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation


struct CotationApi {
    
    
    static func downloadCotationData(completion: @escaping (_ cotationResources: [CotationResource]?) -> Void) {
        
        let url = URL(string: cotationRoutes.cotationData)!
        
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
               
                let cotationData = try JSONDecoder().decode(CotationListResource.self, from: data)
                    completion(cotationData.ranklist)
                print("\(String(data: data, encoding: .utf8)!)")

            } catch {
                print("💣 Erro no decode das Cotações: "+error.localizedDescription)
                print(error)
                completion(nil)
            }
            
            }.resume()
    }
}


struct cotationRoutes {
    
    private init() {}
    
    static let cotationData: String = "http://localhost:5000/api/v1/ranklist"
}

