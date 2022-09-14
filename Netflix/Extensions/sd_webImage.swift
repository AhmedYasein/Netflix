//
//  sd_webImage.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/3/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadImage(image: String){
        
        guard let url = URL(string: image) else {
            print("Non valif URL")
            return
        }
    self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
}
}
