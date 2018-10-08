//
//  RepositoryAPI.swift
//  Tumblr browser
//
//  Created by Filip  Gonera on 03/10/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation
import Alamofire

class RepositoryAPI {
    
    lazy var baseUrl = "https://api.github.com/search/repositories"
    
    var repositoriesArray = [Repository]()
    
    func downloadRepositories(name: String, completed: @escaping () -> ()) {
        
        let parameters: Parameters = [
                                "q": name,
        ]
        
        Alamofire.request(baseUrl, parameters: parameters).responseJSON{ (response) in
            print(response.request!)
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject>{
                if let items = dictionary["items"] as? [Dictionary<String, AnyObject>] {
                    for i in items {
                        let repository = Repository(repositoryDict: i)
                        self.repositoriesArray.append(repository)
                    }
                    
                }
                completed()
                print("download completed")
            }
        }
    }
    
    
    
    
}
