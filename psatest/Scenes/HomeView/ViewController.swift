//
//  ViewController.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import UIKit
import OpenWeather

class ViewController: UIViewController {
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.requestCity()
        // Do any additional setup after loading the view.
        
        //let popo: Location = Location(name: "popo")
        //popo.test()
    }


}

