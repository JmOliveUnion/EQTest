//
//  ViewController.swift
//  EQTest
//
//  Created by 김민종 on 6/26/24.
//

import UIKit

class ViewController: UIViewController, VerticalSliderDelegate {
    func trackingContinue(channel: Int) {
        print("")
    }
    
    func trackingEnd() {
        print("")

    }
    
    
    override func loadView() {
        super.loadView()
        view = NewEQView(frame: view.frame)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("asfjdk")
        
        
        
    }


}

