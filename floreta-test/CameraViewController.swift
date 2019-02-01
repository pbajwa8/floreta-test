//
//  CameraViewController.swift
//  floreta-test
//
//  Created by Param - Hailify on 1/31/19.
//  Copyright © 2019 Param. All rights reserved.
//

import UIKit
import FilterCam

class CameraViewController: FilterCamViewController, FilterCamViewControllerDelegate {
    
    var outputURL: URL!
    
    private let myFilters: [[CIFilter]] = [
        [],
        [CIFilter(name: "CIPhotoEffectNoir")!]
    ]
    
    @IBOutlet weak var toggleFilter: UISegmentedControl!
    @IBOutlet weak var recordButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraDelegate = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func record(_ sender: UIButton) {
        sender.isSelected ? stopRecording() : startRecording()
        sender.isSelected = !sender.isSelected
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! VideoPreviewViewController
        
        vc.videoURL = sender as! URL
        
    }
    
    @IBAction func toggleFilter(_ sender: UISegmentedControl) {
        filters = myFilters[sender.selectedSegmentIndex]
    }
    
    func filterCamDidStartRecording(_ filterCam: FilterCamViewController) {
    }
    
    func filterCamDidFinishRecording(_ filterCame: FilterCamViewController) {
    }
    
    func filterCam(_ filterCam: FilterCamViewController, didFinishWriting outputURL: URL) {
        let videoRecorded = outputURL as URL
        
        self.performSegue(withIdentifier: "showPreview", sender: videoRecorded)
        
    }
    
    func filterCam(_ filterCam: FilterCamViewController, didFocusAtPoint tapPoint: CGPoint) {}
    
    func filterCam(_ filterCam: FilterCamViewController, didFailToRecord error: Error) {
        print("Error recording movie")
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
