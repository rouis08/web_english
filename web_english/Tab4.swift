//
//  item2.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/5/22.
//

import UIKit

var rouis:Int = 60
// Tab 4
//I was not sure if I should put this struct inside of the ViewController()
struct member_user {
    var account: String = ""
    var password: String =  ""
}


//struct purchase: Codable {
//    var a: String
//    var b: String
//}

struct purchase: Codable {
   
    var id: String
    var item: String
    var price: String
    var amount: String
    var shipping: String
    var total: String
    var purchase_date: String
    var location: String
    var payment: String
    var note: String
}

struct Dog: Codable {
    var name: String
    var owner: String
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
        //let url = URL(string: "http://localhost/read_purchase_json2.php");
    
 

        //let id1:String = id_text.text!;
        let rg_name:String = account1.text!;
        let rg_pass:String = password1.text!;
        

        // Encode
        let dog = Dog(name: "Rex", owner: "Etgar")

        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(dog)
            let json = String(data: jsonData, encoding: String.Encoding.utf16)
            let jsonDecoder = JSONDecoder()
            let secondDog = try jsonDecoder.decode(Dog.self, from: jsonData)
            print(secondDog)
            
            //secondDog.forEach { (p) in
           //    print(p)
           // }
            
        } catch {
            
        }

    
        //Uses APIs
        var request = URLRequest(
            url: url!,
            cachePolicy:.reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 30);
        

            // Send Post
            //request.httpBody = "x=5&y=3".data(using: .utf8)
            request.httpBody = "account=\(rg_name)&password=\(rg_pass)".data(using: .utf8)
            request.httpMethod = "POST"
            
            let session = URLSession(configuration: .default);
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                
                    print("---0--\n")
                    print(data)

                    let html:String = String(data: data, encoding: .utf8)!
                    print("---1--\n")
                    print(html)
                    
                    print("---1.1--\n")
                    //print(html!)
                    
                    let data1 = html.data(using: .utf8)!
                    
                    print("---1.2--\n")
                    print(data as NSData)
                    
                  //  let dog = purchase(a: "test", b: "eead")

                  //  let jsonEncoder = JSONEncoder()
                  //  let jsonData = try jsonEncoder.encode(dog)
                  //  let json = String(data: jsonData, encoding: String.Encoding.utf16)
                    
                    
                    
                    do {
                             //let aqi = try JSONDecoder().decode(dog.self, from: data)
                        let aqi = try JSONDecoder().decode([purchase].self, from: data)
                             print("---2--\n")
                             print(aqi)

                             print("---3--\n")
                             aqi.forEach { (p) in
                                print(p)
                             }

                       } catch  {
                             print(" enter error routine \n")
                             print(error)
                             print(data)
                    }
                    //let aqi = try! JSONDecoder().decode([purchase].self, from: data)
                    //aqi.forEach { (p) in
                    //    print(p)
                    //}
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
