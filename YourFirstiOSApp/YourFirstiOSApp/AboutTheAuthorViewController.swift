//
//  AboutTheAuthorViewController.swift
//  YourFirstiOSApp
//
//  Created by duy on 11/4/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class AboutTheAuthorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
