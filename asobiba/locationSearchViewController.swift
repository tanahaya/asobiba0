//
//  locationSearchViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/24.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class locationSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource   {
    
    let myItems: [NSArray] = [ ]
    var myTableView: UITableView!
    var myTextField: UITextField!
    var backButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTextField = UITextField(frame: CGRectMake(0,0,280,40))
        // 2
        let item = UIBarButtonItem(customView: myTextField)
        myTextField.backgroundColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = item
        self.myTextField.layer.borderColor = UIColor.blackColor().CGColor
        self.myTextField.layer.borderWidth = 1
        self.myTextField.layer.cornerRadius = 10
        myTextField.placeholder = "検索"
        
        myTextField.textAlignment = NSTextAlignment.Center
       
        
        
        
        
        
        
        self.navigationController?.navigationBar
        // NavigationBarの表示する.
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
//        self.navigationItem.title = "場所で検索"
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        
        return cell
    }

}
