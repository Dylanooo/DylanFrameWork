//
//  AudioCenter.swift
//  DylanFrameWork
//
//  Created by Dylan on 15/12/24.
//  Copyright © 2015年 Dylan.Lee. All rights reserved.
//

import Foundation
import AVFoundation
class AudioCenter: NSObject, AVSpeechSynthesizerDelegate {
    let avSpeech = AVSpeechSynthesizer()
    
    class var sharedInstance: AudioCenter {
        
        get {
            struct SingletonStruct {
                static var onceToken:dispatch_once_t = 0
                static var singleton: AudioCenter? = nil
            }
            dispatch_once(&SingletonStruct.onceToken, { () -> Void in
                SingletonStruct.singleton = AudioCenter()
                SingletonStruct.singleton!.setDefaultData()
            })
            return SingletonStruct.singleton!
        }
    }
    
    func setDefaultData() {
        avSpeech.delegate = self
    }
    
    // 开始朗读
    func startSpeech(txt: String?) {
        let utterance = AVSpeechUtterance(string: txt!)
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        let voiceType = AVSpeechSynthesisVoice(language: "zh-CN")
        utterance.voice = voiceType
        avSpeech.speakUtterance(utterance)
    }
    
    // 停止朗读
    func stopSpeech() {
        avSpeech.stopSpeakingAtBoundary(.Immediate)
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        print("朗读完毕")
        // 如果想循环播放，可以在这里调用如下代码:
        // avSpeech.speakUtterance(utterance)
    }
    
}








