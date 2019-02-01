//
//  MovieViewController.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 01/02/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var resume: UILabel!
    
    var _titleMovie:String?
    var _releaseLavel:String?
    var _overView:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleMovie.text=_titleMovie
        self.releaseDate.text=_releaseLavel
        self.resume.text=_overView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
