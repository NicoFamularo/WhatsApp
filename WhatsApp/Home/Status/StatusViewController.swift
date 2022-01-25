//
//  StatusViewController.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 21/01/2022.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var statusTableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView(){
        let nibName = UINib(nibName: "\(StatusCell.self)", bundle: nil)
        statusTableView.register(nibName, forCellReuseIdentifier: "\(StatusCell.self)")
        statusTableView.reloadData()
    }
}


extension StatusViewController : UITableViewDataSource, UITabBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDataModel.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(StatusCell.self)", for: indexPath) as? StatusCell
        else{
                return UITableViewCell()
            }
        let user = UserDataModel.getList()[indexPath.row]
        cell.setData(user)
        return cell
    }
    
    
}
