//
//  ViewController.swift
//  Mandala
//
//  Created by Nil Nguyen on 3/10/21.
//

import UIKit

class MoodSelectionViewController: UIViewController {

    // MARK: properties
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var addButton : UIButton!
    
    var moodsConfigurable : MoodsConfigurable!
    
    var moods : [Mood] = [] {
        didSet{
            // on first load, take current mood is the first mood of the list
            currentMood = moods.first
            // update buttons when all moods are set
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
            // when current mood is set, update the style of add button accordingly
            guard let currentMood = currentMood else {
                addButton.setTitle(nil, for: .normal    )
                addButton.backgroundColor = nil
                return
            }
            addButton.setTitle("I'm \(currentMood.name)", for: .normal)
            addButton.backgroundColor = currentMood.color
        }
    }
    // MARK: Embeded View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // declare essential property for tableView aka moods list
        switch segue.identifier {
        case "EmbededContainerVC":
            guard let moodsConfigurable = segue.destination as? MoodsConfigurable else {
                preconditionFailure("Go to VC expected to conform MoodConfigurable")
            }
            // that tableView become one of the property so that it can be called later on (add mood)
            self.moodsConfigurable = moodsConfigurable
            // set safe area so that mood list not collapse with "add mood" button
            segue.destination.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
        default:
            preconditionFailure("Unidentified segue")
        }
    }
    // MARK: behaviors
    @IBAction func addMoodTapped(sender : UIButton){
        // sanity check if current mood is not exist to be a valid mood entry
        guard let currentMood = self.currentMood else {
            return
        }
        let newEntry = MoodEntry(mood: currentMood, timestamp: Date())
        moodsConfigurable.add(newEntry)
    }
    
    @objc func moodSelectionChanged(_ sender: UIButton){
        // make selected mood icon become current mood so that the add button's style can be changed accordingly
        guard let selectedIndex = moodButtons.firstIndex(of: sender) else {
            preconditionFailure("Unable to find tappped button in the array")
        }
        currentMood = moods[selectedIndex]
    }
    // MARK: View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moods = [.angry, .confused, .happy, .crying, .goofy, .sad, .meh, .sleepy]
        addButton.layer.cornerRadius = addButton.bounds.height / 2
        
    }


}

