//
//  PlanetTableViewController.swift
//  Solar System
//
//  Created by Kvng Eko on 11/10/22.
//

import UIKit

class PlanetTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Solar System"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlanetController.shared.planets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
       
     
     // this is my reuseidentifier planetCell
        
        let planet = PlanetController.shared.planets[indexPath.row]
        
            var content = cell.defaultContentConfiguration()
            content.text = planet.name
            content.secondaryText = planet.planetType
        
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemGray6
        cell.selectedBackgroundView = backgroundView

        
        content.textProperties.color = .label
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
        content.textToSecondaryTextVerticalPadding = 4
        
        
        
        content.secondaryTextProperties.color = .secondaryLabel
        content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .subheadline)
        content.image = UIImage(systemName: (planet.favorite) ? "circle.fill": "circle")
        content.imageProperties.tintColor = .systemPurple
        content.imageToTextPadding = 16
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "planetDetailSegue" {
            guard let destinationVC = segue.destination as? PlanetDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let planet = PlanetController.shared.planets[indexPath.row]
            
            destinationVC.planet = planet
        }
    }
    

}
