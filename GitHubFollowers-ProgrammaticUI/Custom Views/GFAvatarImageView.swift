//
//  GFAvatarImageView.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 27.06.2022.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    
    let placeHolderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ft_Configure()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func ft_Configure(){
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 80),
            self.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    func ft_DownloadImage(from urlString:String){
        
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
        
    }
    
}
