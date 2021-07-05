//
//  ViewController.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 27.06.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate {

    var chars = [CharacterResult]()
    var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchChars()
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(UINib.loadNib(name: CardCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
    }
    func fetchChars(){
        Service.shared.requestAF { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.chars = model.results
                    self.collectionView.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top:0, leading: 4, bottom: 0, trailing: 4)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 2)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 16
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        cell.characterNameView.text = chars[indexPath.item].name
        cell.characterImageView.sd_setImage(with: URL(string: chars[indexPath.item].image), placeholderImage: UIImage(named: "placeholder"))
        if chars[indexPath.item].status == "Alive" {
            cell.statusImageView.tintColor = .green
        }
        return cell
    }
}

