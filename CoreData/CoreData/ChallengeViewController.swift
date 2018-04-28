//
//  ChallengeViewController.swift
//  Core Data Project
//
//  Created by Dayton Steffeny on 4/27/18.
//  Copyright © 2018 Dayton Steffeny. All rights reserved.
//

import UIKit
import CoreData

class ChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var challengeTableView: UITableView!
    var websites = [Website]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func addNewWebsite(_ sender: Any) {
        performSegue(withIdentifier: "Show the Website", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = challengeTableView.dequeueReusableCell(withIdentifier: "The website cell", for: indexPath)
        let website = websites[indexPath.row]
        
        cell.textLabel?.text = website.name
        cell.detailTextLabel?.text = website.url
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Show the Website", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Website> = Website.fetchRequest()
        
        do{
            websites = try managedContext.fetch(fetchRequest)
            
            challengeTableView.reloadData()
        }catch{
            print("Could not print")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SingleSiteViewController,
            let selectedRow = self.challengeTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.existingWebsite = websites[selectedRow]
    }

}
