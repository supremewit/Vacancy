//
//  MainUIViewController.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 12. 4..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

extension MainUIViewController: MainViewDelegate {
    func ListButtonWasClicked(mainView: MainView_New, sender: UIButton!) {
        performSegue(withIdentifier: "locationSegue", sender: sender)
    }
    
}


class MainUIViewController: UIViewController {
    
    private var mainView:MainView_New!
    private var didSetupConstraints = false

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainView = MainView_New.newAutoLayout()
        view.addSubview(mainView)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            
            mainView.autoPin(toTopLayoutGuideOf: self, withInset: 0)
            mainView.autoPin(toBottomLayoutGuideOf: self, withInset: 0)
            mainView.autoPinEdge(toSuperviewEdge: .leading)
            mainView.autoPinEdge(toSuperviewEdge: .trailing)
            
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */
 

}

