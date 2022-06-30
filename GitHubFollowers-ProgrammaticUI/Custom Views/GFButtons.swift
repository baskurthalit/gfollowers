//
//  GFButtons.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 21.06.2022.
//

import UIKit

class GFButtons: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code
        ft_Configure()
    }
    
    init(backroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backroundColor
        self.setTitle(title, for: .normal)
        ft_Configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ft_Configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
}
