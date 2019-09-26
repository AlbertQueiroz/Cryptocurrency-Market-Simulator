//
//  Resource.swift
//  ProjectX
//
//  Created by Albert on 24/09/19.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

struct Resource: Codable {
    let market: String
    let initialDate: String
    let pastPrice: Double
    let currentPrice: Double
    let baseInvestiment: Int
    let gainPercentage: Double
    let quantityBTC_past: Double
    let quantityBTC_today: Double
    let gainPriceUSD: Double
    let total: Double
}


struct CotationResource: Codable {
    let circulating_suply: Double?
    let description: String
    let id: Int
    let logo: URL
    let market_cap: Double
    let max_supply: Double?
    let name: String
    let percent_change_1h: Double
    let percent_change_24h: Double
    let percent_change_7d:Double
    let price:Double
    let rank: Int
    let slug: String
    let symbol: String
    let total_supply: Double
    let volume_24h: Double
}

struct CotationListResource: Codable {
    let ranklist: [CotationResource]
}

struct source: Codable {
    let favicon: URL
}

struct LatestNewsResource: Codable {
    let date: String
    let description: String
    let id: Int
    let image_article: String?
    let source: source
    let title: String
    let url: URL
}

struct LatestNewsListResource: Codable {
    let latestnews: [LatestNewsResource]
}

