//
//  BookCell.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import Foundation
import UIKit
import Kingfisher

class BookCell: UICollectionViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
        bookImageView.backgroundColor = .blue
        bookImageView.layer.cornerRadius = 10
        bookImageView.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setCell(item: Book) {
        authorLabel.text = item.author
        titleLabel.text = item.title
        let photoURL = URL(string: item.cover)
        bookImageView.kf.setImage(with: photoURL)
    }
}
