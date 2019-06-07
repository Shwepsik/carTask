//
//  SaveModel.swift
//  carTask
//
//  Created by Valerii on 07.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation
import CoreData


class SaveModel {
    
    var persistenceManager = PersistenceManager()
    
    init(json: [[String: AnyObject]]) {
        
        let model = NSEntityDescription.entity(forEntityName: "Model", in: persistenceManager.context)
        let myModel = Model(entity: model!, insertInto: persistenceManager.context)
        
        for data in json {
            let owners = data["owners"] as! [[String: AnyObject]]
            myModel.carId = data["car_id"] as! Int16
            myModel.carModel = data["car_model"] as! String
            myModel.isOpen = false
            myModel.ownerName = owners[0]["owner_name"] as! String
            let carColor = data["car_color"] as! String
            let carType = data["car_type"] as! String
            let ownerId = owners[0]["owner_id"] as! Int16
            let stringId = String(ownerId)
            let ownerPhone = owners[0]["owner_phone"] as! String
            let sectionArray = [stringId,carType,carColor,ownerPhone]
            let sectionLabelArray = ["Owner Id","Car Type","Car Color","Owner Phone"]
            myModel.sectionData.append(contentsOf: sectionArray)
            myModel.sectionDataLabel.append(contentsOf: sectionLabelArray)
            
        }
        persistenceManager.saveContext()
    }
}
