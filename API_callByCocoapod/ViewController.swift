//
//  ViewController.swift
//  API_callByCocoapod
//
//  Created by Md Maruf Prodhan on 1/16/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func callButton(_ sender: Any) {
        
        Alamofire.request("https://api.darksky.net/forecast/352824027cc68ebcdf82edd59df645fd/37.8267,-122.4233")
            .responseJSON { response in
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
                self.textview.text = response.description
        }
        
    }
    

}

