//
//  ViewController.swift
//  DylanFrameWork
//
//  Created by Dylan on 15/12/23.
//  Copyright © 2015年 Dylan.Lee. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 朗读语音
//        AudioCenter.sharedInstance.startSpeech("")
        
        let audioModel = AudioCenter()
        print(audioModel)
        let audioModel01 = AudioCenter()
        print(audioModel01)
        let imageView = UIImageView
        
        HTTPRequestManager.GET(HTTPRequestManager.URL.kBaidu, params: nil, success: { (resp) -> () in
            
            }) { (errorMsg) -> () in
                
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

