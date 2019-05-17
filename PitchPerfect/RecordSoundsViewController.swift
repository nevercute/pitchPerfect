//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by NEVERCUTE on 29/04/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    let recordService = RecordSoundsService()

    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated )
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        recordLabel.text = "Recording..."
        stopRecordButton.isHidden = false
        recordButton.isHidden = true
        recordService.recordAudio(delegator: self)
    }
    
    @IBAction func stopRecordingAudio(_ sender: UIButton) {
        recordLabel.text = "Tap To Record"
        recordButton.isHidden = false
        stopRecordButton.isHidden = true
        
        recordService.stopRecordAudio()
    }
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopRecordButton: UIButton!
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: recordService.getRecordPath()) 
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedUrl = sender as! URL
            playSoundsVC.recordedAudioUrl = recordedUrl
        }
    }
    
}

