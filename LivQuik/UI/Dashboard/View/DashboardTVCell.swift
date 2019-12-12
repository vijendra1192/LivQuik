//
//  DashboardTVCell.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import UIKit
import Kingfisher

class DashboardTVCell: UITableViewCell {

    //MARK: Outlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var ivBanner: UIImageView!
    
    var article: Articles? {
        didSet {
            guard let article = article else {
                return
            }
            let iconUrl = URL(string: article.url ?? "")
            let bannerUrl = URL(string: article.urlToImage ?? "")
            
            let placeHolder = UIImage(named: "iv_icon")
            
            ivIcon.image = placeHolder
            ivBanner.kf.setImage(with: bannerUrl, placeholder: placeHolder, options: [.cacheOriginalImage])
            name.text = article.author
            publishDate.text = article.publishedAt
            descriptions.text = article.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
