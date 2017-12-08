//
//  HijackViewController.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 12. 3..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

class HijackViewController: UINavigationController {
    
    var reservationSwitch: Reservation
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if reservationSwitch.setReservation == true {
            perform(#selector(showReservedController), with: nil, afterDelay: 0.01)
        }
        
        
        
    }
    
    func showReservedController() {
        let reservedContoller = ReservedViewController()
        present(ReservedViewController, animated:true, completion: {
            
        })
    }
}
