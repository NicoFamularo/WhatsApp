//
//  ChatsViewController.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 24/01/2022.
//

import UIKit

class ChatsViewController : UIViewController {
    
    @IBOutlet weak var chatsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        let nibName = UINib(nibName: "\(ChatCell.self)", bundle: nil)
        chatsTableView.register(nibName, forCellReuseIdentifier: "\(ChatCell.self)")
        chatsTableView.reloadData()
    }

}

extension ChatsViewController : UITableViewDataSource, UITabBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDataModel.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChatCell.self)", for: indexPath) as? ChatCell
        else{
                return UITableViewCell()
            }
        let user = UserDataModel.getList()[indexPath.row]
        cell.setData(user)
        return cell
    }
}

