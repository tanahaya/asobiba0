import UIKit


class playViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    
    var myItems: [String] = ["1","2","3","4","5"]
    var nameItems: [String] = ["ラーメン","焼き肉","サイゼリア","ラーメン２","ラーメン３"]
    var starItems: [String] = ["4.5","4.3","3.4","2.4","1.7"]
    var categoryItems: [String] = ["ラーメン","焼き肉","ファミレス","ラーメン","ラーメン"]
    var comentnumberItems: [String] = ["16","11","8","7","5"]
    
    
    
    
    var myTableView: UITableView = UITableView()
    let colorBg = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0)
    var searchButton:UIButton!
    var locationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "遊ぶ"
        // Viewの背景色をorengeに設定する.
        
        myTableView.backgroundColor = colorBg
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView.frame = CGRect(x: 0, y: barHeight + 45, width: displayWidth, height: displayHeight)
        myTableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        // DataSourceの設定.
        myTableView.dataSource = self
        // Delegateを設定.
        myTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(myTableView)
        //        self.navigationController?.navigationBar.barTintColor = colorBg
        // Do any additional setup after loading the view, typically from a nib.
        
        
        searchButton = UIButton(frame: CGRectMake(0,0,360,27))
        searchButton.backgroundColor = UIColor.whiteColor()
        searchButton.layer.masksToBounds = true
        searchButton.setTitle("詳しく検索", forState: .Normal)
        searchButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.position = CGPoint(x: self.view.bounds.width / 2, y:110)
        searchButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        searchButton.addTarget(self, action: "searchButton:", forControlEvents: .TouchUpInside)
        searchButton.layer.borderWidth = 3
        self.view.addSubview(searchButton);
        //サーチボタン用
        
        
        
        
        locationButton = UIButton(frame: CGRectMake(0,0,360,27))
        // 枠を表示する.
        locationButton.layer.position = CGPoint(x:self.view.bounds.width / 2,y:80);
        locationButton.backgroundColor = UIColor.whiteColor()
        // Viewに追加する.
        locationButton.setTitle("現在地", forState: .Normal)
        locationButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        locationButton.layer.borderWidth = 3
        locationButton.addTarget(self, action: "locationsearchButton:", forControlEvents: .TouchUpInside)
        locationButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        self.view.addSubview(locationButton)
        //locationボタン用
        
        
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
        
        let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.numberLabel.numberOfLines = 0
        cell.numberLabel.text = self.myItems[indexPath.row]
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = self.nameItems[indexPath.row]
        cell.starLabel.numberOfLines = 0
        cell.starLabel.text = "評価 : " + self.starItems[indexPath.row]
        cell.categoryLabel.numberOfLines = 0
        cell.categoryLabel.text = "カテゴリー : " + self.categoryItems[indexPath.row]
        cell.comentnumberLabel.numberOfLines = 0
        cell.comentnumberLabel.text = "コメント数 : " + self.comentnumberItems[indexPath.row]
        //        cell.contentLabel.text = "ホゲホゲ";
        cell.locationButton.addTarget(self, action: "mapButton:", forControlEvents: .TouchUpInside)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
        
        
        
    }
    func searchButton(sender:UIButton) {
        let myfourthViewController: UIViewController = searchViewController()
        
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(myfourthViewController, animated: true)
    }
    func mapButton(sender:UIButton){
        print("hello")
        let mySecondViewController: UIViewController = mapViewController()
        // Viewの移動する.
        self.navigationController?.pushViewController(mySecondViewController, animated: true)    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let font = UIFont.systemFontOfSize(17)
        
        let bounds = CGSizeMake(self.view.frame.size.width - 16, CGFloat.max)
        
        let attributes = [NSFontAttributeName: font]
        
        let options = unsafeBitCast(NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue |
            
            NSStringDrawingOptions.UsesFontLeading.rawValue, NSStringDrawingOptions.self)
        
        let rect:CGRect = myItems[indexPath.row].boundingRectWithSize(bounds, options: options, attributes: attributes, context: nil)
        
        let size:CGSize? = CGSize(width: rect.size.width, height: rect.size.height)
        
        let height = size?.height
        
        if height! + 100 > 250 {
            
            return height! + 100
            
        } else {
            
            return 250
            
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        print("hoge")
        
        
        
        let information = UITableViewRowAction(style: .Normal, title: "詳しく") {
            
            (action, indexPath) in
            let myfiveViewController: UIViewController = informationViewController()
            // Viewの移動する.
            self.navigationController?.pushViewController(myfiveViewController, animated: true)
            
        }
        let coment = UITableViewRowAction(style: .Normal, title: "コメントする") {
            
            (action, indexPath) in
            let mysevenViewController: UIViewController = comentViewController()
            // Viewの移動する.
            self.navigationController?.pushViewController(mysevenViewController, animated: true)
            
        }
        
        
        information.backgroundColor = UIColor.redColor()
        coment.backgroundColor = UIColor.greenColor()
        return [information,coment]
        
        
    }
    func locationsearchButton(sender:UIButton) {
        let mysixViewController: UIViewController = locationSearchViewController()
        
        // Viewの移動する.
        //self.presentViewController(myfourthViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(mysixViewController, animated: true)
    }
    
}