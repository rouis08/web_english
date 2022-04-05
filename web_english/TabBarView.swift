//
//  TabBarView.swift
//  web_english
//
//  Created by Shao Hua Lee on 4/5/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add your code below
        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        /*
        if viewController is "item" do {
            print("first tab");
        }
        else if viewController is  "item 1" do {
            print("second tab")
        }
        else if viewController is  "item 2" do {
            print("third tab")
        } 
        */
    }
}
