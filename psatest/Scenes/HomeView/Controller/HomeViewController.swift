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
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindView()
        registerTableView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "segueToAddCity" {
          let controller = segue.destination as! AddCityViewController
          controller.delegate = self
       }
    }
    
    func bindView() {
        self.viewModel.bindLocations = {
            DispatchQueue.main.async {
                self.citiesTableView.reloadData()
            }
        }
    }
    
    func registerTableView() {
        citiesTableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "locationCell")
    }
}

extension HomeViewController: AddCityViewControllerDelegate {
    func didAddCity(city: Location) {
        viewModel.updateLocations(location: city)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell
        cell.setupCell(location: viewModel.userLocations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueCityDetail", sender: cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
