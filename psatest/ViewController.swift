//
//  ViewController.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import UIKit
import OpenWeather

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let popo: Location = Location(name: "popo")
        popo.test()
    }


}

