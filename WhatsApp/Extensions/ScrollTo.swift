//
//  File.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 19/01/2022.
//

import UIKit

extension UIScrollView {
    var currentPage: Int {
        return Int((contentOffset.x + (0.5 * frame.size.width)) / frame.width)
    }
    
    func scrollTo(page:Int, animated: Bool = true){
        let float = frame.width * CGFloat(page)
        let point = CGPoint(x: float, y:0)
        setContentOffset(point, animated: animated)
    }
    
}
