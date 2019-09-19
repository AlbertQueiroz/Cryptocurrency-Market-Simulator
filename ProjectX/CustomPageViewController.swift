//
//  CustomPageViewController.swift
//  Tutorial
//
//  Created by raji on 16/09/19.
//  Copyright © 2019 raji. All rights reserved.
//

import UIKit

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var subViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstScreen"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondScreen") as! secondScreen,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdScreen") as! thirdScreen,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fourthScreen") as! fourthScreen
        ]
    }()
    
    
    var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[0]], direction: .forward, animated: false, completion: nil)
        
        pageControl = UIPageControl(frame: CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 200, height: 100))
        
    }
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of:viewController) ?? 0
        if (currentIndex <= 0){
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if (currentIndex >= subViewControllers.count - 1){
            return nil
        }
        return subViewControllers[currentIndex+1]
    }
}




extension UIPageViewController {
    
    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }
    
    func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }
    
}
