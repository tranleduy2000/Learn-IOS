//
//  SampleViewController.swift
//  LearnNib
//
//  Created by duy on 11/6/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    let attr: String;
    
    init(attr: String){
        self.attr = attr;
        super.init(nibName: "SampleViewControler", bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
