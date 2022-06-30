//
//  FollowerListVC.swift
//  GitHubFollowers-ProgrammaticUI
//
//  Created by Macbook on 26.06.2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    
    
    enum Section {
        //Enum is hasable default
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var page: Int = 1
    
    var hasGotMoreFollowers = true
    
    var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ft_ConfigureViewController()
        ft_ConfigureCollectionView()
        ft_GetFollowers(username: username, page: page)
        ft_ConfigureDataSource()
                
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func ft_ConfigureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    //Does my vc need to know about it.
    
    func ft_ConfigureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.ft_Create3ColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
 
    
    func ft_GetFollowers(username: String, page: Int){
        
        ft_ShowLoadingView()
        NetworkManager.shared.ft_GetFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.ft_DismissLoadingView()
            
//            #warning("Dismiss will called")
            switch result{
            case .success(let followers):
                if followers.count < 100 { self.hasGotMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                
                if self.followers.isEmpty {
                    let messeage = "This user doesn't have any followers. Go follow them "
                    DispatchQueue.main.async { self.ft_ShowEmptyStateView(with: messeage, in: self.view) }
                    return
                }
                
                self.ft_UpdateData()
            case .failure(let error):
                self.ft_PresentGFAlertOnMainThread(title: "Test", message: error.rawValue, buttonTitle: "OK")
            }
        }
        
    }
    
    func ft_ConfigureDataSource(){
        
        dataSource = UICollectionViewDiffableDataSource<Section,Follower>(collectionView: collectionView) { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.ft_Set(follower: follower)
            return cell
        }
        
    }
    
    func ft_UpdateData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        
        
    }

 
}

extension FollowerListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasGotMoreFollowers else { return }
            page += 1
            ft_GetFollowers(username: username, page: page)
            
        }
    }
    
}
