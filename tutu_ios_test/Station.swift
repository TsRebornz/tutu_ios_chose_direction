import Foundation
import Gloss
import CoreLocation

public class Station : NSObject ,Decodable {
    
    //public let
    public let stationId: Int
    public var cityRef: City?
    public let stationTitle: String
    //public let longtitude: CLLocation
    
    public required init?(json: JSON) {
        stationId = ("stationId" <~~ json)!
        stationTitle = ("stationTitle" <~~ json)!
    }
    
    public required init(stationId : Int, cityRef : City, stationTitle : String ){
            self.stationId = stationId;
            self.cityRef = cityRef;
            self.stationTitle = stationTitle;
    }
    
    
    

}

