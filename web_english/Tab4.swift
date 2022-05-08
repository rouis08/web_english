//
//  item2.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/5/22.
//
//  Explanation :
//       This file is to send the POST data to login.php
//
//
//

import UIKit

var rouis:Int = 60
// Tab 4
//I was not sure if I should put this struct inside of the ViewController()
struct member_user {
    var account: String = ""
    var password: String =  ""
}


//truct purchase: Codable {
//    var status1: String
//    var message1: String
//}


struct CreateHttpBody: Encodable {
    let item: String
    let price: Int16
    let amount: Int16
    let shipping: Int16
    let today: String
    let location: String
    let payment: String
    let memo: String
}


struct CreateHttpResponse: Decodable {
    let status1: String
    let message1: String
}



class ViewController_item2: UIViewController {

    @IBOutlet weak var account1: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var wordLIB: UISwitch!
    @IBOutlet weak var share_location: UISwitch!
    
    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var register_btn: UIButton!

    var userAccount = member_user()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("item2")
        
        //var member1 = member()
        
        //eng_word.endEditing(true)
        print("\(rouis)")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("item2 appear")
    }
 
    
    
    //Log-in with the account
    @IBAction func Btn_login_click(_ sender: Any) {
        
        print("btn_send pressed")
        
        let url = URL(string: "http://1.34.110.11/webEnglish/login.php");
    
        //let id1:String = id_text.text!;
        let rg_name:String = account1.text!;
        let rg_pass:String = password1.text!;
        
  
        //Uses APIs
        var request = URLRequest(   url: url!,
                                    cachePolicy:.reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 30);
        
        // Send Post
        // request.httpBody = "x=5&y=3".data(using: .utf8)
        request.httpBody = "account=\(rg_name)&password=\(rg_pass)".data(using: .utf8)
        request.httpMethod = "POST"
            
        let session = URLSession(configuration: .default);
            
        let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                            print("---1--\n")
                            let html1 = String(data: data, encoding: .utf8)
                            print(html1)
                        
                             let aqi = try JSONDecoder().decode([CreateHttpResponse].self, from: data)
                             print("---2--\n")
                             print(aqi)

                             print("---3--\n")
                             aqi.forEach { (p) in
                                print(p)
                                 
                                 //print(aqi.[purchase].status1)
                                 //print(aqi.message1)

                             }
                        

                       } catch  {
                             print(" enter error routine \n")
                    }
                    print("http connected success");

                }
                else {
                    print("http connected failed");
                }
            }

            dataTask.resume()
    }
    
    //Register an account
    @IBAction func Btn_register(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_item2_register"{
            let vc = segue.destination as! item2_registerVC
    
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        if segue.identifier == "unwind_reg_to_item2" {
            let vc = segue.source as! item2_registerVC
            
        }
    }
    
    
    
}
