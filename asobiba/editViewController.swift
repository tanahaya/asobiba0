//
//  editViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/25.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit

class editViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    let saveData = NSUserDefaults.standardUserDefaults()
    var myTableView: UITableView = UITableView()
    var myItems: [String] = ["ニックネーム","学校","趣味","自己紹介"]
    var statusItems:[String] = []
    var myImageView: UIImageView!
   
    var InputStr:String!
    var selectnumber:Int!
    var age:String!
    var comentcount:String!
    var gender:String!
    var backButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.title = "変更場所ところをタップしてください"
        
        
        
        
        statusItems = saveData.objectForKey("status") as! [String]
        
        age = statusItems[1]
        comentcount = statusItems[2]
        gender = statusItems[4]
        
        
        statusItems.removeAtIndex(1)
        statusItems.removeAtIndex(1)
        statusItems.removeAtIndex(2)
        
        
        self.view.backgroundColor = UIColor.orangeColor()
        
        myImageView = UIImageView(frame: CGRectMake(0,0,self.view.bounds.width,140))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: "eat.png")
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 134)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
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
        
        backButton = UIBarButtonItem(title: "完了", style: .Plain, target: self, action: "complete:")
        self.navigationItem.rightBarButtonItem = backButton

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
        selectnumber = indexPath.row
        self.alertButton()
        
        //選択時の行動
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
    func alertButton() {
        print("追加")
        let myAlert: UIAlertController = UIAlertController(title: "内容変更", message: "入力してください", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // OKアクション生成.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            print("OK")
            
            self.statusItems.removeAtIndex(self.selectnumber)
            self.statusItems.insert(self.InputStr, atIndex: self.selectnumber)
            self.myTableView.reloadData()
        }
        
        // Cancelアクション生成.
        let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive) { (action: UIAlertAction!) -> Void in
            print("Cancel")
        }
        
        // AlertにTextFieldを追加.
        myAlert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            
            // NotificationCenterを生成.
            let myNotificationCenter = NSNotificationCenter.defaultCenter()
            
            // textFieldに変更があればchangeTextFieldメソッドに通知.
            myNotificationCenter.addObserver(self, selector: "changeTextField:", name: UITextFieldTextDidChangeNotification, object: nil)
        }
        
        // Alertにアクションを追加.
        myAlert.addAction(OkAction)
        myAlert.addAction(CancelAction)
        
        // Alertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
        
        
        
    }
    func changeTextField (sender: NSNotification) {
        
        var textField = sender.object as! UITextField
        
        // 入力された文字を取得.
        InputStr = textField.text
       
    }
    func complete(sender:UIButton) {
        statusItems.insert(age, atIndex: 1)
        statusItems.insert(comentcount, atIndex: 2)
        statusItems.insert(gender, atIndex: 4)
        saveData.setObject(statusItems, forKey: "status")
        let myAlert: UIAlertController = UIAlertController(title: "変更できました", message: "OK", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // OKアクション生成.
        let OkAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            print("OK")
            
        
        }
        
        // Cancelアクション生成.
        
        // AlertにTextFieldを追加.
        
        // Alertにアクションを追加.
        myAlert.addAction(OkAction)
       
        
        // Alertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)


    }

}
