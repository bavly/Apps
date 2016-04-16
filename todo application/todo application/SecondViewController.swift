//
//  SecondViewController.swift
//  todo application
//
//  Created by bavly morcos on 4/15/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit




class SecondViewController: UIViewController {

    @IBOutlet var textfield: UITextField!
    
    @IBAction func itemadded(sender: AnyObject) {
        
        dolist.append(textfield.text!)
        textfield.text=" "
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //allow the user to tap outside the keyboard 
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    //close the keyboard by button on the keyboard 
    
    
    func textreturn(textField: UITextField!) ->Bool{
        
        textfield.resignFirstResponder()
        return true
        
    }
    
    


}

