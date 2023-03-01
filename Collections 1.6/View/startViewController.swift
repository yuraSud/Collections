

import UIKit

class startViewController: UIViewController {
    
    private let menuItem = ["Array","Set","Dictionary"]
   
    enum Collections: String, CaseIterable {
        case array = "Array"
        case set = "Set"
        case dictionary = "Dictionary"
    }
    enum StoryboardsNames: String {
        case array = "arrayViewController"
        case set = "set"
        case dictionary = "Dictionary"
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
        config.text = "\(Collections.allCases[indexPath.row].rawValue)"
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let item = Collections.allCases[indexPath.row]
       
        switch item {
        
        case .array :
            goToViewController(nameViewController: StoryboardsNames.array, range: (1001..<2000), identifier: arrayViewController.storyboardIdentifier, title: Collections.array.rawValue)
        
        case .set :
            goToViewController(nameViewController: StoryboardsNames.set, range: 11..<100, identifier: setViewController.storyboardIdentifier, title: Collections.set.rawValue)
            
        case .dictionary :
            let vc = dictionaryViewController()
            let index = Int.random(in: 101...999)
            vc.title = "Dictionary \(index)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func goToViewController(nameViewController:StoryboardsNames, range: Range<Int>, identifier: String, title: String){
        let storyboard = UIStoryboard(name: nameViewController.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        let index = Int.random(in: range)
        vc.title = "\(title) \(index)"
        navigationController?.pushViewController(vc, animated: true)
    }
}
