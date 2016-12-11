// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import UIKit

struct R {
  static func validate() {
    storyboard.launchScreen.validateImages()
    storyboard.launchScreen.validateViewControllers()
    storyboard.main.validateImages()
    storyboard.main.validateViewControllers()
  }
  
  struct file {
    static var bucketsJson: NSURL? { return _R.hostingBundle?.URLForResource("Buckets", withExtension: "json") }
    static var rounded_EleganceTtf: NSURL? { return _R.hostingBundle?.URLForResource("Rounded_Elegance", withExtension: "ttf") }
  }
  
  struct font {
    static func roundedEleganceNewRegular(size size: CGFloat) -> UIFont? {
      return UIFont(name: "RoundedEleganceNew-Regular", size: size)
    }
  }
  
  struct image {
    static var header: UIImage? { return UIImage(named: "header", inBundle: _R.hostingBundle, compatibleWithTraitCollection: nil) }
  }
  
  struct nib {
    static var headerView: _R.nib._HeaderView { return _R.nib._HeaderView() }
    static var homeView: _R.nib._HomeView { return _R.nib._HomeView() }
    static var rightMenuCell: _R.nib._RightMenuCell { return _R.nib._RightMenuCell() }
  }
  
  struct reuseIdentifier {
    
  }
  
  struct segue {
    
  }
  
  struct storyboard {
    struct launchScreen {
      static var initialViewController: UIViewController? { return instance.instantiateInitialViewController() }
      static var instance: UIStoryboard { return UIStoryboard(name: "LaunchScreen", bundle: _R.hostingBundle) }
      
      static func validateImages() {
        
      }
      
      static func validateViewControllers() {
        
      }
    }
    
    struct main {
      static var initialViewController: ViewController? { return instance.instantiateInitialViewController() as? ViewController }
      static var instance: UIStoryboard { return UIStoryboard(name: "Main", bundle: _R.hostingBundle) }
      
      static func validateImages() {
        
      }
      
      static func validateViewControllers() {
        
      }
    }
  }
}

struct _R {
  static var hostingBundle: NSBundle? { return NSBundle(identifier: "official.alfian.MyProject") }
  
  struct nib {
    struct _HeaderView: NibResource {
      var instance: UINib { return UINib.init(nibName: "HeaderView", bundle: _R.hostingBundle) }
      var name: String { return "HeaderView" }
      
      func firstView(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> HeaderView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? HeaderView
      }
      
      func instantiateWithOwner(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> [AnyObject] {
        return instance.instantiateWithOwner(ownerOrNil, options: optionsOrNil)
      }
    }
    
    struct _HomeView: NibResource {
      var instance: UINib { return UINib.init(nibName: "HomeView", bundle: _R.hostingBundle) }
      var name: String { return "HomeView" }
      
      func firstView(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? UIView
      }
      
      func instantiateWithOwner(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> [AnyObject] {
        return instance.instantiateWithOwner(ownerOrNil, options: optionsOrNil)
      }
    }
    
    struct _RightMenuCell: NibResource {
      var instance: UINib { return UINib.init(nibName: "RightMenuCell", bundle: _R.hostingBundle) }
      var name: String { return "RightMenuCell" }
      
      func firstView(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> RightMenuCell? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? RightMenuCell
      }
      
      func instantiateWithOwner(ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]?) -> [AnyObject] {
        return instance.instantiateWithOwner(ownerOrNil, options: optionsOrNil)
      }
    }
  }
}

struct ReuseIdentifier<T>: CustomStringConvertible {
  let identifier: String
  
  var description: String { return identifier }
}

struct StoryboardSegueIdentifier<Segue: UIStoryboardSegue, Source: UIViewController, Destination: UIViewController>: CustomStringConvertible {
  let identifier: String
  
  var description: String { return identifier }
}

struct TypedStoryboardSegueInfo<Segue: UIStoryboardSegue, Source: UIViewController, Destination: UIViewController>: CustomStringConvertible {
  let destinationViewController: Destination
  let identifier: String?
  let segue: Segue
  let sourceViewController: Source
  
  var description: String { return identifier ?? "" }
  
   init?(segue: UIStoryboardSegue) {
    guard let segue = segue as? Segue, sourceViewController = segue.sourceViewController as? Source, destinationViewController = segue.destinationViewController as? Destination else { return nil }
    self.segue = segue
    self.identifier = segue.identifier
    self.sourceViewController = sourceViewController
    self.destinationViewController = destinationViewController
  }
}

protocol NibResource {
  var instance: UINib { get }
  var name: String { get }
}

protocol Reusable {
  typealias T
  
  var reuseIdentifier: ReuseIdentifier<T> { get }
}

extension UITableView {
  func dequeueReusableCellWithIdentifier<T : UITableViewCell>(identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath?) -> T? {
    if let indexPath = indexPath {
      return dequeueReusableCellWithIdentifier(identifier.identifier, forIndexPath: indexPath) as? T
    }
    return dequeueReusableCellWithIdentifier(identifier.identifier) as? T
  }
  
  func dequeueReusableCellWithIdentifier<T : UITableViewCell>(identifier: ReuseIdentifier<T>) -> T? {
    return dequeueReusableCellWithIdentifier(identifier.identifier) as? T
  }
  
  func dequeueReusableHeaderFooterViewWithIdentifier<T : UITableViewHeaderFooterView>(identifier: ReuseIdentifier<T>) -> T? {
    return dequeueReusableHeaderFooterViewWithIdentifier(identifier.identifier) as? T
  }
  
  func registerNib<T: NibResource where T: Reusable, T.T: UITableViewCell>(nibResource: T) {
    registerNib(nibResource.instance, forCellReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNibForHeaderFooterView<T: NibResource where T: Reusable, T.T: UIView>(nibResource: T) {
    registerNib(nibResource.instance, forHeaderFooterViewReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNibs<T: NibResource where T: Reusable, T.T: UITableViewCell>(nibResources: [T]) {
    nibResources.forEach(registerNib)
  }
}

extension UICollectionView {
  func dequeueReusableCellWithReuseIdentifier<T: UICollectionViewCell>(identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath) -> T? {
    return dequeueReusableCellWithReuseIdentifier(identifier.identifier, forIndexPath: indexPath) as? T
  }
  
  func dequeueReusableSupplementaryViewOfKind<T: UICollectionReusableView>(elementKind: String, withReuseIdentifier identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath) -> T? {
    return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier.identifier, forIndexPath: indexPath) as? T
  }
  
  func registerNib<T: NibResource where T: Reusable, T.T: UICollectionViewCell>(nibResource: T) {
    registerNib(nibResource.instance, forCellWithReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNib<T: NibResource where T: Reusable, T.T: UICollectionReusableView>(nibResource: T, forSupplementaryViewOfKind kind: String) {
    registerNib(nibResource.instance, forSupplementaryViewOfKind: kind, withReuseIdentifier: nibResource.reuseIdentifier.identifier)
  }
  
  func registerNibs<T: NibResource where T: Reusable, T.T: UICollectionViewCell>(nibResources: [T]) {
    nibResources.forEach(registerNib)
  }
  
  func registerNibs<T: NibResource where T: Reusable, T.T: UICollectionReusableView>(nibResources: [T], forSupplementaryViewOfKind kind: String) {
    nibResources.forEach { self.registerNib($0, forSupplementaryViewOfKind: kind) }
  }
}

extension UIViewController {
  convenience init(nib: NibResource) {
    self.init(nibName: nib.name, bundle: _R.hostingBundle)
  }
}

extension UIViewController {
  func performSegueWithIdentifier<Segue: UIStoryboardSegue,Source: UIViewController,Destination: UIViewController>(identifier: StoryboardSegueIdentifier<Segue, Source, Destination>, sender: AnyObject?) {
    performSegueWithIdentifier(identifier.identifier, sender: sender)
  }
}

extension UIStoryboardSegue {
  func typedInfoWithIdentifier<Segue: UIStoryboardSegue,Source: UIViewController,Destination: UIViewController>(identifier: StoryboardSegueIdentifier<Segue, Source, Destination>) -> TypedStoryboardSegueInfo<Segue, Source, Destination>? {
    guard self.identifier == identifier.identifier else { return nil }
    return TypedStoryboardSegueInfo(segue: self)
  }
}