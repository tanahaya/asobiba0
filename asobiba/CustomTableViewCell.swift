//
//  CustomTableViewCell.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/23.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    var titleLabel = UILabel();
    var contentLabel = UILabel();
    var numberLabel = UILabel();
    var starLabel = UILabel();
    var categoryLabel = UILabel();
    var comentnumberLabel = UILabel();
    var myImageView1: UIImageView!
    var myImageView2: UIImageView!
    var myImageView3: UIImageView!
    var locationButton: UIButton!
    

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        //First Call Super
        
        
        //cellの高さを変える
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        numberLabel = UILabel(frame: CGRectMake(10,15,300,15))
        numberLabel.text = "";
        numberLabel.font = UIFont.systemFontOfSize(18)
        self.addSubview(numberLabel)
        
        titleLabel = UILabel(frame: CGRectMake(30,15,300,15))
        titleLabel.text = "";
        titleLabel.font = UIFont.systemFontOfSize(18)
        self.addSubview(titleLabel)
        
        
        starLabel = UILabel(frame: CGRectMake(10,40,300,15))
        starLabel.text = "";
        starLabel.font = UIFont.systemFontOfSize(18)
        self.addSubview(starLabel)
        
        categoryLabel = UILabel(frame: CGRectMake(10,60,300,15))
        categoryLabel.text = "";
        categoryLabel.font = UIFont.systemFontOfSize(18)
        self.addSubview(categoryLabel)
        
        comentnumberLabel = UILabel(frame: CGRectMake(10,80,300,15))
        comentnumberLabel.text = "";
        comentnumberLabel.font = UIFont.systemFontOfSize(18)
        self.addSubview(comentnumberLabel)
        
        locationButton = UIButton(frame: CGRectMake(250,40,100,50))
        locationButton.backgroundColor = UIColor.redColor()
        locationButton.setTitle("where", forState: .Normal)
        locationButton.layer.cornerRadius = 20.0
        locationButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        self.addSubview(locationButton);
        
        
        // UIImageViewを作成する.
        myImageView1 = UIImageView(frame: CGRectMake(10,100,100,100))
        // 表示する画像を設定する.
        let myImage1 = UIImage(named: "eat.png")
        // 画像をUIImageViewに設定する.
        myImageView1.image = myImage1
        // 画像の表示する座標を指定する.
        self.addSubview(myImageView1)
        
        
        
        // UIImageViewを作成する.
        myImageView2 = UIImageView(frame: CGRectMake(130,100,100,100))
        // 表示する画像を設定する.
        let myImage2 = UIImage(named: "eat.png")
        // 画像をUIImageViewに設定する.
        myImageView2.image = myImage2
        // 画像の表示する座標を指定する.
        self.addSubview(myImageView2)
        
        
        
        // UIImageViewを作成する.
        myImageView3 = UIImageView(frame: CGRectMake(250,100,100,100))
        // 表示する画像を設定する.
        let myImage3 = UIImage(named: "eat.png")
        // 画像をUIImageViewに設定する.
        myImageView3.image = myImage3
        // 画像の表示する座標を指定する.
        self.addSubview(myImageView3)
        
//        let searchButton = UIButton(frame: CGRectMake(0,0,180,55))
//        searchButton.backgroundColor = UIColor.whiteColor()
//        searchButton.layer.masksToBounds = true
//        searchButton.setTitle("検索", forState: .Normal)
//        searchButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        searchButton.layer.cornerRadius = 20.0
//        searchButton.layer.position = CGPoint(x: self.view.bounds.width * 3/4, y:96)
//        searchButton.titleLabel?.font = UIFont.systemFontOfSize(25)
//        searchButton.addTarget(self, action: "searchButton:", forControlEvents: .TouchUpInside)
//        self.view.addSubview(searchButton);
        
        
        
            }
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
}