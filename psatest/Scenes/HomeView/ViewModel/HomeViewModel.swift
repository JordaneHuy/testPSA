//
//  HomeViewModel.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation
import OpenWeather

class HomeViewModel {
    private(set) var userLocations : [Location] = [] {
        didSet {
            self.bindLocations()
        }
    }
    
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()
    
    var bindLocations : (() -> ()) = {}
    
    func updateLocations(location: Location) {
        userLocations.append(location)
    }
}
