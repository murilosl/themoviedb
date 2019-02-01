//
//  MoviesTableViewController.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 01/02/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    //MARK: Proprieties
    let manager = MovieManager()
    var movies: [Movie] = []
    
    //MARK: Outlets
    @IBOutlet weak var searchText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getMovies { (result) in
            if result != nil{
                self.movies = result!
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func searchAction(_ sender: Any) {
        let text = searchText.text!
        
        manager.SearchMovie(text: text) { (result) in
            
            if result != nil{
                self.movies = result!
                
                if self.movies.count > 0 {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovie", for: indexPath) as! MovieTableViewCell

        let movie = self.movies[indexPath.row]
        
        cell.title.text = movie.title
        cell.releaseDate.text = movie.release_date
        cell.resumeMovie.text = movie.overview
        
        manager.getMovieImage(poster_url: movie.poster_path) { (result) in
            DispatchQueue.main.async {
                cell.imageMovie.image = result == nil ? #imageLiteral(resourceName: "movie_placeholder") : UIImage(data: result!)
            }
        }
        
        return cell
    }



    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show"{
            let MovieViewController = segue.destination as! MovieViewController
            guard let row = tableView.indexPathForSelectedRow?.row else { return }
            
            let movie = movies[row]
            
            let title   = movie.title
            let resume  = movie.overview
            let release = movie.release_date
            
            MovieViewController._titleMovie = title
            MovieViewController._overView = resume
            MovieViewController._releaseLavel = release
            
            manager.getMovieImage(poster_url: movie.poster_path) { (result) in
                DispatchQueue.main.async {
                    MovieViewController.imageMovie.image = result == nil ? #imageLiteral(resourceName: "movie_placeholder") : UIImage(data: result!)
                }
            }
        }
    }

}
