//
//  MainTabViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/18.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit
import Foundation

class MainTabViewController: UITabBarController {

    var eatView: eatViewController!
    var playView: playViewController!
    let colorBg = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eatView = eatViewController()
        playView = playViewController()
        eatView.tabBarItem = UITabBarItem(title: "食べる", image: UIImage(named: "eat.png"), selectedImage: UIImage(named: "eat.png"))
        playView.tabBarItem = UITabBarItem(title: "遊ぶ", image: UIImage(named: "walk.png"), selectedImage: UIImage(named: "walk.png"))
        
        let eatNavigationController = UINavigationController(rootViewController: eatView)
        let playNavigationController = UINavigationController(rootViewController: playView)
        self.setViewControllers([eatNavigationController, playNavigationController], animated: false)
                
        UITabBar.appearance().barTintColor = colorBg
        
        self.navigationController?.navigationBar.barTintColor = colorBg
        
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
