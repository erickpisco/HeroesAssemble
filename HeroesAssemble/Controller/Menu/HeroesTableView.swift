//
//  HeroesTableView.swift
//  HeroesAssemble
//
//  Created by erick pisco on 17/05/19.
//  Copyright © 2019 erick pisco. All rights reserved.
//

import UIKit

class HeroesTableView: UITableViewController {
    
    @IBOutlet weak var heroThambnail: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UILabel!

    
    var name: String?
    var heroes: [Hero] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "serching heroes..."
        loadHeroes()

    }
    
    func loadHeroes() {
        loadingHeroes = true
        MarvelServices.getHeroes(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.label.text = ""
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroCell
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)

        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()

        }
    }



}
