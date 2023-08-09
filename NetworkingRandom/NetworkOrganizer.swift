//
//  NetworkOrganizer.swift
//  NetworkingRandom
//
//  Created by Санжар Бахытбек on 30.11.2022.
//

import Foundation

protocol NetworkOrganizerDelegate {
    func didUpdateHouses(with houses: [HouseResponseModel])
}

struct NetworkOrganizer {
    
    var delegate: NetworkOrganizerDelegate?
    

    func getHouse() {
        let urlString = "https://wizard-world-api.herokuapp.com/Houses"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Server Error: \(error.localizedDescription)")
            } else {
                guard let data else { return }
                decode(from: data)
            }
        }.resume()
    }
    
    private func decode(from data: Data) {
        do {
            let houses = try JSONDecoder().decode([HouseResponseModel].self, from: data)
            DispatchQueue.main.async {
                delegate?.didUpdateHouses(with: houses)
            }
        } catch {
            print("Parsing Error: \(error.localizedDescription)")
        }
    }
    

    }

