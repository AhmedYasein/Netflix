
//
//  SplashScreenVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 10/3/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit
import Lottie
import  AVFoundation
class SplashScreenVC: UIViewController {
    
    var animationView = AnimationView()
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (_) in
            DispatchQueue.main.async {
                self.setNetflixLogoAnimation()
                
            }
            self.playSound()
        
         }
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (_) in
        
             self.navigationController?.pushViewController(MainTabBarVC(), animated: false)
         }
        
    }
    
    private func setNetflixLogoAnimation(){
        
        animationView.animation = Animation.named("netflix-logo")
                      animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
                  animationView.play()
        animationView.animationSpeed = 1.1
                      view.addSubview(animationView)
    }
    
   func playSound() {
        guard let url = Bundle.main.url(forResource: "NetflixSoundTone", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

           
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

        func delay(_ delay:Double, closure:@escaping ()->()) {
            let when = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
        }
    

}
