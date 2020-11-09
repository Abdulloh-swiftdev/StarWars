//
//  NetworkService.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import UIKit

class NetworkService {

    static let instance = NetworkService()
    
    let URL_BASE = "https://swapi.dev/api"
    let URL_CHARACTER = "/people"
    
    let session = URLSession(configuration: .default)
    
    func getCharacter(onSuccess: @escaping (Characters) -> Void, onError: @escaping (String) -> Void)
    {
        let url = URL(string: "\(URL_BASE)\(URL_CHARACTER)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error
                {
                    onError(error.localizedDescription)
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse else
                {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200
                    {
                        let results = try JSONDecoder().decode(Characters.self, from: data)
                        onSuccess(results)
                    } else
                    {
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        onError(err.message)
                    }
                } catch
                {
                    onError(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
    
    
    func getWorld(url: String, onSuccess: @escaping (World) -> Void, onError: @escaping (String) -> Void)
    {
        let url = URL(string: "\(url)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error
                {
                    onError(error.localizedDescription)
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let planets = try JSONDecoder().decode(World.self, from: data)
                        onSuccess(planets)
                    } else {
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        onError(err.message)
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
        
        }
        task.resume()
        
    }
    
}
