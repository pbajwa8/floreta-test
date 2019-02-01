//
//  VideoPreviewViewController.swift
//  
//
//  Created by Param - Hailify on 1/31/19.
//

import UIKit
import AVFoundation
import AVKit

class VideoPreviewViewController: AVPlayerViewController {
    
    var videoURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            let overlayView = UIView(frame: self.view.bounds)
            
//            let titleLabel = UILabel(frame: CGRect(x: overlayView.center.x - 50, y: overlayView.frame.minY + 10, width: 200, height: 150))
            
            let nextButton = UIButton(type: UIButton.ButtonType.roundedRect)
            
            nextButton.frame = CGRect(x: overlayView.center.x - 50, y: overlayView.frame.minY + 75, width: 100, height: 50)
            
            nextButton.setTitle("Proceed", for: UIControl.State.normal)
            
            nextButton.tintColor = UIColor.white
            
            nextButton.backgroundColor = UIColor.darkGray
            
            nextButton.addTarget(self, action: #selector(self.nextButtonAction(sender:)), for: .touchUpInside)
            
            overlayView.addSubview(nextButton)
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! UploadViewController
        
        vc.videoURL = self.videoURL
        
    }
    
    
    @objc func nextButtonAction(sender: UIButton) {
        self.player?.isMuted = true
        performSegue(withIdentifier: "showUpload", sender: nil)
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
