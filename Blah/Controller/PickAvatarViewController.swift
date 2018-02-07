//
//  PickAvatarViewController.swift
//  Blah
//
//  Created by Abdurrahman on 2/5/18.
//  Copyright © 2018 AR Ehsan. All rights reserved.
//

import UIKit
import SJFluidSegmentedControl

class PickAvatarViewController: UIViewController, SJFluidSegmentedControlDataSource, SJFluidSegmentedControlDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	// Outlets
	@IBOutlet weak var collectionView: UICollectionView!
	
	// Segment
	@IBOutlet weak var segmentedControl: SJFluidSegmentedControl!
	@IBOutlet weak var segmentWidth: NSLayoutConstraint!
	@IBOutlet weak var segmentHeight: NSLayoutConstraint!
	
	var avatarType = AvatarType.dark
	
	let screenSize: CGRect = UIScreen.main.bounds
	
	override func viewDidLoad() {
        super.viewDidLoad()
		segmentedControl.textFont = UIFont(name: "AvenirNext-Demibold", size: 13.0)!
		segmentWidth.constant = screenSize.width / 2
		segmentHeight.constant = (screenSize.height / 2) / 10
		
		collectionView.delegate = self
		collectionView.dataSource = self
	}

	@IBAction func backPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
			cell.configureCell(index: indexPath.item, type: avatarType)
			return cell
		}
		return AvatarCell()
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 28
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		var numOfColumns: CGFloat = 3
		
		if UIScreen.main.bounds.width > 320 {
			numOfColumns = 4
		}
		
		let spaceBetweenCells: CGFloat = 10
		let padding: CGFloat = 40
		let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
		
		return CGSize(width: cellDimension, height: cellDimension)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if avatarType == .dark {
			UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
		} else {
			UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
		}
		
		self.dismiss(animated: true, completion: nil)
	}
	
	func numberOfSegmentsInSegmentedControl(_ segmentedControl: SJFluidSegmentedControl) -> Int {
		return 2
	}
	
	func segmentedControl(_ segmentedControl: SJFluidSegmentedControl, titleForSegmentAtIndex index: Int) -> String? {
		if index == 0 {
			return "Dark"
		} else {
			return "Light"
		}
	}
	
	func segmentedControl(_ segmentedControl: SJFluidSegmentedControl, didChangeFromSegmentAtIndex fromIndex: Int, toSegmentAtIndex toIndex: Int) {
		if fromIndex == 1 && toIndex == 0 {
			avatarType = .dark
		} else if fromIndex == 0 && toIndex == 1  {
			avatarType = .light
		}
		collectionView.reloadData()
	}

}
