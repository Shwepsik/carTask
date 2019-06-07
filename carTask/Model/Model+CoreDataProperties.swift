//
//  Model+CoreDataProperties.swift
//  carTask
//
//  Created by Valerii on 07.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//
//

import Foundation
import CoreData


extension Model {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Model> {
        return NSFetchRequest<Model>(entityName: "Model")
    }

    @NSManaged public var isOpen: Bool
    @NSManaged public var carId: Int16
    @NSManaged public var carModel: String
    @NSManaged public var ownerName: String
    @NSManaged public var sectionData: [String]
    @NSManaged public var sectionDataLabel: [String]

}
