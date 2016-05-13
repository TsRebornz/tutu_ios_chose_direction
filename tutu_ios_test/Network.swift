//
//  Network.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 10/05/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation

let TopAppURL = "https://raw.githubusercontent.com/tutu-ru/hire_ios-test/master/allStations.json"

public class Network {
    
    public class func getTopAppsDataFromInternetWithSucces(success: ((iTunesData: NSData!) -> Void)){
        loadDataFromURL(NSURL(string: TopAppURL)!, completion:{(data,error) -> Void in
            if let data = data{
                success(iTunesData: data)
            }
            
        })
        
    }
    
    //getting data from local
    
    public class func getTopAppsDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let filePath = NSBundle.mainBundle().pathForResource("allStations", ofType:"json")
            let data = try! NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached)
            success(data: data)
        })
    }
    
    public class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let loadDataTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
                
            }
        }
        
        loadDataTask.resume()
    }
    
}
