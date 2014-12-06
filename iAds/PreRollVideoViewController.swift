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
