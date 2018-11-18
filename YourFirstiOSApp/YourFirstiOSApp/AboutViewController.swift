//
//  AboutViewController.swift
//  YourFirstiOSApp
//
//  Created by duy on 11/4/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var mWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html")!
        let urlRequest = URLRequest(url: url)
        mWebView.loadRequest(urlRequest)
    }
   
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
