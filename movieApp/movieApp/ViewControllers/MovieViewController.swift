//
//  ViewController.swift
//  movieApp
//
//  Created by Ete Developer on 17.08.2021.
//

import UIKit

class MovieViewController: UIViewController {
    
    private lazy var viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchMovieResults()
        
    }


}

