//
//  ViewController.swift
//  see
//
//  Created by bavly morcos on 2/17/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func findweather(sender: AnyObject) {
    
        var wasSuccessful = false
        //let url =
        
        let Attempturl = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        if let url = Attempturl {
        
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            
                if let urlcontent = data {
                    
                    let webcontent = NSString (data: urlcontent, encoding: NSUTF8StringEncoding)
                    
                    let websiteArray = webcontent!.componentsSeparatedByString(" 3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                    if websiteArray.count > 1 {
                        let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")
                    
                        if weatherArray.count > 1 {
                            
                            wasSuccessful = true
                            
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg", withString: "º")
                                // used for backgroud task to increase the speed by give it a thread
        
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    self.result.text = weatherSummary
                            })
                        
                        }
                    
                    }
                }
                
            if wasSuccessful == false{
                        self.result.text = "could not find the weather of the city , please try again"
                }
                    }
        
            task.resume()
        }
            else{
            
            self.result.text = "could not find the weather of the city , please try again"
        
        }
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

