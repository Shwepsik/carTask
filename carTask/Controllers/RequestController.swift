//
//  RequestController.swift
//  carTask
//
//  Created by Valerii on 06.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation
import CoreData

typealias ResponseBlock = (_ result: Any?, _ error: Error?)
    -> Void

class RequestController {
    
    
    func getData(responseBlock: @escaping (GetInfoResponse) -> Void ) {
        
        guard let path = Bundle.main.path(forResource: "cars(1)", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String: AnyObject]]
            
           // print(json)
            let getInfoResponse = GetInfoResponse(json: json)
            responseBlock(getInfoResponse)
        } catch {
            print(error)
        }
        
    }
    
    
}
