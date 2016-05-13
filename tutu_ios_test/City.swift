import Foundation
import CoreLocation
import Gloss

public class City : NSObject, Decodable, NSCopying {
    public var countryTitle: String
    //public let point: PointJson?
    public var cityId: Int
    //public let regionTitile: String?
    public var cityTitle: String
    public var stations: [Station]?
    
    public required init?(json: JSON) {
        countryTitle = ("countryTitle" <~~ json)!
        cityId = ("cityId" <~~ json)!
        cityTitle = ("cityTitle" <~~ json)!
        stations = ("stations" <~~ json)
    }
    
    public required init(countryTitle: String, cityId: Int, cityTitle: String){
            self.countryTitle = countryTitle
            self.cityId = cityId
            self.cityTitle = cityTitle
            self.stations = nil
    }
    
    @objc public func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = City( countryTitle: self.countryTitle, cityId: self.cityId, cityTitle: self.cityTitle)
        return copy
    }
    
    public func addStation(station:Station){
        if nil == stations {
            self.stations = [] as Array<Station>
        }
        self.stations?.append(station);
    }
}

