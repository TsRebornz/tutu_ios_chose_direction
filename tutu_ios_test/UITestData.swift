//
//  UITestData.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 10/05/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation


public class UITestData {
    public var cities : Array<City>
    //public let stations : Array<Station>
    
    public required init(){
        cities = []
        var city = City(countryTitle: "Россия", cityId: 101, cityTitle: "Москва");
        var station = Station(stationId: 1, cityRef: city ,  stationTitle: "Поваровка")
        city.addStation(station)
        station = Station(stationId: 2,cityRef: city , stationTitle: "Савеловская")
        city.addStation(station);
        station = Station(stationId: 3,cityRef: city , stationTitle: "Павелецкая")
        city.addStation(station);
        self.cities.append(city)
        city = City(countryTitle: "Украина", cityId: 102, cityTitle: "Киев")
        station = Station(stationId: 4,cityRef: city , stationTitle: "Киевская")
        city.addStation(station);
        self.cities.append(city)
    }
    
    func initCities(){
        
        
        
    }
    
    
    
    
    
    
    
    
}
