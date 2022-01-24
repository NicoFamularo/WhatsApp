//
//  ChatsViewController.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 21/01/2022.
//

import UIKit

class ChatsViewController: UIViewController {
    
    lazy var tableViewChats : UITableView = {
        let tableViewChats          = UITableView()
        tableViewChats.delegate     = self
        tableViewChats.dataSource   = self
        tableViewChats.rowHeight    = 80.0
        tableViewChats.register(ChatsTableViewCell.self, forCellReuseIdentifier: "\(ChatsTableViewCell.self)")
        tableViewChats.translatesAutoresizingMaskIntoConstraints = false
        return tableViewChats
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        tableViewChats.reloadData()
    }
    
    
    private func configureView(){
        view.addSubview(tableViewChats)
        var topPadding : CGFloat = 0.0
        if let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top{
            topPadding = topInset
        }
        
        NSLayoutConstraint.activate([
            tableViewChats.leadingAnchor.constraint     (equalTo: view.leadingAnchor    ),
            tableViewChats.trailingAnchor.constraint    (equalTo: view.trailingAnchor   ),
            tableViewChats.topAnchor.constraint         (equalTo: view.topAnchor,           constant: topPadding),
            tableViewChats.bottomAnchor.constraint      (equalTo: view.bottomAnchor     )
        ])
        
    }

}


extension ChatsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDataModel.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChatsTableViewCell.self)", for: indexPath) as? ChatsTableViewCell else {
                print("Empty Cell")
                return UITableViewCell()
        }
        let user = UserDataModel.getList()[indexPath.row]
        cell.setData(user)
        return cell
    }
}
