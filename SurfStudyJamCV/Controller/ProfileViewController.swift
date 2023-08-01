

import UIKit

class MainViewController: UIViewController {
    
    let personView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeader()
        
        // Create a sample Person object (you can replace this with your actual data)
        let person = Person(name: "Иванов Иван Иванович",
                            bioInfo: "Middle iOS-разработчик, опыт более 2-х лет",
                            location: "Воронеж",
                            profileImage: UIImage(named: "profileImage")!)
        
        personView.configure(with: person)
    }
    
    override func loadView() {
        view = personView
    }
    
    func setupHeader() {
        navigationController?.navigationBar.layoutMargins = UIEdgeInsets(top: 0, left: 34, bottom: 0, right: 0)
        title = "Профиль"
    }
}
