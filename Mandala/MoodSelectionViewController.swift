//
//  ViewController.swift
//  Mandala
//
//  Created by Nil Nguyen on 3/10/21.
//

import UIKit

class MoodSelectionViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var addButton : UIButton!
    
    var moods : [Mood] = [] {
        didSet{
            currentMood = moods.first

            moodButtons = moods.map { mood in
                let button = UIButton()
                button.setImage(mood.image, for: .normal)
                button.imageView?.contentMode = .scaleAspectFit
                button.adjustsImageWhenHighlighted = false
                button.addTarget(self, action: #selector(moodSelectionChanged(_:)), for: .touchUpInside)
                return button
            }
        }
    }
    var moodButtons : [UIButton] = [] {
        didSet {
            // delete old buttons from the stack (superview) as the moods array is updated
            oldValue.forEach { $0.removeFromSuperview()}
            // add all buttons over again to the stack view
            moodButtons.forEach {
                stackView.addArrangedSubview($0)
            }
        }
    }
    var currentMood : Mood? {
        didSet{
            guard let currentMood = currentMood else {
                addButton.setTitle(nil, for: .normal    )
                addButton.backgroundColor = nil
                return
            }
            addButton.setTitle("I'm \(currentMood.name)", for: .normal)
            addButton.backgroundColor = currentMood.color
        }
    }
    
    @objc func moodSelectionChanged(_ sender: UIButton){
        guard let selectedIndex = moodButtons.firstIndex(of: sender) else {
            preconditionFailure("Unable to find tappped button in the array")
        }
        currentMood = moods[selectedIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moods = [.angry, .confused, .happy]
        addButton.layer.cornerRadius = addButton.bounds.height / 2
        
    }


}

