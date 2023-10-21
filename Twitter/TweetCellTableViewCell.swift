//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Wilbert Fundira on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
     
    
    @IBOutlet weak var retweet: UIButton!
   
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
                    self.setReTweeted(true)
                }, failure: { (error) in
                    print("Failure in retweeting \(error)")
                })
            }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId:tweetId, success: {
                           self.setFavorite(true)
                       
                       }, failure: { (error) in
                           print("Favorite did not succeed \(error)")
            })
        } else{
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed \(error)" )
            })
        }
    }
        
        
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setReTweeted(_ isRetweeted:Bool){
           if(isRetweeted)
           {
               retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
               retweetButton.isEnabled = false
           }
           else{
               retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
               retweetButton.isEnabled = true
           }
       }
       
    
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor_icon_red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
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
