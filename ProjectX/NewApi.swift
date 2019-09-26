//
//  NewApi.swift
//  ProjectX
//
//  Created by Albert on 26/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation


struct NewApi {
    
    
    static func downloadNewsData(completion: @escaping (_ latestNewsResources: [LatestNewsResource]?) -> Void) {
        
        let url = URL(string: latestNewsRoutes.latestNewsData)!
        
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
                
                let latestNewsData = try JSONDecoder().decode(LatestNewsListResource.self, from: data)
                completion(latestNewsData.latestnews)
                print("\(String(data: data, encoding: .utf8)!)")
                
            } catch {
                print("💣 Erro no decode das Noticias: "+error.localizedDescription)
                print(error)
                completion(nil)
            }
            
            }.resume()
    }
}


struct latestNewsRoutes {
    
    private init() {}
    
    static let latestNewsData: String = "http://localhost:5000/api/v1/latestnews"
}

