//
//  HomeViewController.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 11/01/2022.
//

import UIKit


class HomeViewController: UIViewController {
    
    
    //MARK: OutLets

    @IBOutlet weak var whatsAppLabel: UILabel!
    

    //MARK: Variables / Constants



    //MARK: Life Cycle
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
            
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
