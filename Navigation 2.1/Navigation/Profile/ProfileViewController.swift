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
    private let profileHeader = ProfileHeaderView()
    
    private let transparentView: UIView = {
        let alphaView = UIView()
        alphaView.alpha = 0.0
        alphaView.backgroundColor = .white
        alphaView.toAutoLayout()
        return alphaView
    }()
    
    private let closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setBackgroundImage(UIImage (systemName: "clear"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
        closeButton.toAutoLayout()
        closeButton.alpha = 0.0
        return closeButton
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
        
        setupTableView()
        setupAnimationView()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(animation))
        profileHeader.avatarImageView.addGestureRecognizer(tapRecognizer)
        profileHeader.avatarImageView.isUserInteractionEnabled = true
    }
    
    @objc func animation() {
        animateOpenAvatar()
    }
    
    @objc func closeAvatar() {
        animateCloseAvatar()
    }
    
    func animateOpenAvatar() {
        UIView.animate(withDuration: 0.5, animations: {
            self.profileHeader.avatarImageView.center = self.view.center
            self.profileHeader.avatarImageView.transform = CGAffineTransform.init(scaleX: 0.99 , y: 0.99 )
            self.profileHeader.avatarImageView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
            self.profileHeader.avatarImageView.layer.cornerRadius = 0
            self.transparentView.alpha = 0.7
            self.profileHeader.transparentView.alpha = 0.7
        }) {_ in
            UIView.animate(withDuration: 0.3, animations: {
                self.closeButton.alpha = 1
            })
        }
    }
    
    func animateCloseAvatar() {
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0
            
        }, completion: {_ in
            UIView.animate(withDuration: 0.5, animations: {
                self.profileHeader.avatarImageView.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
                self.profileHeader.avatarImageView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.profileHeader.avatarImageView.layer.cornerRadius = 55
                self.transparentView.alpha = 0
                self.profileHeader.transparentView.alpha = 0
                
            })
        })
    }
    
    func setupAnimationView() {
        tableView.addSubview(transparentView)
        view.addSubview(closeButton)
        
        let constraints = [
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            
            transparentView.topAnchor.constraint(equalTo: view.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
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
        case 0: let headerView = profileHeader
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

