//
//  ScheduleTableViewController.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 23/03/16.
//  Copyright (c) 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import UIKit

protocol ScheduleTableViewDelegate : class {
    func scheduleTableViewDelegate(controller : ScheduleTableViewController )
}


extension ScheduleTableViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class ScheduleTableViewController: UITableViewController {

    var filteredTableData = [City]()
    
    var tableData:Array<City>!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    weak var delegate: ScheduleTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        //SearchController stuff
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (searchController.active && searchController.searchBar.text != ""){
            return filteredTableData.count
        }
        return tableData.count
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var city = tableData[section]
        if (searchController.active && searchController.searchBar.text != ""){
            city = filteredTableData[section]
        }
        return (city.stations?.count)!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData[section].countryTitle + " " + tableData[section].cityTitle
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default , reuseIdentifier: cellIdentifier)
        }
        
        let city: City
        
        if (searchController.active && searchController.searchBar.text != ""){
                city = filteredTableData[indexPath.section]
        }else{
                city = tableData[indexPath.section]
        }
        let station = city.stations![indexPath.row]
        cell!.textLabel?.text = station.stationTitle
        cell!.detailTextLabel?.text = String(station.stationId)
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        if (segue.identifier == "detailedViewSegue"){
            let detailedViewController = navigationController.topViewController as! DetailedViewController
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
                let city : City
                if (searchController.active && searchController.searchBar.text != ""){
                         city = filteredTableData[indexPath.section]
                }else{
                         city = tableData[indexPath.section]
                }
                detailedViewController.station = city.stations![indexPath.row]
            }
            //detailedViewController.station =
        }
    }
     
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func reloadData(){
        tableData = getTableData()
    }
    
    
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        
        reloadData()
        
        // В случае изменения модели данных все накроется звездой.
        
        self.filteredTableData = self.tableData.filter({ city -> Bool in
            var result = false
            // Можно ли переписать более красиво?
            city.stations?.filter({(station) -> Bool in
                /* Логическое сложение нужно , чтобы result не перезаписывался и оставался true если хотя бы один result будет равен true */
                result = station.stationTitle.lowercaseString.containsString(searchText.lowercaseString) || result
                return result
            })
            return result
        })
        
        for city in self.filteredTableData{
            city.stations = city.stations?.filter({ (station) -> Bool in
                return station.stationTitle.lowercaseString.containsString(searchText.lowercaseString)
            })
        }
        
        tableView.reloadData()
    }
    
    func getTableData() -> Array<City>{
        let testData = UITestData()
        return testData.cities
    }

}
