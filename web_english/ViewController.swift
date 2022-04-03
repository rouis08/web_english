//
//  ViewController.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/3/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var eng_word: UITextField!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var Search: UIButton!
    @IBOutlet weak var has_blank: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://tw.dictionary.search.yahoo.com/search?p=manipulate&ei=UTF-8&nojs=1")
        let request = URLRequest(url:url!)
        webView.load(request)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        
        var url1:URL
        if eng_word.text!.isEmpty
        {
            url1 = URL(string: "https://tw.dictionary.search.yahoo.com/search?p=manipulate&ei=UTF-8&nojs=1")!
        }
        else
        {
            let engWord:String = eng_word.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if isBlank(eng_word.text!)
            {
                print("there is a blank")
                has_blank.text = "blank"
            }
            else
            {
                print("there is a no blank")
                has_blank.text = "no blank"
            }
            
            
            eng_word.endEditing(true)
            url1 = URL(string: "https://tw.dictionary.search.yahoo.com/search?p=\(engWord)&ei=UTF-8&nojs=1")!
            let request1 = URLRequest(url:url1)
            webView.load(request1)
        }
        //eng_word.endEditing(true)
        //let request1 = URLRequest(url:url1)
        
        
    }

    func isBlank(_ string: String) -> Bool {
      for character in string {
        if !character.isWhitespace {
            return false
        }
      }
      return true
    }
    

    /*
    extension String {
      var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
      }
    }
     */


}

