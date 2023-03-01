//
//  HomeViewModel.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation
import OpenWeather

struct HomeViewModel {
    private(set) var userLocations : [Location] = [] {
        didSet {
            self.bindLocations()
        }
    }
    
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()
    
    var bindLocations : (() -> ()) = {}
    
    mutating func updateLocations(location: Location) {
        userLocations.append(location)
    }
}
