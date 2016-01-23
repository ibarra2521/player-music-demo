//
//  Track.swift
//  music player N&N
//
//  Created by Nivardo Ibarra on 1/22/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

//import Foundation
import  UIKit

class Track {
    var title: String = ""
    var artist: String = ""
    var artworkURL: String = ""
    var soundURL: NSURL?
    var artworkImage = UIImage(named: "albumArt")
    var artworkLoaded = false
    var isPlaying: Bool = false
    
//    init (title: String, artworkURL: String, artworkImage: UIImage){
    init (title: String, artist: String, soundURL: NSURL){
        self.title = title
        self.artist = artist
        self.soundURL = soundURL
    }

}