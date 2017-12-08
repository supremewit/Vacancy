//
//  StoreViewController.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 11. 10..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit




class StoreViewController: UITableViewController {
    
    var currentlocation:Location?
    
    
    override func viewDidLoad() {
        
        self.title = currentlocation?.name
        self.navigationController?.isToolbarHidden = true
        
        
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let storeCount = currentlocation?.stores?.count else {return 0}
        return storeCount
    }
   

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath) as! StoreViewCell
        
        guard let storeList = currentlocation?.stores?[indexPath.row] else { return cell}
        
        cell.storeName?.text = storeList.name
        
        cell.storeAddress?.text = storeList.address
        
        cell.storeCapacity.layer.cornerRadius = cell.storeCapacity.frame.width/2
        cell.storeCapacity.layer.masksToBounds = true
        if storeList.capacity > 0 {
            cell.storeCapacity.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            cell.storeCapacity.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReservationPopupSegue" {
            guard let destination = segue.destination as? ReservePopupViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let takeStore = currentlocation?.stores?[selectedIndex] else {
                return
            }
            destination.takeStore = takeStore
        }
    }

}
