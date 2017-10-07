//
//  MoviesTableViewController.swift
//  MoiveApp
//
//  Created by Mostafa on 8/28/17.
//
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    
    var moviesList:[Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://jsonparsingdemo-cec5b.firebaseapp.com/jsonData/moviesData.txt"
        loadURL(url)

    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moviesList.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("row", forIndexPath: indexPath) as! JsonTableViewCell
        cell.movieName.text        = moviesList[indexPath.row].movie
        cell.loadImage(moviesList[indexPath.row].image!)
        cell.movieYear.text        = String(moviesList[indexPath.row].year)
        cell.movieRating.text      = String(moviesList[indexPath.row].rating)
        cell.movieDuration.text    = moviesList[indexPath.row].duration
        cell.movieDescription.text = moviesList[indexPath.row].story
        return cell
    }
    
    func loadURL(url:String){
        //DispatchQueue.global().Asyc{ } //swift 3
        //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { // swift 2
    
            do{
                let appURL = NSURL(string:url)
                let appData =  NSData(contentsOfURL: appURL!)
                let json = try NSJSONSerialization.JSONObjectWithData(appData! , options: [] )
                let movies = json["movies"] as! [AnyObject]
                for movie in movies{
                    let m = Movie()
                    m.movie    = movie["movie"] as! String
                    m.year     = movie["year"] as! NSNumber
                    m.rating   = movie["rating"] as! Double
                    m.duration = movie["duration"] as! String
                    m.director = movie["director"] as! String
                    m.tagline  = movie["tagline"] as! String
                    m.image    = movie["image"] as! String
                    m.story    = movie["story"] as! String
                    let Cast   = movie["cast"] as! [AnyObject]
                    for cast in Cast{
                        let name = cast["name"] as! String
                        m.cast.append(name)
                    }
                    //dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                        self.moviesList.append(m)
                    
                   // })
                    
                }
                self.tableView.reloadData()
            }catch{
                print("Error in connection")
            }
            
       // })
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "details"{
            let detailsViewController:DetailsViewController = segue.destinationViewController as! DetailsViewController
            detailsViewController.movieDetails = self.moviesList[(self.tableView.indexPathForSelectedRow?.row)!]
        
        }
    }

}
