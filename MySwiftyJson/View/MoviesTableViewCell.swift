//
//  MoviesTableViewCell.swift
//  MySwiftyJson
//
//  Created by ahmed on 6/4/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet var movileTitle_lbl: UILabel!
    
    @IBOutlet var movieImage_img: UIImageView!
    
    func setEntity(movie: Movie) {
        self.movileTitle_lbl.text = movie.title
        self.movileTitle_lbl.sizeToFit()
        self.movieImage_img.sd_setImage(with: URL(string: movie.image), placeholderImage: UIImage(named : "placeholder.png"))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
