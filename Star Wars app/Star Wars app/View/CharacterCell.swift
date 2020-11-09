//
//  CharacterCell.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    func updateViews(title: String)
    {
        nameLbl.text = title
        
    }

}
