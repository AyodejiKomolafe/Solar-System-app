//
//  PlanetDetailViewController.swift
//  Solar System
//
//  Created by Kvng Eko on 11/10/22.
//

import UIKit

class PlanetDetailViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as? DetailCollectionViewCell else {return UICollectionViewCell()}
        cell.detailImageView.alpha = 0.5
        cell.detailImageView.image = UIImage(systemName: "globe")
        
        guard let planet = planet else {return UICollectionViewCell()}
        switch indexPath.item {
            case 0:
                cell.titleLabel.text  = "Day Length"
                cell.detailLabel.text = "\(planet.dayLengthInDays) days"
            case 1:
                cell.titleLabel.text  = "Year Length"
            cell.detailLabel.text     = "\(planet.yearLengthInDays) days"
            case 2:
                cell.titleLabel.text  = "Radius"
            cell.detailLabel.text     = "\(planet.radiusInMiles) miles"
            case 3:
                cell.titleLabel.text  = "Moon Count"
            cell.detailLabel.text     = "\(planet.moonCount)"
            case 4:
                cell.titleLabel.text  = "Ring Count"
            cell.detailLabel.text     = "\(planet.ringCount)"
            case 5:
                cell.titleLabel.text  = "Planet Type"
            cell.detailLabel.text     = "\(planet.planetType)"
            case 6:
                cell.titleLabel.text  = "Distance From Sun"
            cell.detailLabel.text     = "\(planet.distanceFromSun) AU"
            case 7:
                cell.titleLabel.text  = "Galaxy"
            cell.detailLabel.text     = "Milky Way"
            
            default:
                break
        }
        
        return cell
    }
    
    
    
    
    var planet : Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet var favoriteButton: UIBarButtonItem!
    
    func updateFavoriteStatus() {
        guard let planet = planet else { return }
        favoriteButton.image = UIImage(systemName: planet.favorite ?  "star.circle.fill" : "star.circle" )
    }
    
    @IBAction func favoriteButtonPresssed(_ sender: Any) {
        guard let planet = planet else{ return }
        PlanetController.shared.updateFavorite(planet: planet)
        updateFavoriteStatus()
    }
    
    @IBOutlet var detailCollectionView: UICollectionView!
    @IBOutlet var planetNamesakeLabel: UILabel!
    @IBOutlet var planetNameLabel: UILabel!
    @IBOutlet var ordinalSuffixLabel: UILabel!
    @IBOutlet var planetOrderNumberLabel: UILabel!
    @IBOutlet var planetImageView: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        favoriteButton.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        self.title = planet?.name
    }

    private func updateViews() {
        
        
        
            guard let planet = planet, isViewLoaded else {return}
        
            
            planetNameLabel.text        = planet.name.uppercased()
            planetNamesakeLabel.text    = planet.namesake
            planetOrderNumberLabel.text = "\(planet.orderNumber)"
            ordinalSuffixLabel.text     = showOrdinal(ordinal: planet.orderNumber)
            planetImageView.image       = UIImage(named: planet.imageName)
            
            
    }
    
    
    
    func showOrdinal(ordinal: Int) -> String {
        switch ordinal {
        case 1 :
            return "st"
        case 2 :
            return "nd"
        case 3 :
            return "rd"
        case 4...8 :
            return "th"
        default:
           return "not ranked"
        }
    }
    
    
    
   
    
    

}
