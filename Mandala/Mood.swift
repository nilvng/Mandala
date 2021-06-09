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
    static let goofy = Mood(name: "Goofy", image: UIImage(resource: .goofy), color: UIColor.goofy)
    static let meh = Mood(name: "Meh", image: UIImage(resource: .meh), color: UIColor.meh)
    static let crying = Mood(name: "Crying", image: UIImage(resource: .crying), color: UIColor.crying)
    static let sad = Mood(name: "Sad", image: UIImage(resource: .sad), color: UIColor.sad)
    static let sleepy = Mood(name: "Sleepy", image: UIImage(resource: .sleepy), color: UIColor.sleepy)

}
