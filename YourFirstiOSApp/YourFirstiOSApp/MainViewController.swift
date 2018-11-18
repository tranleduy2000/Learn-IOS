//
//  ViewController.swift
//  YourFirstiOSApp
//
//  Created by duy on 11/4/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var currentValue: Int = 50;
    var targetValue: Int = 0;
    var score: Int = 0;
    var round = 0;
    
    @IBOutlet weak var mSlilder: UISlider!
    @IBOutlet weak var mTxtTarget: UILabel!
    @IBOutlet weak var mTxtScore: UILabel!
    @IBOutlet weak var mTxtRound: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let roundedValue = mSlilder.value.rounded();
        currentValue = Int(roundedValue);
        startNewRound();
        
        mSlilder.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Normal"), for: .normal);
        mSlilder.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Highlighted"), for: .highlighted);
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        mSlilder.setMinimumTrackImage(#imageLiteral(resourceName: "SliderTrackLeft").resizableImage(withCapInsets: insets), for: .normal)
        mSlilder.setMaximumTrackImage(#imageLiteral(resourceName: "SliderTrackRight").resizableImage(withCapInsets: insets), for: .normal)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let different: Int = Int(abs(targetValue - currentValue));
        print("diff: \(different)")
        var points = 100 - different;
        score += points;
        
        let title: String;
        if different == 0 {
            title = "Perfect!";
            points += 100;
        } else if different < 5 {
            title = "You almost had it!"
            if (different == 1){
                points += 50;
            }
        } else if different < 10 {
            title = "Pretty good!";
        } else {
            title = "Not even close...";
        }
        
        let message = "Your scored \(points) points";
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound();
        }));
        present(alert, animated: true, completion: nil);
        
    }
    
    @IBAction func slilderMoved(_ sender: UISlider) {
        print("Slider value: \(sender.value.rounded())")
        currentValue = Int(sender.value.rounded());
    }
    
    @IBAction func startOver(_ sender: Any) {
        score = 0;
        round = 0;
        startNewRound();
    }
    
    private func startNewRound(){
        round += 1;
        targetValue = Int.random(in: 1...100);
        currentValue = 50;
        
        mSlilder.value = Float(currentValue);
        
        updateLables();
    }
    
    private func updateLables() {
        mTxtTarget.text = String(targetValue)
        mTxtScore.text = String(score);
        mTxtRound.text = String(round);
    }
   
}

