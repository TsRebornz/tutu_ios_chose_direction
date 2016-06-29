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
    
    
    
    
    public func parseDataFromUrl(url: NSURL){
        //Network.getTopAppsDataFromFileWithSuccess { (data) -> Void in
        var data: NSData? = fillData()
        
    }
    
    func fillData() -> NSData? {
        var data: NSData? = nil
        
        if let dataResult = data{
            return data
        }else{
            return nil
        }
        
    }
    
    func filterAndWriteData() -> Void{
        
    }
    
    
    
    

}
