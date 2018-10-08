//
//  DetailViewController.swift
//  Tumblr browser
//
//  Created by Filip  Gonera on 07/10/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//


//WORK IN PROGRESS

import UIKit

let defaults = UserDefaults.standard

class DetailViewController: UIViewController {

    var searchBar = SearchBar()
    
    var detailTableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    
    var starsCell: UITableViewCell = UITableViewCell()
    var watchersCell: UITableViewCell = UITableViewCell()
    var forksCell: UITableViewCell = UITableViewCell()
    var languageCell: UITableViewCell = UITableViewCell()
    var issuesCell: UITableViewCell = UITableViewCell()
    var sizeCell: UITableViewCell = UITableViewCell()
    var dateCell: UITableViewCell = UITableViewCell()
    var branchCell: UITableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        setupTableView()
        setupStarsCell()
        setupWatchersCell()
        setupForksCell()
        setupLanguageCell()
        setupIssuesCell()
        setupSizeCell()
        setupDateCell()
        setupBranchCell()
    }
    
    override func loadView() {
        super.loadView()
     
    }

    @objc func performBackSegue(){
        let searchResultsController = SearchResultsController()
        present(searchResultsController, animated: true){
        }
    }
    
    func setupStarsCell() {
        var starsLabel: UILabel = UILabel()
        
        self.starsCell.backgroundColor = UIColor.white
        starsLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: starsCell.contentView.bounds.height))
        starsLabel.text = "Stargazers:"
        self.starsCell.addSubview(starsLabel)
    }
    
    func setupWatchersCell(){
        var watchersLabel: UILabel = UILabel()
        
        self.watchersCell.backgroundColor = UIColor.white
        watchersLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: watchersCell.contentView.bounds.height))
        watchersLabel.text = "Watchers:"
        self.watchersCell.addSubview(watchersLabel)
    }
    
    func setupForksCell(){
        var forksLabel: UILabel = UILabel()
        
        self.forksCell.backgroundColor = UIColor.white
        forksLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: forksCell.contentView.bounds.height))
        forksLabel.text = "Forks:"
        self.forksCell.addSubview(forksLabel)
    }
    
    func setupLanguageCell(){
        var languageLabel: UILabel = UILabel()
        
        languageCell.backgroundColor = UIColor.white
        languageLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: languageCell.contentView.bounds.height))
        languageLabel.text = "Language:"
        languageCell.addSubview(languageLabel)
    }
    
    func setupIssuesCell(){
        var issuesLabel: UILabel = UILabel()
        
        issuesCell.backgroundColor = UIColor.white
        issuesLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: issuesCell.contentView.bounds.height))
        issuesLabel.text = "Issues:"
        issuesCell.addSubview(issuesLabel)
    }
    
    func setupSizeCell(){
        var sizeLabel: UILabel = UILabel()
        
        sizeCell.backgroundColor = UIColor.white
        sizeLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: sizeCell.contentView.bounds.height))
        sizeLabel.text = "Size:"
        sizeCell.addSubview(sizeLabel)
    }
    
    func setupDateCell(){
        var dateLabel: UILabel = UILabel()
        
        dateCell.backgroundColor = UIColor.white
        dateLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: dateCell.contentView.bounds.height))
        dateLabel.text = "Date created:"
        dateCell.addSubview(dateLabel)
    }
    
    func setupBranchCell(){
        var branchLabel: UILabel = UILabel()
        
        branchCell.backgroundColor = UIColor.white
        branchLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: branchCell.contentView.bounds.height))
        branchLabel.text = "Default branch:"
        branchCell.addSubview(branchLabel)
    }

    func setupTableView(){
        view.addSubview(detailTableView)
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        detailTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        detailTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 3
        case 1:
            return 5
        default:
            fatalError("Unknown number of sections")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: return self.starsCell
            case 1: return self.watchersCell
            case 2: return self.forksCell
            default:
                fatalError("Unknow row in section 0")
            }
            
        case 1:
            switch(indexPath.row) {
            case 0: return self.languageCell
            case 1: return self.issuesCell
            case 2: return self.branchCell
            case 3: return self.dateCell
            case 4: return self.sizeCell
            default:
                 fatalError("unknown row in section 1")
            }
        default:
            fatalError("Unknown section")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
