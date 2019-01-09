//
//  ViewController.swift
//  Expandable-App
//
//  Created by Ganesh on 08/01/19.
//  Copyright © 2019 Ganesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DoodleTableView: UITableView!
    
    var sections = [DataModel]()
    
    var start: Int = 0
    var count: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sectionscount()
        
        DoodleTableView.delegate = self
        DoodleTableView.dataSource = self
    }
    
    func sectionscount() {
        for i in start ..< count {
            sections.append(DataModel(name: "Expandable-\(i)", rows: ["Exp-\(i) Row-1","Exp-\(i) Row-2"]))
        }
        self.DoodleTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = sections[section].rows.count
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].collapsed) {
            return 45
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        header.customInit(title: sections[section].name, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellTitle = sections[indexPath.section].rows[indexPath.row]
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.sectionTitle.text = cellTitle
            return cell
    }
    
    func toggleSection(header: HeaderView, section: Int) {
        sections[section].collapsed = !sections[section].collapsed
        
        DoodleTableView.beginUpdates()
        for i in 0 ..< sections[section].rows.count {
            DoodleTableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        DoodleTableView.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 &&
            indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            
            print("Reached to End of TableView.")
           
        // we can add more rows dynamically when it table reach to END, by increasing cell count.
        /*  start += 20
            count += 20
            self.sectionscount()
            DoodleTableView.reloadData() */
        }
    }
    
    
}
