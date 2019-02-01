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
    
    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! FinalViewController
        
        vc.videoURL = self.videoURL
        vc.videoTitle = titleField.text!
    }
    

    @IBAction func upload(_ sender: UIButton) {
        
        guard let localfile: URL = videoURL else {
            print("error")
            return
        }
        
       
        let title = titleField.text!
        
        let storage = Storage.storage()
        
        let storageRef = storage.reference()
        
        let videoRef = storageRef.child("videos")
        

        let uploadTask = videoRef.child(title).putFile(from: localfile, metadata: nil) { metadata, error in
            guard let metadata = metadata else {
                print("Error uploading")
                return
            }
            // Metadata contains file metadata such as size, content-type.
            print(metadata)
            
            
            // You can also access to download URL after upload.
            videoRef.child(title).downloadURL { (url, error) in
                guard let downloadURL = url else {
                    print("error getting downloadURL")
                    return
                }
                
                let length = CMTimeGetSeconds(AVAsset(url: self.videoURL).duration)
                let location = downloadURL
                
                var db = Database.database().reference()
                
                db.child("/videos").childByAutoId().setValue(["title": title, "length": length, "resolution": "2436x1125", "format": "mp4", "location": location.absoluteString]) {
                    (error:Error?, ref:DatabaseReference) in
                    if let error = error {
                        print("Data could not be saved: \(error).")
                    } else {
                        print("Data saved successfully!")
                        self.performSegue(withIdentifier: "showFinal", sender: self)
                    }
                }
            }
            
        }
//

    }
        
       
        
       
        
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


