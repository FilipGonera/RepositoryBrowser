//
//  CustomTableViewCell.swift
//  Tumblr browser
//
//  Created by Filip  Gonera on 02/10/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    

    var repository: Repository? {
        didSet {
            cellNameLabel.text = repository?.repositoryName
        }
    }
    
    var cellNameLabel: UILabel!
    var cellLanguageLabel: UILabel!
    var cellDescLabel: UITextView!
    var ownerLabel: UILabel!
    var starIcon: UIImageView!
    var starsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupNameLabel()
        setupLanguageLabel()
        setupDescLabel()
        setupOwnerLabel()
        setupStarIcon()
        setupStarsLabel()
    }
    
    func setupNameLabel(){
        cellNameLabel = UILabel()
        
        cellNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cellNameLabel)
        
        cellNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        cellNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        cellNameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 80).isActive = true
        cellNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        cellNameLabel.textColor = UIColor.black
        cellNameLabel.numberOfLines = 1
        cellNameLabel.textAlignment = .left
        cellNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    func setupLanguageLabel(){
        cellLanguageLabel = UILabel()
        
        addSubview(cellLanguageLabel)
       
        cellLanguageLabel.translatesAutoresizingMaskIntoConstraints = false

        
        cellLanguageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -19).isActive = true
        cellLanguageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13).isActive = true
        cellLanguageLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        cellLanguageLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        cellLanguageLabel.textColor = UIColor.darkGray
        cellLanguageLabel.numberOfLines = 1
        cellLanguageLabel.textAlignment = .right
        cellLanguageLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    func setupDescLabel(){
        cellDescLabel = UITextView()

        addSubview(cellDescLabel)
        cellDescLabel.translatesAutoresizingMaskIntoConstraints = false
        cellDescLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 17).isActive = true
        cellDescLabel.topAnchor.constraint(equalTo: cellNameLabel.bottomAnchor, constant: 10).isActive = true
        cellDescLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cellDescLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -19).isActive = true
        
        cellDescLabel.textColor = UIColor.darkGray
        cellDescLabel.isScrollEnabled = false
        cellDescLabel.allowsEditingTextAttributes = false
        cellDescLabel.isUserInteractionEnabled = false
        cellDescLabel.textAlignment = .left
        cellDescLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    func setupOwnerLabel(){
        ownerLabel = UILabel()
        
        addSubview(ownerLabel)
        ownerLabel.translatesAutoresizingMaskIntoConstraints = false
        ownerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 21).isActive = true
        ownerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        ownerLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ownerLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true

        ownerLabel.textColor = UIColor.darkGray
        ownerLabel.numberOfLines = 1
        ownerLabel.textAlignment = .left
        ownerLabel.font = UIFont.systemFont(ofSize: 12)
        
        
    }
    
    func setupStarIcon(){
        starIcon = UIImageView()
        
        addSubview(starIcon)
        starIcon.translatesAutoresizingMaskIntoConstraints = false
        starIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -19).isActive = true
        starIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        starIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        starIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        let image = UIImage(named: "star_icon")?.withRenderingMode(.alwaysTemplate)
        
        starIcon.image = image
        starIcon.tintColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        
    }
    
    func setupStarsLabel(){
        starsLabel = UILabel()
        
        addSubview(starsLabel)
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.rightAnchor.constraint(equalTo: starIcon.leftAnchor, constant: -10).isActive = true
        starsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        starsLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        starsLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        starsLabel.textColor = UIColor.darkGray
        starsLabel.numberOfLines = 1
        starsLabel.textAlignment = .right
        starsLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(repositoryData: Repository) {
        self.cellNameLabel.text = repositoryData.repositoryName
        self.cellLanguageLabel.text = repositoryData.repositoryLanguage
        self.cellDescLabel.text = repositoryData.repositoryDescription
        self.ownerLabel.text = repositoryData.repositoryOwner
        self.starsLabel.text = "\(repositoryData.stars)"
    }
    
}
