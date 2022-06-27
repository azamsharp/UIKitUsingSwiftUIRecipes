//
//  DonutTableViewController.swift
//  Learn
//
//  Created by Mohammad Azam on 6/23/22.
//

import Foundation
import UIKit
import SwiftUI

class DonutTableViewController: UITableViewController {
    
    let donuts = [Donut(name: "Donut 1", picture: "1"), Donut(name: "Donut 2", picture: "2"),Donut(name: "Donut 3", picture: "3"),Donut(name: "Donut 4", picture: "4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Donuts"
        
        // register the cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DonutCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donuts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let donut = donuts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonutCell", for: indexPath)
        
        cell.contentConfiguration = UIHostingConfiguration(content: {
            DonutCellView(donut: donut) // SwiftUI View
        })
        
        return cell
    }
    
}


struct DonutDetailsViewController_Previews: PreviewProvider {
    static var previews: some View {
        DonutTableViewController_Representable()
    }
}

struct DonutTableViewController_Representable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> DonutTableViewController {
        DonutTableViewController()
    }
    
    func updateUIViewController(_ uiViewController: DonutTableViewController, context: Context) {
        
    }
}


