//
//  informationVIewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/24.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class informationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    let myItems: NSArray = ["店名", "評価", "コメント数","現在地からの距離","カテゴリー","営業時間","値段","電話番号","リンク"]
    var myTableView: UITableView!
    var postButton:UIBarButtonItem!
    let comentItems: NSArray = ["コメント", "コメント", "コメント", "コメント"]
    let mySections: NSArray = ["情報", "コメント"]
    let comentnumber: NSArray = ["4.5","2.2","3.3","1.8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        self.title = "" + "のお店情報"
        
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
        // Viewに追加する
        self.view.addSubview(myTableView)
        
        postButton = UIBarButtonItem(title: "投稿する", style: .Plain, target: self, action: "movepost:")
        self.navigationItem.rightBarButtonItem = postButton
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            print("Value: \(myItems[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(comentItems[indexPath.row])")
//            let myoneViewController: UIViewController = comentContentViewController()
//            
//            // Viewの移動する.
//            //self.presentViewController(myfourthViewController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(myoneViewController, animated: true)
            
            
        }
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myItems.count
        } else if section == 1 {
            return comentItems.count
        } else {
            return 0
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mySections.count
    }
    
    /*
    セクションのタイトルを返す.
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.
        if indexPath.section == 0{
            cell.textLabel!.text = "\(myItems[indexPath.row])" + "      :" + ""
        } else if indexPath.section == 1{
            cell.textLabel!.text = "評価:" + "\(comentnumber[indexPath.row])" + "     " + "\(comentItems[indexPath.row])"
        }
        return cell
    }
    func movepost(sender: UIButton){
        let myeightViewController: UIViewController = comentViewController()
        
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(myeightViewController, animated: true)
        
        
    }
    
}
