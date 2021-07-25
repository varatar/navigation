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
    private let cellIdForPhotos = "cellIdForPhotos"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
        setupTableView()
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellIdForPhotos)
        tableView.toAutoLayout()
        
        //увидел в макете, что от стеквью до следующей ячейки есть небольшое расстояние, поэтому пришлось добавить эту часть кода, чтобы повторить требования макета
        tableView.sectionHeaderHeight = 6
        tableView.sectionFooterHeight = 6

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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return Storage.postsArray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdForPhotos, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostTableViewCell
            cell.post = Storage.postsArray[indexPath.row]
            return cell
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let photosVC = storyboard.instantiateViewController(withIdentifier: "photosVC")
            self.navigationController?.pushViewController(photosVC, animated: true)
        } else {
            return tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

