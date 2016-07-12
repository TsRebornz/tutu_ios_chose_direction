//
//  NetworkDataMapping.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 10/05/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation



// Парсит данные из JSON и привязвает их к коллекции
public class NetworkDataMapping {
    
    var stationsDict: [Int:Station] = [:]
    var citiesFromDict: [Int:City] = [:]
    
    
    public func parseDataFromUrl(url: NSURL){
        //var data: NSData
        //var myfunc: (NSData) -> Int = fillData
        Network.getTopAppsDataFromFileWithSuccess({(data) -> Int in
            
            var json: [String: AnyObject]!
            
            // 1
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
            } catch {
                print(error)
            }
            
            // 2
            
            
            guard let citiesFrom = CitiesFrom(json: json) else {
                print("Error initializing object")
                return 1
            }
            for city in citiesFrom.citiesFrom{
              self.citiesFromDict[city.cityId] = city
                guard let stationsC = city.stations else { return 1 }
                for station in stationsC{
                    self.stationsDict[station.stationId] = station
                    station.cityRef = city
                    
                }
            }
            
            return 1
        })
        
        
    }
    
    func fillData(data: NSData) -> Int  {
        return 8;
    }
    
    
    
    
    
    

}
