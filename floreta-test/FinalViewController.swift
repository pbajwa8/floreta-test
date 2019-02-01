//
//  FinalViewController.swift
//  floreta-test
//
//  Created by Param - Hailify on 2/1/19.
//  Copyright © 2019 Param. All rights reserved.
//
import UIKit
import AVFoundation
import AVKit

class FinalViewController: AVPlayerViewController {
    
    var videoURL: URL!
    
    var videoTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            let overlayView = UIView(frame: self.view.bounds)
            
            let titleLabel = UILabel(frame: CGRect(x: overlayView.center.x - 25, y: overlayView.frame.minY + 10, width: 200, height: 150))
            
            titleLabel.text = self.videoTitle
            
            titleLabel.adjustsFontSizeToFitWidth = true
            
            overlayView.addSubview(titleLabel)
            
            self.contentOverlayView?.addSubview(overlayView)
            
            self.view.layoutSubviews()
            
            self.player = AVPlayer(url: self.videoURL)
            self.player?.play()
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player!.currentItem, queue: .main) { [weak self] _ in
                self?.player?.seek(to: CMTime.zero)
                self?.player?.play()
            }
            
        }

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

}
