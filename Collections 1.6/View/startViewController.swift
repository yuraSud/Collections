

import UIKit

class startViewController: UIViewController {
    
    private let menuItem = ["Array","Set","Dictionary"]
   
    enum Collections: CaseIterable {
        case Array
        case Set
        case Dictionary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension startViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Collections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "\(Collections.allCases[indexPath.row])"
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let item = Collections.allCases[indexPath.row]
       
        switch item {
        
        case .Array :
            let storyboard = UIStoryboard(name: "arrayViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: arrayViewController.storyboardIdentifier)
            let index = Int.random(in: 1001...2000)
            vc.title = "Array \(index)"
            navigationController?.pushViewController(vc, animated: true)
        
        case .Set :
            let storyboard = UIStoryboard(name: "set", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: setViewController.storyboardIdentifier)
            let index = Int.random(in: 11...99)
            vc.title = "Set \(index)"
            navigationController?.pushViewController(vc, animated: true)
        
        case .Dictionary :
            let vc = dictionaryViewController()
            let index = Int.random(in: 101...999)
            vc.title = "Dictionary \(index)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
