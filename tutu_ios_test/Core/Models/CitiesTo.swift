//
//  CitiesTo.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 12/07/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation
import Gloss

public class CitiesTo : Decodable {
    
    var citiesTo : [City] = []
    
    public required init?(json: JSON) {
        guard let citisTo:[City] = "citiesTo" <~~ json else {return}
        self.citiesTo = citisTo
    }
}
