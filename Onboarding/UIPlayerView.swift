//
//  UIPlayerView.swift
//  Onboarding
//
//  Created by Roma Marshall on 14.03.21.
//

import SwiftUI
import AVKit

class UIVideoPlayer: UIView {
    
    var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let link: String = "https://proxy-042.dc3.dailymotion.com/sec(9d_o33l26xVh1uXFlXZKmFLXmjrJ1ySYz8uhUh4FA3XHApAjYzWfrbJWePH0RKRRDvbjGwXOt0gSxIDLMHDzf1SKGjScXG-5QVaqo2COos4)/video/120/821/477128021_mp4_h264_aac_fhd.m3u8#cell=core&qos_vpart=1"
        
        guard let url = URL(string: link) else { return }
        
        let player = AVPlayer(url: url)
        player.isMuted = true
        player.play()
      
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct PlayerView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVideoPlayer {
        return UIVideoPlayer()
    }

    func updateUIView(_ uiView: UIVideoPlayer, context: Context) {
        
    }
}


