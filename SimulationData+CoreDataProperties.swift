//
//  SimulationData+CoreDataProperties.swift
//  
//
//  Created by Albert on 24/09/19.
//
//

import Foundation
import CoreData


extension SimulationData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SimulationData> {
        return NSFetchRequest<SimulationData>(entityName: "SimulationData")
    }

    @NSManaged public var criptomoeda: String?
    @NSManaged public var valorCompra: String?
    @NSManaged public var dataCompra: String?
    @NSManaged public var dataVenda: String?
    @NSManaged public var rendimento: String?

}
