//
//  HomeViewController.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import UIKit
import OpenWeather

class HomeViewController: UIViewController {
    @IBOutlet weak var addCityButton: UIBarButtonItem!
    
    @IBOutlet weak var citiesTableView: UITableView!
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "segueToAddCity" {
          let controller = segue.destination as! AddCityViewController
          controller.delegate = self
       }
    }
}

extension HomeViewController: AddCityViewControllerDelegate {
    func didAddCity(city: Location) {
        print("city : \(city.name)")
    }
}

