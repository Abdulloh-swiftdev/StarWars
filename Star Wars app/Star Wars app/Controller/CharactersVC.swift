//
//  ViewController.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import UIKit

class CharactersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters = Array<Character>()
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        getCharecters()
        
    }
    
    func getCharecters() {
        NetworkService.instance.getCharacter { (character) in
            self.characters = character.results
            self.tableView.reloadData()
            print(character)
        } onError: { (errorMessage) in
            debugPrint(errorMessage)
        }

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell") as? CharacterCell {
            cell.updateViews(title: characters[indexPath.row].name)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let parametersVC = storyboard?.instantiateViewController(withIdentifier: "ParametersVC") as? ParametersVC else { return }
        guard let homeWorldVC = storyboard?.instantiateViewController(withIdentifier: "HomeWorldVC") as? HomeWorldVC else { return }
        parametersVC.character = characters[indexPath.row]
        
        
        parametersVC.modalPresentationStyle = .fullScreen
            
        presentDetail(parametersVC)
    }
    
    
}

