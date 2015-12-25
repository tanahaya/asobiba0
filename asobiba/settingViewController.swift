//
//  settingViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/24.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class settingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myTableView: UITableView = UITableView()
    var myItems: [String] = ["ニックネーム","学年","口コミ数","学校","性別","趣味","自己紹介"]
    var statusItems: [String] = ["tanahaya","中学３年","7","聖光学院","男","ゲーム","なし"]
    var myImageView: UIImageView!
    var editButton:UIBarButtonItem!
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "プロフィール"
        self.view.backgroundColor = UIColor.orangeColor()
        
        statusItems = saveData.objectForKey("status") as! [String]
        
        
        myImageView = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width,140))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: "eat.png")
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 134)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
        editButton = UIBarButtonItem(title: "編集する", style: .Plain, target: self, action: "edit:")
        self.navigationItem.rightBarButtonItem = editButton
        
        
        
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView.frame = CGRect(x: 0, y: barHeight + 185, width: displayWidth, height: displayHeight)
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
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
    Cellの総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(myItems[indexPath.row])" + "      :       " + "\(statusItems[indexPath.row])"
        
        return cell
    }
    func edit(sender:UIButton) {
        
        saveData.setObject(statusItems, forKey: "status")
        
        let mytwoViewController: UIViewController = editViewController()
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(mytwoViewController, animated: true)
    }
    

}
