//
//  TableViewController.swift
//  carTask
//
//  Created by Valerii on 06.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var model = [Model]()
    let request = RequestController()
    let persistenceManager = PersistenceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        persistenceManager.deleteAllData("Model")
        request.getData { (model) in
            let mainInfo = self.persistenceManager.fetch(Model.self)
            self.model = mainInfo
            self.tableView.reloadData()
        }
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        getData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model[section].isOpen == true {
            return model[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if model[indexPath.section].isOpen == false {
            model[indexPath.section].isOpen = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            model[indexPath.section].isOpen = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
            cell.carId.text = String(model[indexPath.section].carId)
            cell.carModel.text = model[indexPath.section].carModel
            cell.ownerName.text = model[indexPath.section].ownerName
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as! SectionCell
            cell.rightLabel.text = model[indexPath.section].sectionData[indexPath.row - 1]
            cell.leftLabel.text = model[indexPath.section].sectionDataLabel[indexPath.row - 1]
            return cell
            
        }
       
        
    }
    
}
