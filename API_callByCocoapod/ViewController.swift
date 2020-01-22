//
//  ViewController.swift
//  API_callByCocoapod
//
//  Created by Md Maruf Prodhan on 1/16/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import UIKit
import Alamofire

private struct Course :Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
}


class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    let decoder = JSONDecoder()
    var courseString : String = ""
    var ID : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Add Function 
    @IBAction func callButton(_ sender: Any) {
      
        Alamofire.request("https://api.letsbuildthatapp.com/jsondecodable/courses" ).validate().responseJSON { response in
            //print(response.debugDescription)
            
            do{
                
                let course = try self.decoder.decode([Course].self, from: response.data! )
                
                for item in course {
                    print(item.name!)
                    //self.textview.text = item.name
                    self.ID = String(item.id!)
                    self.courseString += item.name! + ": " + self.ID + "\n"
                    
                }
                self.textview.text = self.courseString
                
            }catch{
                
                print("error here")
            }
        }
    }
}
         

    


