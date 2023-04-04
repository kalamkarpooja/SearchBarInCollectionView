//
//  ViewController.swift
//  SearchControllerInCollectionView
//
//  Created by Mac on 04/04/23.
//

import UIKit
struct Data {
    var name : String
    var image : String
}
class ViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate {
    var data = [Data]()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var FoodCollectionView: UICollectionView!
   override func viewDidLoad() {
        super.viewDidLoad()
        FoodCollectionView.delegate = self
        FoodCollectionView.dataSource = self
        DataSetUp()
        searchBarSetup()
    }
    func tableView(){
        let uinib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.FoodCollectionView.register(uinib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    private func DataSetUp(){
        data = [ Data(name: "Idli", image: "breakfast"),
                   Data(name: "Momos", image: "momos"),
                   Data(name: "Poha",image: "breakfast4"),
                   Data(name: "Kulfi", image: "cd5"),
                   Data(name: "Upma",image: "breakfast5"),
                   Data(name: "IceCream",image: "cd"),
                   Data(name: "Omlet",image: "download (5)"),
                   Data(name: "Manchuriyan",image: "download (6)"),
                   Data(name: "Masala Papad", image: "download (7)"),
                   Data(name: "Chicken Thali", image: "download (8)"),
                   Data(name: "Biryani", image: "mc"),
                   Data(name: "Anda Curry", image: "mc5")
        ]

    }
    private func searchBarSetup(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == ""{
            DataSetUp()
        }else{
            data = data.filter{
                $0.name.contains(searchText)
                }
        }
        FoodCollectionView.reloadData()
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.FoodCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.lbl.text = data[indexPath.row].name
        cell.img.image = UIImage(named: data[indexPath.row].image)
        cell.lbl.textColor = .black
        cell.layer.borderWidth = 4
        cell.layer.borderColor = .init(genericCMYKCyan: 2, magenta: 2, yellow: 1, black: 2, alpha: 3)
        cell.layer.cornerRadius = 15
         return cell
     
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: 207, height: 200)
    }
}
