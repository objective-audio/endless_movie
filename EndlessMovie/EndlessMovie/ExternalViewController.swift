//
//  ExternalViewController.swift
//  EndlessMovie
//
//  Created by Yuki Yasoshima on 2020/09/03.
//

import UIKit
import AVFoundation
import Combine

class ExternalViewController: UIViewController {
    @IBOutlet weak var playerView: PlayerView!
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    class func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "ExternalDisplay", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else { fatalError() }
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "sample",
                                        withExtension: "mov") else { fatalError() }
        
        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        
        self.playerView.player = player
        
        NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime).sink { [weak self] _ in
            self?.playerView.player?.seek(to: .zero)
        }.store(in: &self.cancellables)
        
        player.play()
    }
}
