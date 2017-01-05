//
//  ViewController.swift
//  bolangxian
//
//  Created by 蒋潇涵 on 2017/1/4.
//  Copyright © 2017年 蒋潇涵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        waveView.backgroundColor = UIColor.init(red: 200/255.0, green: 30/255.0, blue: 20/255.0, alpha: 1)
    }


    @IBOutlet weak var waveView: WaveView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        waveView.wave()
        
        
    }
    

}

