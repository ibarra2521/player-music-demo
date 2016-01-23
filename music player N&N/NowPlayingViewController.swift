//
//  NowPlayingViewController.swift
//  music player N&N
//
//  Created by Nivardo Ibarra on 1/22/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit
import AVFoundation

//*****************************************************************
// Protocol
// Updates the StationsViewController when the track changes
//*****************************************************************

protocol NowPlayingViewControllerDelegate: class {
//    func songMetaDataDidUpdate(track: Track)
//    func artworkDidUpdate(track: Track)
    func trackPlayingToggled(track: Track)
}

class NowPlayingViewController: UIViewController {

//    private var player: AVAudioPlayer!
    var player = Player.radio
    var track: Track!
    weak var delegate: NowPlayingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let soundURL = NSBundle.mainBundle().URLForResource("Contigo", withExtension: "mp3")
        do {
            try player = AVAudioPlayer(contentsOfURL: soundURL!)
        }catch {
            print("Error loading the sound file")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pause() {
        if player.playing {
            player.pause()
        }
    }
    
    @IBAction func play() {
        if !player.playing {
            player.play()
        }
        
        // Update StationsVC
        self.delegate?.trackPlayingToggled(self.track)
    }
    
    @IBAction func stop() {
        if player.playing {
            player.stop()
            player.currentTime = 0
        }
        
        // Update StationsVC
        self.delegate?.trackPlayingToggled(self.track)
    }

}
