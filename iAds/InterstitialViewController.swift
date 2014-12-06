//
//  InterstitialViewController.swift
//  iAds
//
//  Created by Shrikar Archak on 12/6/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit
import iAd
class InterstitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Automatic presentation , you can't control when the ad loads */
        self.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Automatic
        
        
        /* In manual mode you can control when the ad can load */
//        self.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Manual
//        self.requestInterstitialAdPresentation()
    }
    override func viewWillAppear(animated: Bool) {
        NSLog("Requesting")
        self.requestInterstitialAdPresentation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
