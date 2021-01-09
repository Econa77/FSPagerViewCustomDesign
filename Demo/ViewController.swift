//
//  ViewController.swift
//  Demo
//
//  Created by 古林俊佑 on 2021/01/09.
//

import UIKit
import FSPagerView

final class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet private weak var pagerView: FSPagerView! {
        didSet {
            pagerView.register(UINib(nibName: "CustomDesignCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomDesignCollectionViewCell")
            pagerView.dataSource = self
            pagerView.interitemSpacing = 10
        }
    }

    // MARK: - View Life Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pagerView.itemSize = CGSize(width: pagerView.frame.width - 30, height: pagerView.frame.height)
    }

}

// MARK: - FSPagerViewDataSource
extension ViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 5
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "CustomDesignCollectionViewCell", at: index)
        // If you access the cell, please cast it here
        // if let cell = cell as? CustomDesignCollectionViewCell {}
        return cell
    }
}
