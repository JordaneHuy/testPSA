//
//  HomeViewModel.swift
//  psatest
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation
import OpenWeather

class HomeViewModel {
    var userLocations: [Location] = []
    
    private let networkService: OpenWeatherQuery = OpenWeatherQuery()

}
