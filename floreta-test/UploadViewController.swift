//
//  UploadViewController.swift
//  floreta-test
//
//  Created by Param - Hailify on 1/31/19.
//  Copyright © 2019 Param. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation
import AVKit
import CoreMedia

class UploadViewController: UIViewController {
    
    var videoURL: URL!
    
//    var length: Double!
//
//    var resolution: String!
//
    let rootRef = Storage().reference()
    
    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let videoAsset = AVAsset(url: videoURL)
        
//        length = CMTimeGetSeconds(videoAsset.duration)
//
//        let track = videoAsset.tracks(withMediaType: AVMediaType.video).first
//
//        let naturalSize = track!.naturalSize.applying((track?.preferredTransform)!)
//
//        resolution = "\(naturalSize.width)" + "x" + "\(naturalSize.height)"
//
        // Do any additional setup after loading the view.
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    @IBAction func upload(_ sender: UIButton) {
        
        let videoRef = rootRef.child("videos")
        
        guard let localfile: URL = videoURL else {
            print("error")
            return
        }
        
        let uploadTask = videoRef.child("one").putFile(from: localfile)
        
//        uploadTask.observe(.resume) { snapshot in
//           print("upload started")
//        }
//
//        uploadTask.observe(.pause) { snapshot in
//            print("upload paused")
//        }
//
//        uploadTask.observe(.progress) { snapshot in
//            // Upload reported progress
//            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
//            print(percentComplete)
//        }
//
//        uploadTask.observe(.success) { snapshot in
//            // Upload completed successfully
//            print("upload successful")
//        }
//
//        uploadTask.observe(.failure) { snapshot in
//            if let error = snapshot.error as NSError? {
//                print(error)
//            }
//        }
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
