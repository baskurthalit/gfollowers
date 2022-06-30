//
//  SearchVC.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 20.06.2022.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButtons(backroundColor: .systemGreen, title: "Get Users ")
    
    var isUsernameEnetered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        ft_ConfigureLogoImageView()
        ft_ConfigureTextField()
        ft_ConfigureCallToActionButton()
        ft_CreateDismissKeyboardTapGesture()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func ft_CreateDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func ft_PushFollowerListVC(){
        
        guard isUsernameEnetered else {
            ft_PresentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for (:", buttonTitle: "Ok")
            return
        }
        
        let folloverListVC      = FollowerListVC()
        folloverListVC.username = usernameTextField.text
        folloverListVC.title    =  usernameTextField.text
        navigationController?.pushViewController(folloverListVC, animated: true)
        
    }
    
    func ft_ConfigureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func ft_ConfigureTextField(){
        view.addSubview(usernameTextField)
        
        usernameTextField.delegate = self
        
        
        //        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func ft_ConfigureCallToActionButton(){
        view.addSubview(callToActionButton)
        //Delegate pattern de kullanabilirdi fakat bu da fena durmuyor. Tabi farklı durumlarda değişebilir.
        
        callToActionButton.addTarget(self, action: #selector(ft_PushFollowerListVC
                                                            ), for: .touchUpInside)
        
        //        callToActionButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ft_PushFollowerListVC()
        
        return true
    }
}
