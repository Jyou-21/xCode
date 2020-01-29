//
//  TableViewController.swift
//  wishlist
//
//  Created by Jack Younger on 1/23/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var wishData: [wishItem] = []

    var notes:[Note] = [Note]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let note = Note()
        note.note = "I wish for"
        notes.append(note)
        
        let note2 = Note()
        note2.note = "I also wish for"
        notes.append(note2)
        
        print(notes)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdent", for: indexPath)

        let title = notes[indexPath.row].note
     cell.textLabel?.text = title
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! ViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let currentnote = self.notes[indexPath.row]
            vc.currentnote = currentnote

        }
        else{
            let currentnote = Note()
            notes.append(currentnote)
            vc.currentnote = currentnote
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        save()
    }
    
    func load() -> [wishItem]? {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false), let data = try? Data(contentsOf: url.appendingPathComponent("wishlist.json")) {
            let wishData = try? JSONDecoder().decode([wishItem].self, from: data)
            return wishData
        }
        return nil
    }
    
    func save() {
        if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false), let data = try? JSONEncoder().encode(wishData) {
            do {
                try data.write(to: url.appendingPathComponent("wishlist.json"))
            } catch {
                print("Failed to save")
            }
        } else {
            print("Could not prepare save")
        }
    }
}
