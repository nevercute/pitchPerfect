//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by NEVERCUTE on 29/04/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {
    
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
        recordService.recordAudio()
    }
    
    @IBAction func stopRecordingAudio(_ sender: UIButton) {
        recordLabel.text = "Tap To Record"
        recordButton.isHidden = false
        stopRecordButton.isHidden = true
        
        recordService.stopRecordAudio()
    }
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopRecordButton: UIButton!
    
}

