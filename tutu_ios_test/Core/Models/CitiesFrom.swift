//
//  CitiesFrom.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 12/07/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation
import Gloss


public class CitiesFrom : Decodable {
    var citiesFrom : [City]
    
    public required init?(json: JSON) {
        guard let citiesF : [City] = "citiesFrom" <~~ json else {return nil}
        citiesFrom = citiesF
    }
    
}
