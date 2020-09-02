//
//  PlayerView.swift
//  EndlessMovie
//
//  Created by Yuki Yasoshima on 2020/09/02.
//

import UIKit
import AVFoundation

class PlayerView: UIView {
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var player: AVPlayer? {
        get { self.playerLayer?.player }
        set { self.playerLayer?.player = newValue }
    }
    
    var playerLayer: AVPlayerLayer? {
        return self.layer as? AVPlayerLayer
    }
}
