//
//  UIImage+Mandala.swift
//  Mandala
//
//  Created by Nil Nguyen on 3/10/21.
//

import UIKit

enum ImageResource : String {
    case happy
    case angry
    case confused
}

extension UIImage{
    convenience init(resource : ImageResource) {
        self.init(named: resource.rawValue)!
    }
}
