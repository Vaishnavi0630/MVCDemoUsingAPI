//
//  ArticalTableViewCell.swift
//  ArticalDemo
//
//  Created by User on 24/05/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ArticalTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var autherLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var descLbl: UILabel!

//    var atrcailmodel:ArticalModel?{
//        didSet{
//            imgView.image = UIImage(named: atrcailmodel?.img ?? "")
//            autherLbl.text = atrcailmodel?.author
//            titleLbl.text = atrcailmodel?.title
//            url.text = atrcailmodel?.url
//            descLbl.text = atrcailmodel?.description
//        }
//    }

}
