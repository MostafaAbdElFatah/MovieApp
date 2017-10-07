//
//  JsonTableViewCell.swift
//  MoiveApp
//
//  Created by Mostafa on 8/28/17.
//
//

import UIKit

class JsonTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    func loadImage(url:String){
        //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let appURL = NSURL(string:url)
            let appData =  NSData(contentsOfURL: appURL!)
           // dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                self.movieImage.image = UIImage(data: appData!)
            //})
            
        //})
    }

}
