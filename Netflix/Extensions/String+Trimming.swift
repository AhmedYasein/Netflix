//
//  String+Trimming.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/14/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation
extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}
