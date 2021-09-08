

import UIKit

class HomeViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
//        let myLabel : UILabel={
//            let label  = UILabel(frame: CGRect(x: 80, y: 40, width: 100, height: 40))
//            label.text = "Home"
//            label.textAlignment = .left
//            label.font = UIFont.boldSystemFont(ofSize: 25)
//            
//            
//            label.textColor = .white
//            return label
//            
//            
//        }()
//        
//        let myCoursesLabel : UILabel={
//            let coursesLabel  = UILabel(frame: CGRect(x: (view.frame.width/2)-50, y: 90, width: 200, height: 60))
//            coursesLabel.text = "My Courses"
//            coursesLabel.textAlignment = .left
//            coursesLabel.font = UIFont.boldSystemFont(ofSize: 20)
//            
//            
//            coursesLabel.textColor = .white
//            return coursesLabel
//            
//            
//        }()
//        let myView : UIView={
//            let myv = UIView(frame: CGRect(x: (view.frame.width/2)-70, y: 147, width: 150, height: 3))
//            myv.backgroundColor = .white
//            return myv
//        }()
//        
//        
//        let btn1 = UIButton(type: .custom)
//        btn1.setImage(UIImage(named: "menu-rounded"), for: .normal)
//        btn1.frame = CGRect(x:10, y: 40, width: 40, height: 40)
//        btn1.addTarget(self, action: #selector(action), for: .touchUpInside)
//        navBar.addSubview(btn1)
//        self.setNavBarToTheView()
//        navBar.addSubview(myLabel)
//        navBar.addSubview(myCoursesLabel)
//        navBar.addSubview(myView)
        
    }
//    
//    func setNavBarToTheView() {
//        self.navBar.frame=CGRect(x: 0 , y:0 , width: view.frame.width, height: 150)
//        self.navBar.barTintColor = #colorLiteral(red: 0.2475984764, green: 0.5093117385, blue: 0.8296980697, alpha: 1)
//        self.view.addSubview(navBar)
//        
//        
//        
//    }
//    @objc func action (){
//        print("btn pressed")
//        
//    }
//    
//    
//    // collection view
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
//        cell.myImage.image = UIImage(named: "1")!
//        return cell
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
//        if proposedIndexPath.row == 3 {
//            return IndexPath(row: proposedIndexPath.row - 1, section: proposedIndexPath.section)
//        } else {
//            return proposedIndexPath
//        }
//    }
//    
    
}
