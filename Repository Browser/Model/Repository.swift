//
//  Repository.swift
//  Tumblr browser
//
//  Created by Filip  Gonera on 02/10/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation

class Repository {
    
    private var _name: String!
    private var _language: String!
    private var _owner: String!
    private var _description: String!
    private var _stars: Int!
    
   
    
    var repositoryName: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var repositoryLanguage: String {
        if _language == nil {
            _language = ""
        }
        return _language
    }
    
    var repositoryOwner: String {
        if _owner == nil {
            _owner = ""
        }
        return _owner
    }
    
    var repositoryDescription: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var stars : Int {
        if _stars == nil {
            _stars = 0
        }
        return _stars
    }
    
    
    init(repositoryDict: Dictionary<String, AnyObject>){
        if let name = repositoryDict["name"] as? String {
            _name = name
            print(repositoryName)
        }
        if let language = repositoryDict["language"] as? String {
            _language = language
        }
        
        if let owner = repositoryDict["owner"] as? Dictionary<String, AnyObject> {
            if let login = owner["login"] as? String {
                _owner = login
            }
        }
        if let description = repositoryDict["description"] as? String {
            _description = description
        }
        if let stargazers_count = repositoryDict["stargazers_count"] as? Int {
            _stars = stargazers_count
        }
        
        
    }
    
    
    
    
}
