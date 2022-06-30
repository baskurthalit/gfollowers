//
//  FollowerCell.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 27.06.2022.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ft_Configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ft_Set(follower: Follower){
        usernameLabel.text = follower.login
        avatarImageView.ft_DownloadImage(from: follower.avatarUrl)
    }
    
    private func ft_Configure(){
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    
    }
    
}
