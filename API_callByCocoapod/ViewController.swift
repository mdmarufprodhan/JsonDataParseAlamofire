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
    //Add Function 
    @IBAction func callButton(_ sender: Any) {
        
        Alamofire.request("https://api.darksky.net/forecast/352824027cc68ebcdf82edd59df645fd/37.8267,-122.4233")
            .responseJSON { response in
                
           //     print(response.request as Any)  // original URL request
             //   print(response.response as Any) // URL response
               // print(response.result.value as Any)   // result of response serializatio
            
              //  self.textview.text = response.description
                
                
                //1. From "    currently" object show "summary" in view.
                var temp : Double = 0.0
                var time : Int = 1579168388
                if let jsonDictionary = response.result.value as? [String : Any] {
                    if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any]{
                        let summary = currentWeatherDictionary["summary"] as? String
                        temp = currentWeatherDictionary["temperature"] as? Double ?? 0.0
                        time = currentWeatherDictionary["time"] as! Int
                        print(time)
                        
                //2. From     "currently" get time, convert the timestamp to Date and show in format "Jan 16, 2020 9:53 AM" in the view.
                        
                        let date = Date(timeIntervalSince1970: 1579168388)
                        let dateFormatter = DateFormatter()
                        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+6") //Set timezone that you want
                        dateFormatter.locale = NSLocale.current
                        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a" //Specify your format that you want //"dd-MM-yyyy HH:mm"
                        let strDate = dateFormatter.string(from: date as Date)
                        
                      //  print(strDate)
                       // self.textview.text = strDate
                        
                        //From "minutely" object get "data" and show the average of "precipProbability" in the view. Ignore those value where precipProbability is given 0.
                        
                        
                        
                        let minutely = jsonDictionary["minutely"] as? [String : Any]
                        let dataArray = minutely?["data"] as! NSArray
                        var i = 0
                        var count = 0
                        var sum = 0 as Double
                        for _ in dataArray {
                            
                            //print(item as Any)//print(dataArray[i])
                            
                            let item = dataArray[i] as! [String: Any]
                            let precipProb = item["precipProbability"] as! Double
                            if precipProb != 0 {
                                sum = sum + precipProb
                                count+=1
                            }
                            //print("i = \(i)")
                            i+=1
                        }
                        let avg = sum / Double(count)
                        print("Average = \(avg)")
                        self.textview.text = String(avg)
                        
                    }
                        
                        
                        
                        
                    }
                }
                
        }
         
    }
    


