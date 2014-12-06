iAds
====

Demo for integrating different types of iAds in app


> iAd is an ad platform from Apple. 


In this post we will discuss how to monetize your apps using iAd platform. Lets get started.

### Four types of ads
   * ) Banner ads
   * ) Interstitial ads
   * ) Medium Rect
   * ) Pre roll video

####  Banner
   * ) Full device width view
   * ) Placed at the bottom of the content
   * ) The ads keeps rolling no configuration required
   * ) Supports iphone and ipad
   
    #### Integration
    * Link iAd framework
    * Import iAd framework in your view controller and configure view controller
<pre>
	 import iAd
	 viewController.canDisplayBannerAds = true
</pre>	 

	#### Handling Banner ad clicks
	When the banner ad is clicked a full screen pop will show more about the ad. Before this happens we need to pause any activity in the viewWillDisappear method and resume the activity in viewWillAppear.
	
	
#### Interstitial
   * ) Full screen add

	#### Prepare for Interstitial
	In `applicationDidFinishLaunchingWithOptions` prepare for interstitial ads display by calling `UIViewController.prepareInterstitialAds()`
	
   #### Integration
   In automatic mode you dont can't control when the ad shows up
<pre>
viewController.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Automatic
</pre>   

   In manual mode you control when to show up the ad
<pre>
viewController.interstitialPresentationPolicy = ADInterstitialPresentationPolicy.Manual
</pre>   

#### Medium Rect
   * Positined inline with content
   * Automatic recycling
   * Fullscreen ad on tap

   This is a bit more complicated than the banner and interstitial ads. We need to create the banner explicity and handle delegate to display medium rect ad.

<pre>
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
</pre>   


#### Pre Roll Ad
   * Short video before content
   * Full screen ads on tap

<pre>
//
//  PreRollVideoViewController.swift
//  iAds
//
//  Created by Shrikar Archak on 12/6/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit
import MediaPlayer
import iAd

class PreRollVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://www.youtube.com/watch?v=m3ZyU98N3Fk")
        let moviePlayer = MPMoviePlayerController(contentURL: url)
        moviePlayer.prepareToPlay()
        moviePlayer.view.frame = self.view.bounds
        
        NSLog("Self : frame : \(NSStringFromCGRect(self.view.frame))")
        NSLog("Self : bounds : \(NSStringFromCGRect(self.view.bounds))")
        NSLog("Movie : frame : \(NSStringFromCGRect(moviePlayer.view.frame))")
        NSLog("Movie : bounds : \(NSStringFromCGRect(moviePlayer.view.bounds))")
        
        self.view.addSubview(moviePlayer.view)
        moviePlayer.view.layoutIfNeeded()
        self.view.layoutIfNeeded()

        moviePlayer.playPrerollAdWithCompletionHandler { (error) -> Void in
            NSLog("\(error)")
            moviePlayer.play()
        }
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

</pre>   
