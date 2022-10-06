//
//  DownloadsVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit
import Lottie
class DownloadsVC: UIViewController {
    var animationView = AnimationView()

    override func viewDidLoad() {
        
        animationView.animation = Animation.named("netflix-logo")
            animationView.frame = view.bounds
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.animationSpeed = 1
            view.addSubview(animationView)


}
}
