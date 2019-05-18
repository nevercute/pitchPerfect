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
        setRecordLabelAndButtonStates(labelText: "Recording...", hideRecordButton: true, hideStopButton: false)
        recordService.recordAudio(delegator: self)
    }
    
    @IBAction func stopRecordingAudio(_ sender: UIButton) {
        setRecordLabelAndButtonStates(labelText: "Tap To Record", hideRecordButton: false, hideStopButton: true)
        recordService.stopRecordAudio()
    }
    
    fileprivate func setRecordLabelAndButtonStates(labelText: String, hideRecordButton: Bool, hideStopButton: Bool) {
        recordLabel.text = labelText
        stopRecordButton.isHidden = hideStopButton
        recordButton.isHidden = hideRecordButton
    }
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopRecordButton: UIButton!
    
    //MARK: Perfirming segue when recording finished
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: recordService.getRecordPath()) 
        }
    }
    
    //MARK: Sending audio file path to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedUrl = sender as! URL
            playSoundsVC.recordedAudioURL = recordedUrl
        }
    }
    
}

