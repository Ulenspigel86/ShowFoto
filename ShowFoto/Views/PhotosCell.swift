//
//  FhotoCell.swift
//  ShowFoto
//
//  Created by Артем Иванов on 06.01.2025.
//

import UIKit
import SDWebImage

class PhotosCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!

    static let reuseIdentifier = "PhotosCell"
      
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectedState()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    private func updateSelectedState() {
        photoImageView.alpha = isSelected ? 0.3 : 1
    }
}


