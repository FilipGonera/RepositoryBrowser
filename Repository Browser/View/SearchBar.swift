//
//  SearchBar.swift
//  Tumblr browser
//
//  Created by Filip  Gonera on 07/10/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import UIKit

class SearchBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchTextView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchTextView: UITextField = {
        let textView = UITextField(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        textView.placeholder = "Search repositories"
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.borderStyle = .none
        textView.clearButtonMode = UITextField.ViewMode.whileEditing
        textView.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textView.autocorrectionType = UITextAutocorrectionType.no
        
        return textView
    }()
    
    func setupSearchTextView(){
        self.addSubview(searchTextView)
        searchTextView.translatesAutoresizingMaskIntoConstraints = false
        searchTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        searchTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        searchTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        searchTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        searchTextView.returnKeyType = UIReturnKeyType.search
    }

}
