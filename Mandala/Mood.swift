//
//  Mood.swift
//  Mandala
//
//  Created by Nil Nguyen on 3/10/21.
//

import UIKit

struct Mood {
    var name : String
    var image : UIImage
    var color : UIColor
}

extension Mood {
    static let angry = Mood(name: "Angry",
                            image: UIImage(resource: .angry),
                            color: UIColor.angry)
    
    static let happy = Mood(name: "Happy",
                            image: UIImage(resource: .happy),
                            color: UIColor.happy)

    static let confused = Mood(name: "Confused",
                            image: UIImage(resource: .confused),
                            color: UIColor.confused)

}
