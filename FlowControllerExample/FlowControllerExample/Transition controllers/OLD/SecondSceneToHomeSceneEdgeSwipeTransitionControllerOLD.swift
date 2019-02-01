//
//  SecondSceneToHomeSceneEdgeSwipeTransitionController.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

//import UIKit
//
//// Scene interchange entities
//import SharedEntities
//
//// Transition controller protocol definition
//import FlowControllerCore
//
//// Origin scene
//import SecondSceneFramework
//
//// Destination scene
//import HomeSceneFramework
//
//class SecondSceneToHomeSceneEdgeSwipeTransitionControllerOLD: UIPercentDrivenInteractiveTransition, TransitionController {
//
//    // MARK: - Properties
//
//    // MARK: TransitionController conformance
//
//    weak var sourceViewController: UIViewController? {
//
//        didSet {
//
//            guard let sourceViewController = sourceViewController else { return }
//
//            // Set up gesture recognizer
//            leftEdgeSwipeGesture.addTarget(self, action: #selector(handler(pan:)))
//            leftEdgeSwipeGesture.edges = .left
//            sourceViewController.view.addGestureRecognizer(leftEdgeSwipeGesture)
//
//        }
//
//    }
//
//    // MARK: Interactivity flag
//
//    fileprivate var interactive = false
//
//    // MARK: Duration
//
//    fileprivate let animatorDuration: TimeInterval
//
//    // MARK: Gesture recognizer
//
//    private let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()
//
//    // MARK: Property animator
//
//    fileprivate let animator: UIViewPropertyAnimator
//
//    // MARK: - Initialisers
//
//    init(duration: TimeInterval) {
//
//        animator = SecondSceneToHomeSceneEdgeSwipeTransitionControllerOLD.makeAnimator(duration: duration)
//
//        animatorDuration = animator.duration
//
//        super.init()
//
//    }
//
//    // MARK: - Gesture handler
//
//    @objc public func handler(pan: UIScreenEdgePanGestureRecognizer) {
//
//        guard let sourceViewController = sourceViewController as? SecondScene else { return }
//
//        let translation = pan.translation(in: pan.view!)
//
//        // Distance travelled
//        let distance = translation.x / pan.view!.bounds.width * 0.5
//
//        switch (pan.state) {
//
//            case .began:
//
//                interactive = true
//
//                // Start transition
//                // Call the flow outlet for this interaction event
//                sourceViewController.flowDelegate.flow(tapFromSecondScene: sourceViewController, content: Colours(name: sourceViewController.view.backgroundColor!.description) )
//
//            case .changed:
//
//                print("CHANGED")
//
//                update(distance)
//
//            // .ended, .cancelled, .failed
//            default:
//
//                print("ENDED")
//
//                interactive = false
//
//                if distance > 0.2 {
//
//                    // Threshold breached - finish transition
//                    finish()
//
//                } else {
//
//                    // Threshold missed - cancel transition
//                    cancel()
//
//                }
//
//        }
//
//    }
//
//}
//
//// MARK: - UIViewControllerTransitioningDelegate conformance
//
//extension SecondSceneToHomeSceneEdgeSwipeTransitionControllerOLD: UIViewControllerTransitioningDelegate {
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//       print("presented")
//
//        return self
//
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//       print("dismissed")
//
//        return self
//
//    }
//
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//
//       print("interactionControllerForPresentation")
//
//        // If interactive == true, return transition controller, otherwise nil
//
//        return interactive ? self : nil
//
//    }
//
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//
//       print("interactionControllerForDismissal")
//
//        return interactive ? self : nil
//
//    }
//
//}
//
//// MARK: - UIViewControllerAnimatedTransitioning conformance
//
//extension SecondSceneToHomeSceneEdgeSwipeTransitionControllerOLD: UIViewControllerAnimatedTransitioning {
//
//    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//
//        print("transitionDuration")
//
//        return animatorDuration
//
//    }
//
//    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//
//        print("animateTransition")
//
//        // References to: from and to views
//        let container = transitionContext.containerView
//        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
//        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
//
//        // Add the active views to the container
//        container.addSubview(toView)
//        container.addSubview(fromView)
//
//        // Add a simple fadeout animation
//        animator.addAnimations{ [unowned self] in
//
//            let internalAnimator = UIViewPropertyAnimator(duration: self.animator.duration, curve: .linear){
//
//                fromView.alpha = 0
//
//            }
//
//            internalAnimator.startAnimation()
//
//        }
//
////        // Animator must be paused for interactive transition
////        animator.pauseAnimation()
//
//    }
//
//}
//
//// MARK: - UIViewPropertyAnimator factory
//
//extension SecondSceneToHomeSceneEdgeSwipeTransitionControllerOLD {
//
//    static func makeAnimator(duration: TimeInterval) -> UIViewPropertyAnimator {
//
//        print("makeAnimator")
//
//        // Linear timing
//        let timingCurve = UICubicTimingParameters(animationCurve: .linear)
//
//        return UIViewPropertyAnimator(duration: duration, timingParameters: timingCurve)
//
//    }
//
//}
