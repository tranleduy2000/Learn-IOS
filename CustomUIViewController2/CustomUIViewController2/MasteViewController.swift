//
//  ViewController.swift
//  CustomUIViewController2
//
//  Created by duy on 11/18/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private lazy var summaryViewController: SummaryViewController  = {
        print("Init summaryViewController")
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        let viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController;
        
        return viewController;
    }()
    
    private lazy var sessionsViewController : SessionsViewController = {
        print("Init sessionsViewController")
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        let viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController;
        
        return viewController;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupView();
    }
    
    private func setupView() {
        setupSegmentControl();
    }
    
    private func setupSegmentControl(){
        segmentControl.removeAllSegments();
        segmentControl.insertSegment(withTitle: "Summary", at: 0, animated: false);
        segmentControl.insertSegment(withTitle: "Sessions", at: 1, animated: false);
        segmentControl.addTarget(self, action: #selector(onSegmentDidSelected(_:)), for: .valueChanged);
        
        segmentControl.selectedSegmentIndex = 0;
        onSegmentDidSelected(segmentControl)
    }
    
    @objc func onSegmentDidSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //switch to summary
            remove(child: sessionsViewController);
            add(asChild: summaryViewController)
        } else {
            //switch to sessions
            remove(child: summaryViewController);
            add(asChild: sessionsViewController)
        }
    }
    
    private func remove(child viewController: UIViewController) {
        viewController.willMove(toParent: nil);
        viewController.view.removeFromSuperview();
        viewController.didMove(toParent: nil)
    }
    
    private func add(asChild viewController: UIViewController){
        viewController.willMove(toParent: self);
        
        self.view.addSubview(viewController.view)
        viewController.view.frame = self.view.bounds;
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    


}

