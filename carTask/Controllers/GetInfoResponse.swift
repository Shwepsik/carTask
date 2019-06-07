//
//  GetInfoResponse.swift
//  carTask
//
//  Created by Valerii on 06.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation
import CoreData

class GetInfoResponse {
    
    var model: [SaveModel]
    
    
    init(json: [[String: AnyObject]]) {
        let model = json.map{ SaveModel(json: [$0]) }.compactMap{ $0 }
        
        
        self.model = model
        
    }
    
}
