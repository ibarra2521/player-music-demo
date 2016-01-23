//
//  TrackViewController.swift
//  music player N&N
//
//  Created by Nivardo Ibarra on 1/21/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class TrackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblArtists: UILabel!
    @IBOutlet weak var imageViewTrack: UIImageView!
    @IBOutlet weak var volumeManager: UISlider!

    var currentNumberTrack = 0
    var tracks = [Track]()
    var player = Player.radio
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Add track into player
        loadTracks()

        let trackDefault = tracks[0]
        do {
            try player = AVAudioPlayer(contentsOfURL: trackDefault.soundURL!)
        }catch {
            print("Error loading the sound file")
        }
        tableView.backgroundColor = UIColor.clearColor();
        tableView.backgroundView = nil
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath) as! TrackTableViewCell
        
        // alternate background color
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.clearColor()
        } else {
            cell.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        }
        
        // Configure the cell...
        let track = tracks[indexPath.row]
        cell.configureStationCell(track)
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentNumberTrack = indexPath.row
        let track = tracks[currentNumberTrack]
        playTrack(track)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

    func loadTracks() {
        // Add track 1
        let title1 = "Asi es mi amor"
        let cover1 = "Diego Verdaguer"
        let soundURL1 = NSBundle.mainBundle().URLForResource("Asi es mi amor", withExtension: "mp3")
        let track1 = Track(title: title1, artist:cover1, soundURL: soundURL1!)

        // Add track 2
        let title2 = "Contigo"
        let cover2 = "Calibre 50"
        let soundURL2 = NSBundle.mainBundle().URLForResource("Contigo", withExtension: "mp3")
        let track2 = Track(title: title2, artist:cover2, soundURL: soundURL2!)

        // Add track 3
        let title3 = "Mi vida sin ti"
        let cover3 = "Jesus Adrian Romero"
        let soundURL3 = NSBundle.mainBundle().URLForResource("Mi vida sin ti", withExtension: "mp3")
        let track3 = Track(title: title3, artist:cover3, soundURL: soundURL3!)

        // Add track 4
        let title4 = "Si nos quedara poco tiempo"
        let cover4 = "Chayanne"
        let soundURL4 = NSBundle.mainBundle().URLForResource("Si nos quedara poco tiempo", withExtension: "mp3")
        let track4 = Track(title: title4, artist:cover4, soundURL: soundURL4!)

        // Add track 5
        let title5 = "Can't Help Falling In Love"
        let artist5 = "Elvis Presley"
        let soundURL5 = NSBundle.mainBundle().URLForResource("Can't Help Falling In Love", withExtension: "mp3")
        let track5 = Track(title: title5, artist:artist5, soundURL: soundURL5!)

        self.tracks.append(track1)
        self.tracks.append(track2)
        self.tracks.append(track3)
        self.tracks.append(track4)
        self.tracks.append(track5)
    }
    
    func updateTrack(track: Track) {
        imageViewTrack.image = UIImage(named: "\(track.title).jpg")
        lblTitle.text = "\(track.title)"
    }
    
    func playTrack(track: Track) {
        do {
            try player = AVAudioPlayer(contentsOfURL: track.soundURL!)
            if !player.playing {
                player.play()
                updateTrack(track)
            }
        }catch {
            print("Error loading the sound file")
        }

    }
    
    @IBAction func pasue() {
        if player.playing {
            player.pause()
        }
    }
    
    @IBAction func play() {
        if !player.playing {
            player.play()
            updateTrack(tracks[currentNumberTrack])
        }
    }
    
    @IBAction func stop() {
        if player.playing {
            player.stop()
            player.currentTime = 0
        }
    }
    
    @IBAction func volume() {
        player.volume = volumeManager.value
    }
    
    @IBAction func shuffle() {
        currentNumberTrack = getRandom()
        let track = tracks[currentNumberTrack]
        playTrack(track)
    }
    
    func getRandom() -> Int {
        return Int(arc4random()) % tracks.count
    }
    
    @IBAction func Next() {
        if currentNumberTrack < tracks.count - 1 {
            currentNumberTrack++
            let track = tracks[currentNumberTrack]
            playTrack(track)
        }else {
            currentNumberTrack = 0
            let track = tracks[currentNumberTrack]
            playTrack(track)
        }
        
    }
    
    @IBAction func Previous() {
        if currentNumberTrack > 0 {
            currentNumberTrack--
            let track = tracks[currentNumberTrack]
            playTrack(track)
        }else {
            currentNumberTrack = tracks.count - 1
            let track = tracks[currentNumberTrack]
            playTrack(track)
        }
    }
}
