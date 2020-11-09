//
//  ParametersVC.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import UIKit

class ParametersVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var heirColorLbl: UILabel!
    @IBOutlet weak var skinColorLbl: UILabel!
    @IBOutlet weak var eyeColorLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        getParameters()
    }
    
    func getParameters(){
        nameLbl.text = character.name
        heightLbl.text = character.height
        massLbl.text = character.mass
        heirColorLbl.text = character.hair_color
        skinColorLbl.text = character.skin_color
        eyeColorLbl.text = character.eye_color
        birthYearLbl.text = character.birth_year
        gender.text = character.gender
    }
    
    @IBAction func homeWorldBtnWasPressed(_ sender: Any) {
        guard let homeWorldVC = storyboard?.instantiateViewController(withIdentifier: "HomeWorldVC") as? HomeWorldVC else { return }
        homeWorldVC.URL = character.homeworld
        homeWorldVC.modalPresentationStyle = .fullScreen
        presentDetail(homeWorldVC)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }

}
