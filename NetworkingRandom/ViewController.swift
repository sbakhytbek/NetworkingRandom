//
//  ViewController.swift
//  NetworkingRandom
//
//  Created by Санжар Бахытбек on 30.11.2022.
//

import UIKit

class ViewController: UIViewController, NetworkOrganizerDelegate {
    
    @IBOutlet private weak var houseImage: UIImageView!
    @IBOutlet private weak var houseName: UILabel!
    @IBOutlet private weak var animalName: UILabel!
    @IBOutlet private weak var elementName: UILabel!

    var networkOrganizer = NetworkOrganizer()
    var houses: [HouseResponseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        networkOrganizer.delegate = self
    }
    
    @IBAction private func rollButtonDidTap(_ sender: UIButton) {
        if houses.isEmpty {
            networkOrganizer.getHouse()
        } else {
            setData(houses: self.houses)
        }
    }
    
    func didUpdateHouses(with houses: [HouseResponseModel]) {
        self.houses = houses
        setData(houses: self.houses)
    }
    
    func setData(houses: [HouseResponseModel]){
        guard let randomHouse = houses.randomElement() else { return }
        houseName.text = randomHouse.name
        animalName.text = randomHouse.animal
        elementName.text = randomHouse.element
        houseImage.image = UIImage(named: randomHouse.name)
    }
}
