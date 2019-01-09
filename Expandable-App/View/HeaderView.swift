//
//  HeaderView.swift
//  Expandable-App
//
//  Created by Ganesh on 09/01/19.
//  Copyright © 2019 Ganesh. All rights reserved.
//

import UIKit
import Foundation

protocol HeaderViewDelegate {
    func toggleSection(header: HeaderView, section: Int)
}

class HeaderView: UITableViewHeaderFooterView {
    
    var delegate: HeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(headerAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func headerAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! HeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: HeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.contentView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }

}
