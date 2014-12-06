//
//  MediumRectViewController.swift
//  iAds
//
//  Created by Shrikar Archak on 12/6/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit
import iAd
class MediumRectViewController: UIViewController, ADBannerViewDelegate {
    var adView: ADBannerView?
    override func viewDidLoad() {
        super.viewDidLoad()

        adView = ADBannerView(adType: ADAdType.MediumRectangle)
        adView!.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.view.addSubview(adView!)
        self.view.layoutIfNeeded()
    }

    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        adView!.removeFromSuperview()
        self.view.layoutIfNeeded()
        
    }

}
