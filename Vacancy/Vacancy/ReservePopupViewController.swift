//
//  ReservePopupViewController.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 11. 20..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit



class ReservePopupViewController: UIViewController {
    
    
    
    var takeStore:Store? = nil
    
    var setReserve:Reservation?
    
    @IBOutlet weak var parkCheck: BEMCheckBox!
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeVacancy: UILabel!
    
    @IBOutlet weak var reservatorNameField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var goReserve: UIButton!
    
    func newReserve() -> Reservation? {
        let reservation = Reservation()
        let reservator = reservatorNameField.text!
        
        if reservator.isEmpty {
            return nil
        } else {
            reservation.reservator = reservator
        }
        reservation.dateAndTime = datePicker.date as NSDate
        reservation.storename = takeStore!.name
        if parkCheck.on == true {
            reservation.parkOrNot = true
        } else {
            reservation.parkOrNot = false
        }
        reservation.storeAddress = takeStore!.address
        reservation.setReservation = true
        return reservation
    }
    
    @IBAction func makeReserve(_ sender: Any) {
        
        guard let reservation = newReserve() else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        if reservation.parkOrNot == true {
            takeStore!.capacity = takeStore!.capacity - 1
            
        }
        
        setReserve = reservation
        
        
        
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        

        
        storeVacancy.text = "\(String(describing: takeStore?.capacity))"
        print("\(takeStore!.capacity)")
        storeVacancy.layer.cornerRadius = 200
        storeVacancy.backgroundColor = UIColor.green
        storeVacancy.clipsToBounds = true
        
        
        storeName.text = takeStore?.name
        
        
        
        
        goReserve.layer.cornerRadius = 5
        goReserve.clipsToBounds = true
        
        
        
        
        
    
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
    
    
    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reserveSegue" {
            guard let destination = segue.destination as? ReservedViewController, let reserve = setReserve else {
                return
            }
            
            destination.reserveInfo = reserve
        }
        
        
        
        

        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
