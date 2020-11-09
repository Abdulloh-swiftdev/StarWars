//
//  UIViewControllerExt.swift
//  Star Wars app
//
//  Created by Abdulloh Bahromjonov on 11/7/20.
//

import UIKit

    extension UIViewController{
        func presentDetail(_ viewControllerToPresent: UIViewController){
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromRight
            self.view.window?.layer.add(transition, forKey: kCATransition)
            
            present(viewControllerToPresent, animated: false, completion: nil)
        }
        
        func dismissDetail(){
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromLeft
            self.view.window?.layer.add(transition, forKey: kCATransition)
            
            dismiss(animated: false, completion: nil)
        }
    }


