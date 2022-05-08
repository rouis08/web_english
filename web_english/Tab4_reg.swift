//
//  item2_registerVC.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/16/22.
//

import UIKit


var logig_state:Int = 0
var login_account:String = "none"

class item2_registerVC: UIViewController {

    @IBOutlet weak var reg_account: UITextField!
    @IBOutlet weak var reg_password: UITextField!
    @IBOutlet weak var reg_password2: UITextField!
    @IBOutlet weak var reg_mobile: UITextField!
    @IBOutlet weak var btn_send: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\(rouis+1)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // Press btn_send to submit your registration data to SQL server
    @IBAction func btn_send_touchUp(_ sender: Any) {
        
        print("btn_send pressed")
        

        //Todo: We need to add error handling when any text field is empty
        if (reg_account.text!.isEmpty || reg_password.text!.isEmpty || reg_password2.text!.isEmpty || reg_mobile.text!.isEmpty) {
            // 有 .alert 與 .actionSheet 兩種風格
            let alertController = UIAlertController(
                title: "提醒",
                message: "每個欄位都要輸入哦",
                preferredStyle: .alert)
            
            // 宣告一個「確定」按鈕
            let okAction = UIAlertAction(title: "OK", style: .default)
            { (action) in
                // 按鈕按下去後要做的事情寫在這
            }
            
            // 將確定按鈕加到UIAlertController
            alertController.addAction(okAction)
            
            // 顯示訊息框
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        if(reg_password.text != reg_password2.text) {
            let alertController = UIAlertController(
                title: "提醒",
                message: "密碼不一致",
                preferredStyle: .alert)
            
            // 宣告一個「確定」按鈕
            let okAction = UIAlertAction(title: "OK", style: .default)
            { (action) in
                // 按鈕按下去後要做的事情寫在這
            }
            
            // 將確定按鈕加到UIAlertController
            alertController.addAction(okAction)
            
            // 顯示訊息框
            present(alertController, animated: true, completion: nil)
            
            return
        } else {
            print("password field matched")
        }
        
        //let id1:String = id_text.text!;
        let rg_account:String = reg_account.text!;
        let rg_pass:String = reg_password.text!;
        let rg_pass2:String = reg_password2.text!;
        let rg_mobile:String = reg_mobile.text!;
        
        //let url = URL(string: "http://220.136.34.145/temp.php");
        //let url = URL(string: "http://1.34.110.11/webEnglish/temp.php");
        let url = URL(string: "http://1.34.110.11/webEnglish/insert_member.php");
        //Uses APIs
        var request = URLRequest(
            url: url!,
            cachePolicy:.reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 30);
        
            // Send Post
            //request.httpBody = "x=5&y=3".data(using: .utf8)
            request.httpBody = "account=\(rg_account)&password=\(rg_pass)&mobile=\(rg_mobile)".data(using: .utf8);
            request.httpMethod = "POST";
            
            let session = URLSession(configuration: .default);
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                print("success on connection");
                
                
                if let data = data {
                    let html = String(data: data, encoding: .utf8)
                    print("php message")
                    var message2:String = html!
                    print(message2)
                    print(message2.lowercased())
                    print(message2.count)
                    var message3:String? = "OK"
                    print(message3!.count)
                  
                  /*
                    let a = "OK"
                    let b = "REGISTERED"
                    let c = "FAILED"                    if message2.compare(a, options: .caseInsensitive) == .orderedSame {
                        print("register successful")
                        logig_state = 1
                        login_account = rg_account
                    }else if message2.compare(b, options: .caseInsensitive) == .orderedSame {
                        logig_state = 0
                        print("register failed")
                    }else
                    {
                        print("the others")
                    }
                  */
                    if message2.uppercased() == "OK" {
                        print("OK")
                    } else if message2.lowercased() == "registered " {
                        print("REGISTERED")
                    } else if message2.uppercased() == "FAILED" {
                        print("FAILED")
                    } else {
                        print("nothing else")
                    }
                
                    
                    do {
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
                    }
                    /*
                    let alertController = UIAlertController(
                        title: "訊息",
                        message: "註冊成功並登入",
                        preferredStyle: .alert)
                    
                    // 宣告一個「確定」按鈕
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    { (action) in
                        // 按鈕按下去後要做的事情寫在這
                    }
                    
                    // 將確定按鈕加到UIAlertController
                    alertController.addAction(okAction)
                    
                    // 顯示訊息框
                    self.present(alertController, animated: true, completion: nil)
                    logig_state = 1;
                    login_account = rg_account

                    */


                }
                else {
                    print("failed on connection");
                }
            }
            
            dataTask.resume()
            
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        print("test")
    }
    
    
}
