//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Евгений Матафонов on 16.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.toAutoLayout()

        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


 // MARK: UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostTableViewCell
        
        cell.post = Storage.postsArray[indexPath.row]
        
        return cell
    }
    
   
}

// MARK: UITableViewDelegate


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0: let headerView = ProfileTableHeaderView()
            return headerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
