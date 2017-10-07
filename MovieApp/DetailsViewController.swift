//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Mostafa on 10/2/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    var movieDetails:Movie?
    
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var cast: UILabel!
    @IBOutlet weak var story: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagline.text = self.movieDetails?.tagline
        self.loadImage((self.movieDetails?.image)!)
        movieName.text = self.movieDetails?.movie
        rating.text = String((self.movieDetails?.rating)!)
        year.text = String((self.movieDetails?.year)!)
        duration.text = self.movieDetails?.duration
        director.text = "director" + (self.movieDetails?.director)!
        var castNames:String = "cast"
        for name in (self.movieDetails?.cast)!{
            castNames = castNames + "," + name
        }
        cast.text = castNames
        story.text = self.movieDetails?.story
        /*print(movieDetails)
        print(movieDetails!.movie)
        print(movieDetails!.rating)
        print(movieDetails!.duration)
        print(movieDetails!.year)
        print(movieDetails!.tagline)
        print(movieDetails!.image)
        print(movieDetails!.director)
        print(movieDetails!.story)*/
    }
    
    func loadImage(url:String){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let appURL = NSURL(string:url)
            let appData =  NSData(contentsOfURL: appURL!)
            dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                self.movieImage.image = UIImage(data: appData!)
            })
            
        })
    }
}
