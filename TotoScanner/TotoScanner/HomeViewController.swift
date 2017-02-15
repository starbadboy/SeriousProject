//
//  HomeViewController.swift
//  TotoScanner
//
//  Created by Zhang Guoqiang on 15/2/17.
//  Copyright © 2017 SONG TAO. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabNames = ["first", "second"]
        var controllers = [UIViewController]()
        let rootOne = FirstViewController()
        let navOne = UINavigationController(rootViewController: rootOne)
        let rootTwo = SecondViewController()
        let navTwo = UINavigationController(rootViewController: rootTwo)
        let tabItemOne = UITabBarItem(title: "first", image: nil, selectedImage: nil)
        let tabItemTwo = UITabBarItem(title: "second", image: nil, selectedImage: nil)
        navOne.tabBarItem = tabItemOne
        navTwo.tabBarItem = tabItemTwo
        controllers = [navOne, navTwo]
        viewControllers = controllers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
