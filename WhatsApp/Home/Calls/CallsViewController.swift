//
//  CallsViewController.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 21/01/2022.
//

import UIKit

class CallsViewController: UIViewController {
    
    
    @IBOutlet weak var callsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        let nibName = UINib(nibName: "\(CallCell.self)", bundle: nil)
        callsTableView.register(nibName, forCellReuseIdentifier: "\(CallCell.self)")
        callsTableView.reloadData()
    }

}

extension CallsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDataModel.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CallCell.self)", for: indexPath) as? CallCell
        else{
                return UITableViewCell()
            }
        let user = UserDataModel.getList()[indexPath.row]
        cell.setData(user)
        return cell
    }
    
    
}
