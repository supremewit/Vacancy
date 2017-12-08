//
//  StoreViewCell.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 11. 19..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

class StoreViewCell: UITableViewCell {
    
    var store:Store? { didSet{
        self.storeName?.text = store!.name
        self.storeAddress?.text = store!.address
        }}
    
    
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeCapacity: UILabel!
    @IBOutlet weak var storeAddress: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
