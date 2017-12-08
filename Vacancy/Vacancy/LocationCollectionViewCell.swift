//
//  LocationCollectionViewCell.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 11. 14..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    var location:Location? { didSet{
        self.locationLabel?.text = location!.name
        }}
    
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationPic: UIImageView!
    
    
    
}
