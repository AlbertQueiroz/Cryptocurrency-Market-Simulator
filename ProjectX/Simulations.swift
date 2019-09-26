//
//  Simulations.swift
//  ProjectX
//
//  Created by Albert on 24/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

struct Simulations {
    let criptomoeda: criptomoeda
    let valorCompra: String
    let dataCompra: String
    let dataVenda:String
    let rendimento: Resource
}

enum criptomoeda {
    static var BTC:String {
        return "BTC"
    }
    static var ETH:String{
        return "ETH"
    }
    
}

