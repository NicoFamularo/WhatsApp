//
//  HomeViewController.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 11/01/2022.
//

import UIKit


class HomeViewController: UIViewController {
    
    
    //MARK: OutLets

    @IBOutlet weak var scrollView:   UIScrollView!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cameraImage:  UIImageView!
    @IBOutlet weak var chatsButton:  UIButton!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var callsButton:  UIButton!
     
    @IBOutlet weak var cameraView:   UIView!
    @IBOutlet weak var chatsView:    UIView!
    @IBOutlet weak var statusView:   UIView!
    @IBOutlet weak var callsView:    UIView!
    

    //MARK: Variables / Constants
    
    private let cameraVC = CameraViewController()
    private let chatsVC  = ChatsViewController()
    private let statusVC = StatusViewController()
    private let callsVC  = CallsViewController()
    
    private var firstTimeStart = true
    
    
    //MARK: Life Cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        insertVC(cameraVC, in: cameraView)
        insertVC(chatsVC,  in: chatsView)
        insertVC(statusVC, in: statusView)
        insertVC(callsVC,  in: callsView)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
            
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if firstTimeStart == true {
            scrollView.scrollTo(page: 1, animated: false)
            selectedButtonColor(page: 1)
            firstTimeStart = false
        }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
//MARK: Functions
    
    
    @IBAction func cameraction(_ sender: UIButton) {
        scrollView.scrollTo(page: 0)
    }
    @IBAction func chatsAction(_ sender: UIButton) {
        selectedButtonColor(page: 1)
        scrollView.scrollTo(page: 1)
    }
    @IBAction func statusAction(_ sender: UIButton) {
        selectedButtonColor(page: 2)
        scrollView.scrollTo(page: 2)
    }
    @IBAction func callsAction(_ sender: UIButton) {
        selectedButtonColor(page: 3)
        scrollView.scrollTo(page: 3)
    }
    
    func selectedButtonColor (page: Int){
        switch page {
        case 0:
            cameraImage.image = UIImage(        named: "activeCameraIconImage")
            chatsButton.setTitleColor(UIColor(  named: "nonSelectedItemsColor"), for: .normal)
            statusButton.setTitleColor(UIColor( named: "nonSelectedItemsColor"), for: .normal)
            callsButton.setTitleColor(UIColor(  named: "nonSelectedItemsColor"), for: .normal)
        case 1:
            cameraImage.image = UIImage(        named: "cameraIconImage")
            chatsButton.setTitleColor(UIColor(  named: "selectedItemsColor"),    for: .normal)
            statusButton.setTitleColor(UIColor( named: "nonSelectedItemsColor" ),for: .normal)
            callsButton.setTitleColor(UIColor(  named: "nonSelectedItemsColor"), for: .normal)
        case 2:
            cameraImage.image = UIImage(        named: "cameraIconImage")
            chatsButton.setTitleColor(UIColor(  named: "nonSelectedItemsColor"), for: .normal)
            statusButton.setTitleColor(UIColor( named: "selectedItemsColor"),    for: .normal)
            callsButton.setTitleColor(UIColor(  named: "nonSelectedItemsColor"), for: .normal)
        case 3:
            cameraImage.image = UIImage(        named: "cameraIconImage")
            chatsButton.setTitleColor(UIColor(  named: "nonSelectedItemsColor"), for: .normal)
            statusButton.setTitleColor(UIColor( named: "nonSelectedItemsColor"), for: .normal)
            callsButton.setTitleColor(UIColor(  named: "selectedItemsColor"),    for: .normal)
        default:
            chatsButton.setTitleColor(UIColor(  named: "selectedItemsColor"),    for: .normal)
        }
        
        if page == 0 {
            topViewTopConstraint.constant = -topView.frame.height
        } else {
            topViewTopConstraint.constant = 0
        }
        animatedLayoutIfNeeded()
    }
    
    

}




extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        selectedButtonColor(page: scrollView.currentPage)
    }
}
