//
//  mapViewController.swift
//  asobiba
//
//  Created by 田中千洋 on 2015/12/23.
//  Copyright © 2015年 田中 颯. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var myLocationManager: CLLocationManager!
    var myMapView: MKMapView!
    var longitude: CLLocationDegrees!// 経度
    var latitude: CLLocationDegrees! //　緯度
    let myLatDist : CLLocationDistance = 100
    let myLonDist : CLLocationDistance = 100
    var myRegion: MKCoordinateRegion!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "maps"

        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
    
    
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            self.myLocationManager.requestAlwaysAuthorization()
            // 取得精度の設定.
            myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
            
        }
        myMapView = MKMapView()
        // MapViewのサイズを画面全体に.
        myMapView.frame = self.view.bounds
        // Delegateを設定.
        myMapView.delegate = self
        
        
        // 縮尺.
        self.view.addSubview(myMapView)
        
        


    
    }
    func locationManager(manager: CLLocationManager!,didFailWithError error: NSError!){
        print("error")
    }
    
    
   
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
