//
//  MoodConfigurable.swift
//  Mandala
//
//  Created by Nil Nguyen on 3/13/21.
//

import UIKit
// declare useful functions to manage moods list
// provide abstract layer between moodSelectionVC and MoodListVC
protocol MoodsConfigurable {
    func add(_ moodEntry: MoodEntry)
}
