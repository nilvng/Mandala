//
//  MoodListViewController.swift
//  Mandala
//
//  Created by Nil Nguyen on 3/13/21.
//

import UIKit

class MoodListViewController : UITableViewController{
    var moodEntries : [MoodEntry] = []
    // declare table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moodEntry = moodEntries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableCell", for: indexPath)
        cell.textLabel?.text = "I was \(moodEntry.mood.name)"
        cell.imageView?.image = moodEntry.mood.image
        let dateString = DateFormatter.localizedString(from: moodEntry.timestamp, dateStyle: .medium, timeStyle: .short)
        cell.detailTextLabel?.text = "on \(dateString)"
        
        return cell
    }
}
// implement functions of MoodsConfigurable
extension MoodListViewController : MoodsConfigurable {
    func add (_ moodEntry : MoodEntry){
        self.moodEntries.insert(moodEntry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
