//
//  SearchResultsController.swift
//  Tumblr browser
//
//  Created by Filip  Gonera on 02/10/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class SearchResultsController: UIViewController {
    
    var repository: Repository!
    var repositoryApifunc = RepositoryAPI()
    let searchBar = SearchBar()
    var detailVC =  DetailViewController()
    
    let searchResultsTableView = UITableView()
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    
    func callDelegates() {
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        searchBar.searchTextView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        view.insertSubview(searchResultsTableView, belowSubview: searchBar)
        setupTableView()
        setupActivityIndicator()
    
        callDelegates()
        hideKeyboardWhenTappedAround()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        searchBar.layer.cornerRadius = searchBar.frame.width / 50
    }
    
    override func viewDidLayoutSubviews() {
        searchBar.layer.cornerRadius = searchBar.frame.width / 50
    }
    
    func setupSearchBar(){
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = UIColor.white
        view.addSubview(searchBar)
        
        searchBar.layer.shadowColor = UIColor.gray.cgColor
        searchBar.layer.shadowOpacity = 1
        searchBar.layer.shadowOffset = CGSize.zero
        searchBar.layer.shadowRadius = 2
        
        searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 7).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -7).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 63).isActive = true
        
    }
    
    func setupTableView() {
        searchResultsTableView.tableFooterView = UIView()
        searchResultsTableView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        searchResultsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        searchResultsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        searchResultsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        searchResultsTableView.register(SearchResultCell.self, forCellReuseIdentifier: "ResultCell")
    }
   
    func setupActivityIndicator(){
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
}


extension SearchResultsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(repositoryApifunc.repositoriesArray.count)
        return repositoryApifunc.repositoriesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! SearchResultCell
        cell.configureCell(repositoryData: repositoryApifunc.repositoriesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(repositoryApifunc.repositoriesArray[indexPath.row].repositoryName)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
        detailViewController.navigationItem.title = "\(repositoryApifunc.repositoriesArray[indexPath.row].repositoryName)"
        print("title name \(repositoryApifunc.repositoriesArray[indexPath.row].repositoryName)")
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}

extension SearchResultsController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        repositoryApifunc.repositoriesArray.removeAll()
        searchResultsTableView.reloadData()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        activityIndicator.startAnimating()
        repositoryApifunc.downloadRepositories(name: searchBar.searchTextView.text!){
            self.searchResultsTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }

       
        defaults.set(searchBar.searchTextView.text, forKey: "searchText")
        print(defaults.object(forKey: "searchText")!)

        textField.resignFirstResponder()
        print("search request")
        return true
    }

}

extension UIViewController {

    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
