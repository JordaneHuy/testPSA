//
//  CityDetailViewController.swift
//  psatest
//
//  Created by Jordane HUY on 01/03/2023.
//

import UIKit
import OpenWeather

class CityDetailViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxMinLabel: UILabel!
    
    var viewModel: CityDetailViewModel = CityDetailViewModel()
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        bindView()
    }
    
    func setupViewModel() {
        viewModel.location = location
    }
    
    func bindView() {
        self.viewModel.bindLocationDetail = {
            DispatchQueue.main.async {
                if let weather = self.viewModel.locationDetail?.weather.first,
                   let main = self.viewModel.locationDetail?.main {
                    let date = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMM YY, hh:mm"
                    
                    self.dateLabel.text = dateFormatter.string(from: date)
                    self.tempLabel.text = "\(main.temp)°"
                    self.maxMinLabel.text = "Max: \(main.tempMax)° - Min: \(main.tempMin)°"
                    self.weatherImage.image = UIImage(named: weather.icon)
                }
            }
        }
    }
}
