//
//  ReservedViewController.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 12. 3..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

class ReservedViewController: UIViewController {

    var reserveInfo:Reservation?

    
    @IBOutlet weak var reservedStore: UILabel!
    @IBOutlet weak var reservedDT: UILabel!
    @IBOutlet weak var reservedStoreAddress: UILabel!
    
    @IBOutlet weak var cancelReserveLook: UIButton!
    @IBAction func cancelReserve(_ sender: Any) {
        dismissReservation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if reserveInfo?.setReservation == true {
            
            addReserveInfo()
            
            reservedStore.text = "예약자: \(String(describing: reserveInfo?.reservator))"
            reservedDT.text = "예약시간: \(String(describing: reserveInfo?.dateAndTime))"
            reservedStoreAddress.text = "주소: \(String(describing:reserveInfo?.storeAddress))"
            
        } else {
            dismiss(animated: true, completion: nil)
        }
        
        
        
        cancelReserveLook.layer.cornerRadius = 5
        cancelReserveLook.clipsToBounds = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func dismissReservation() {
        Reservation.init()
    }
    
    func addReserveInfo() {
        if reserveInfo?.setReservation == true {
            
            
        }
        
        
    }

}
