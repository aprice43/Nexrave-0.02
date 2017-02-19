//
//  PartyInfo.swift
//  Nexrave 0.02
//
//  Created by Alvan Price on 2/3/17.
//  Copyright © 2017 Nexrave. All rights reserved.
//

import Foundation




class PartyInfo: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    
    
    
    let customIdentifier = "cellID"

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customIdentifier, for: indexPath) 
        
        
        return customCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) / 4, height: (view.frame.height))
    }













}
