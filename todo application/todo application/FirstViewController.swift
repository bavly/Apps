//
//  FirstViewController.swift
//  todo application
//
//  Created by bavly morcos on 4/15/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit

var dolist = [String]()

class FirstViewController:UIViewController , UITableViewDelegate {
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dolist.count
        
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier: "cell")
        
        cell.textLabel?.text = dolist[indexPath.row]
        return cell
        
    }
    
    //return back from view 2 
    // update table 
    
    override func viewDidAppear(animated: Bool) {
        tableview.reloadData()
        
    }

  
    
   

}

