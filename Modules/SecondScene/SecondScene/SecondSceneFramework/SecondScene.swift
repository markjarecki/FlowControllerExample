//
//  SecondScene.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import SharedEntities

open class SecondScene: UIViewController {
    
    // MARK: - View Model
    
    public var viewModel: Colour? {
        
        didSet {
            
            colourLabel.text = viewModel?.name
            
        }
        
    }
    
    // MARK: - Views
    
    let headerLabel = UILabel()
    let colourHeaderLabel = UILabel()
    let colourLabel = UILabel()
    let hintLabel = UILabel()

    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // Add the views
        view.addSubview(headerLabel)
        view.addSubview(colourHeaderLabel)
        view.addSubview(colourLabel)
        view.addSubview(hintLabel)
        
        // Constraints
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        colourHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        colourLabel.translatesAutoresizingMaskIntoConstraints = false
        hintLabel.translatesAutoresizingMaskIntoConstraints = false

        // Header label properties
        headerLabel.text = "Second Scene"
        headerLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .white
        
        // Colour Header label properties
        colourHeaderLabel.text = "Home scene's background web colour"
        colourHeaderLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        colourHeaderLabel.textAlignment = .center
        colourHeaderLabel.textColor = .white
        
        // Colour label properties
        colourLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        colourLabel.textAlignment = .center
        colourLabel.textColor = .white
        
        // Hint label properties
        hintLabel.text = "Swipe from the left edge to return to Home Scene"
        hintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        hintLabel.textAlignment = .center
        hintLabel.textColor = .white
        hintLabel.lineBreakMode = .byWordWrapping
        hintLabel.numberOfLines = 2
        
        // Anchors
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        colourLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colourLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        colourHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colourHeaderLabel.centerYAnchor.constraint(equalTo: colourLabel.centerYAnchor, constant: -32).isActive = true
        
        hintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hintLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        hintLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        hintLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true

        
    }
    
    // MARK: Flow interactors
    
    // Flow interactors encapsulated a view controller's user interaction which trigger a flow specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given by the flow controller
    public var edgeswipeFlowInteractor: UIViewControllerInteractiveTransitioning?

}
