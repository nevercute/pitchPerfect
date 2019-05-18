//
//  AudioService.swift
//  PitchPerfect
//
//  Created by NEVERCUTE on 16/05/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import AVFoundation

class RecordSoundsService {
    
    fileprivate var audioRecorder: AVAudioRecorder!
    fileprivate let session = AVAudioSession.sharedInstance()
    
    //MARK: Recording audio service
    open func recordAudio(delegator: AVAudioRecorderDelegate) {
        let date = Date.init()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_hh-mm-ss"
        let dateString = dateFormatter.string(from: date)
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let recordingName = "pitch_perfect_\(dateString).wav"
        let pathArray = [dirPath.path, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        try! session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
        try! session.setActive(true, options: .notifyOthersOnDeactivation)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = delegator
        audioRecorder.isMeteringEnabled = false
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    open func stopRecordAudio() {
        audioRecorder.stop()
        try! session.setActive(false)
    }
    
    open func getRecordPath() -> URL {
        return audioRecorder.url
    }

}
