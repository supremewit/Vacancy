//
//  ViewController.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 11. 10..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    

    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var stores = [Store]()
    var filteredStores = [Store]()
    
    var location = dataSet() //== [Location] [Store]
    
    
    
    
    
    @IBOutlet weak var goList: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        goList.layer.cornerRadius = 5
        
        setUpDatas()
        setUpSearchBar()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpDatas() {
        
        //stores = location.
        
        let length = location.count
        
        for i in 0..<length-3 {
            stores += location[i].stores!
        }
        
        filteredStores = stores
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    // Mark - For TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.storeName.text = filteredStores[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    // Mark - For SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredStores = stores
            searchTable.reloadData()
            return
            
        }
        
        filteredStores = stores.filter({ store -> Bool in store.name.lowercased().contains(searchText.lowercased())
            
        })
        searchTable.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchReserveSegue" {
            guard let destination = segue.destination as? ReservePopupViewController, let selectedIndex = self.searchTable.indexPathForSelectedRow?.row else {
                return
            }
            let takeStore = filteredStores[selectedIndex]
            destination.takeStore = takeStore
        
        
    }
        
    
 
    


}

    

}


