//
//  ViewController.swift
//  LearnGCD
//
//  Created by duy on 11/14/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        queueWithDelay
//        globalQueue();
        mainQueue();
        
    }
    
    func mainQueue() {
        let imageURL = URL(string: "https://www.google.com.vn/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")!;
        let urlSession = URLSession(configuration: .default);
        urlSession.dataTask(with: imageURL) { (imageData, response, error) in
            if let data = imageData  {
                print("Image has been downloaded");
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
    func globalQueue() {
        let queue = DispatchQueue.global(qos: .userInitiated);
        queue.async {
            print("globalQueue")
        }
    }
    
    func queueWithDelay() {
        let queue = DispatchQueue(label: "queue3", qos: .userInitiated);
        let delayTime: DispatchTimeInterval = .seconds(2);
        print(Date())
        queue.asyncAfter(deadline: .now() + delayTime) {
            print("Hello")
        }
    }
    
    func simpleQueues() {
        
        let queue = DispatchQueue(label: "queue1", qos: .userInitiated);
        let queue1 = DispatchQueue(label: "queue2", qos: .utility);
        
        queue.async {
            for i in 0..<10 {
                print("#1 ", i)
            }
           
        }
        
        queue1.async {
            for  i in 100..<110 {
                print("#2 ", i)
            }
        }
        
    }


}

