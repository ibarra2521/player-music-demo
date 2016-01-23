//
//  TrackTableViewCell.swift
//  music player N&N
//
//  Created by Nivardo Ibarra on 1/22/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblArtists: UILabel!
    @IBOutlet weak var imageViewCover: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // set table selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 78/255, green: 82/255, blue: 93/255, alpha: 0.6)
        selectedBackgroundView  = selectedView

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureStationCell(track: Track) {
        
        // Configure the cell...
        lblTitle.text = track.title
        lblArtists.text = track.artist
    }


}
