//
//  UserInfoVC.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 1.07.2022.
//

import UIKit

class UserInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ft_DismissVC))
        
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func ft_DismissVC(){
        dismiss(animated: true, completion: nil)
    }

}
