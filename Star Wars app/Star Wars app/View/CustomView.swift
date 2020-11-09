//
//  CustomView.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import UIKit

class CustomView: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

}
