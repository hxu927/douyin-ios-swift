//
//  AVPlayerManager.swift
//  Douyin
//
//  Created by Qiao Shi on 2018/8/6.
//  Copyright © 2018年 Qiao Shi. All rights reserved.
//

import Foundation
import AVFoundation

class AVPlayerManager: NSObject {
    
    var playerArray = [AVPlayer]()
    
    private static let instance = { () -> AVPlayerManager in
        return AVPlayerManager.init()
    }()
    
    private override init() {
        super.init()
    }
    
    class func shared() -> AVPlayerManager {
        return instance
    }
    
    static func setAudioMode() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("setAudioMode error:" + error.localizedDescription)
        }
        
    }
    
    func play(player:AVPlayer) {
        for object in playerArray {
            object.pause()
        }
        if !playerArray.contains(player) {
            playerArray.append(player)
        }
        player.play()
    }
    
    func pause(player:AVPlayer) {
        if playerArray.contains(player) {
            player.pause()
        }
    }
    
    func pauseAll() {
        for object in playerArray {
            object.pause()
        }
    }
    
    func replay(player:AVPlayer) {
        if playerArray.contains(player) {
            player.seek(to: kCMTimeZero)
            play(player: player)
        }
    }
}
