//
//  AddCityViewModel.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation
import OpenWeather

class AddCityViewModel {
    // MARK: - Attributes
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()
    
    // MARK: - Methods
    func searchLocation(searchStr: String, completion: @escaping (Location) -> Void) {
        networkService.requestCity(location: searchStr) { result in
            switch result {
            case.success(let location):
                guard let location = location.first else {
                    print("Error - No city found")
                    return
                }
                completion(location)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
