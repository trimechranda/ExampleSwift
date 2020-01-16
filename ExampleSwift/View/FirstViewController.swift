//
//  FirstViewController.swift
//  ExampleSwift
//
//  Created by TRIMECH on 13/01/2020.
//  Copyright © 2020 TRIMECH. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FirstViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewModelObserver()
        viewModel.prepareLocation()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let previsionData = sender as? PrevisionModel,
            let detailsVC = segue.destination as? DetailViewController else {
                return
        }
        detailsVC.prevision =  previsionData
    }
}

//MARK: Private Methods

extension FirstViewController {
    
    func prepareViewModelObserver() {
        self.viewModel.previsionDidChanges = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableView Delegate And Datasource Methods

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.previsionArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let previsionData = viewModel.previsionArray![indexPath.row]
        let firstCellViewModel = FirstCellViewModel(previsionData)
        return firstCellViewModel.cellInstance(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previsionData = viewModel.previsionArray![indexPath.row]
        self.performSegue(withIdentifier: "show_detail", sender: previsionData)
    }
}
