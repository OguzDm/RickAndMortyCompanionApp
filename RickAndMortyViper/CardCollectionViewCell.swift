//
//  CardCollectionViewCell.swift
//  RickAndMortyViper
//
//  Created by Oguz Demırhan on 27.06.2021.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CardCollectionViewCell"
    
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var rmVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        characterImageView.layer.cornerRadius = 16.0
        rmVisualEffectView.layer.cornerRadius = 16.0
        rmVisualEffectView.layer.masksToBounds = true
        rmVisualEffectView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
    
    func configureCell(){
        
    }

}
