//
//  HomeScene.swift
//  HomeSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class HomeScene: UIViewController {
    
    // MARK: - Views
    
    let headerLabel = UILabel()
    let hintLabel = UILabel()
    
    // MARK: - Layout guides
    
    let headerLabelGuide = UILayoutGuide()
    let hintLabelGuide = UILayoutGuide()
    
    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Add the views
        view.addSubview(headerLabel)
        headerLabel.text = "Home Scene"
        
        view.addSubview(hintLabel)
        hintLabel.text = "Tap anywhere for Second Scene"
        
        // Constraints
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add layout guides
        view.addLayoutGuide(headerLabelGuide)
        view.addLayoutGuide(hintLabelGuide)
        
        // Header label properties
        headerLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .black
        
        // Hint label properties
        hintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        hintLabel.textAlignment = .center
        hintLabel.textColor = .black
        
        // Anchors
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true

        hintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hintLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        
    }

    // MARK: Flow interactors
    
    // Flow interactors encapsulated a view controller's user interaction which trigger a flow specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given by the flow controller
    public var tapFlowInteractor: NSObjectProtocol?

}
