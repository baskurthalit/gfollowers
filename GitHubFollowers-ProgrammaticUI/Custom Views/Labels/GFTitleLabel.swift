//
//  GFTitleLabel.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 26.06.2022.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        ft_Configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat ){
        super.init(frame: .zero)
        self.textAlignment  =  textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        ft_Configure()
        
    }
    private func ft_Configure(){
        textColor                                 = .label
        adjustsFontSizeToFitWidth                 = true
        minimumScaleFactor                        = 0.9
        lineBreakMode                             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
