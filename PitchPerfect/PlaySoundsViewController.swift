//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by NEVERCUTE on 17/05/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    var recordedAudioUrl: URL!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startPlayingAudio(_ sender: UIButton) {
        print("Playing audio")
    }
    
    @IBAction func stopPlayingAudio(_ sender: UIButton) {
        print("Stop playing audio")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
