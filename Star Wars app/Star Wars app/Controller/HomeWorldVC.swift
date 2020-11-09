//
//  HomeWorldVC.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/8/20.
//

import UIKit

class HomeWorldVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var rotoationPeriod: UILabel!
    @IBOutlet weak var orbitalPeriod: UILabel!
    @IBOutlet weak var diameterLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var grivatyLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var URL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        updateViews(withWorld: world)
        print(URL!)
        getWorld()
    }
    
    func getWorld() {
        NetworkService.instance.getWorld(url: URL) { (world) in
            self.nameLbl.text = world.name
            self.orbitalPeriod.text = world.orbital_period
            self.rotoationPeriod.text = world.rotation_period
            self.diameterLbl.text = world.diameter
            self.climateLbl.text = world.climate
            self.grivatyLbl.text = world.gravity
            self.terrainLbl.text = world.terrain
            self.populationLbl.text = world.population
        } onError: { (errorMessage) in
            debugPrint(errorMessage)
        }

    }
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }

}
