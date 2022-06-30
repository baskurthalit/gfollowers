//
//  GFBodyLabel.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 26.06.2022.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        ft_Configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment  =  textAlignment
        ft_Configure()
        
    }
    private func ft_Configure(){
        textColor                                 = .secondaryLabel
        font                                      = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.75
        lineBreakMode                             = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
