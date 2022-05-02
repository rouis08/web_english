//
//  item2_registerVC.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/16/22.
//

import UIKit

class item2_registerVC: UIViewController {

    @IBOutlet weak var reg_name: UITextField!
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
        
        let url = URL(string: "http://1.34.110.11/webEnglish/create_table.php");
 
        //let id1:String = id_text.text!;
        let rg_name:String = reg_name.text!;
        let rg_pass:String = reg_password.text!;
        let rg_pass2:String = reg_password2.text!;
        let rg_mobile:String = reg_mobile.text!;
        
        
        //Todo: We need to add error handling when any text field is empty
        
        //Uses APIs
        var request = URLRequest(
            url: url!,
            cachePolicy:.reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 30);
        
        if (rg_pass != rg_pass2){
            print("password are not matched")
        }
        else {
            // Send Post
            //request.httpBody = "x=5&y=3".data(using: .utf8)
            request.httpBody = "name=\(rg_name)&password=\(rg_pass)&mobile=\(rg_mobile)".data(using: .utf8);
            request.httpMethod = "POST";
            
            let session = URLSession(configuration: .default);
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let html = String(data: data, encoding: .utf8)
                    print(html!)
                    print("success on connection");
                }
                else {
                    print("failed on connection");
                }
            }
            
            dataTask.resume()
            
            
            //Check feedback webpage
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
}
