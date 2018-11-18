//
//  MasterViewController.swift
//  LearnContainerUIViewController
//
//  Created by duy on 11/18/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private lazy var summaryViewController: SummaryViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        var viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController;
        
        add(asChildViewController: viewController)
        
        return viewController;
    }()
    
    private lazy var sessionsViewController : SessionsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        let viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController;
        
        add(asChildViewController: viewController)
        
        return viewController;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
    }
    
    private func setupView() {
        setupSegmentControl();
    }

    
    private func setupSegmentControl() {
        //configure segment control
        segmentControl.removeAllSegments();
        segmentControl.insertSegment(withTitle: "Summary", at: 0, animated: false);
        segmentControl.insertSegment(withTitle: "Sessions", at: 1, animated: false);
        segmentControl.addTarget(self, action: #selector(selectionDidChanged(_:)), for: .valueChanged);
        
        segmentControl.selectedSegmentIndex = 0;
    }
    
    @objc func selectionDidChanged(_ sender: UISegmentedControl) {
        updateView();
    }
    
    private func updateView() {
        if segmentControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: sessionsViewController)
            add(asChildViewController: summaryViewController)
        } else {
            remove(asChildViewController: summaryViewController)
            add(asChildViewController: sessionsViewController)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        //add child view controller
        addChild(viewController);
        
        view.addSubview(viewController.view);
        
        //configure child view
        viewController.view.frame = self.view.bounds;
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        
        //notify, IMPORTANT
        viewController.didMove(toParent: self)
        
    }
    
    func remove(asChildViewController viewController: UIViewController) {
        //notify before remove, IMPORTANT
        viewController.willMove(toParent: nil)
        
        viewController.view.removeFromSuperview();
        
        viewController.removeFromParent()
        
    }

}

