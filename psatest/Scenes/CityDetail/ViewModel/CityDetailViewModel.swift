//
//  CityDetailViewModel.swift
//  psatest
//
//  Created by Jordane HUY on 01/03/2023.
//

import Foundation
import OpenWeather

class CityDetailViewModel {
    // MARK: - Attributes
    var location: Location? {
        didSet {
            guard let location = location else { return }
            self.requestCityDetail(location: location)
        }
    }
    
    private(set) var locationDetail : LocationDetail? {
        didSet {
            self.bindLocationDetail()
        }
    }
    
    // MARK: - Binding closure
    var bindLocationDetail : (() -> ()) = {}
    
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()
    
    // MARK: - Methods
    func requestCityDetail(location: Location) {
        networkService.requestCityDetail(location: location) { result in
            switch result {
            case.success(let locationDetail):
                self.locationDetail = locationDetail
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
