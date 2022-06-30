//
//  UIViewController+Extension.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 26.06.2022.
//

import UIKit

extension UIViewController{
    func ft_PresentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
