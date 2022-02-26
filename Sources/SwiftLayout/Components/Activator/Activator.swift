//
//  Activator.swift
//  
//
//  Created by aiden_h on 2022/02/16.
//

import Foundation
import UIKit

enum Activator {
    
    static func active<L: Layout>(layout: L, options: LayoutOptions = []) -> Deactivation<AnyLayoutBuilding<L>> {
        return update(layout: layout, fromDeactivation: Deactivation(building: AnyLayoutBuilding(layout)), options: options)
    }
    
    static func active<L: Layout, LB: LayoutBuilding>(layout: L, options: LayoutOptions = [], building: LB) -> Deactivation<LB>  where LB.LayoutBody == L {
        return update(layout: layout, fromDeactivation: Deactivation(building: building), options: options)
    }

    @discardableResult
    private static func updateAndReturnInfos<L: Layout, LB: LayoutBuilding>(layout: L, fromDeactivation deactivation: Deactivation<LB>, options: LayoutOptions) -> ([ViewInformation], [NSLayoutConstraint]) {
        let viewInfos = layout.viewInformations
        let viewInfoSet = ViewInformationSet(infos: viewInfos)
        
        updateViews(deactivation: deactivation, viewInfos: viewInfos)
        
        if options.contains(.automaticIdentifierAssignment) {
            updateIdentifiers(fromBuilding: deactivation.building, viewInfoSet: viewInfoSet)
        }
        
        let constraints = layout.viewConstraints(viewInfoSet)
        
        updateConstraints(deactivation: deactivation, constraints: constraints)
        
        return (viewInfos, constraints)
    }
    
    @discardableResult
    static func update<L: Layout, LB: LayoutBuilding>(layout: L, fromDeactivation deactivation: Deactivation<LB>, options: LayoutOptions) -> Deactivation<LB> {
        
        let (viewInfos, _) = updateAndReturnInfos(layout: layout, fromDeactivation: deactivation, options: options)
        
        if options.contains(.usingAnimation) {
            animate(viewInfos: viewInfos)
        }
        
        return deactivation
    }
}

extension Activator {
    public static func finalActive<L: Layout>(layout: L, options: LayoutOptions = []) {
        let viewInfos = layout.viewInformations
        let viewInfoSet = ViewInformationSet(infos: viewInfos)
        
        if options.contains(.automaticIdentifierAssignment) {
            updateIdentifiers(viewInfoSet: viewInfoSet)
        }
        
        let constraints = layout.viewConstraints(viewInfoSet)
        
        activate(viewInfos: viewInfos, constraints: constraints)
    }
}

private extension Activator {
    static func updateViews<LB: LayoutBuilding>(deactivation: Deactivation<LB>, viewInfos: [ViewInformation]) {
        let newInfos = viewInfos
        let newInfosSet = Set(newInfos)
        let oldInfos = deactivation.viewInfos.infos
        
        // remove old views
        for viewInfo in oldInfos where !newInfosSet.contains(viewInfo) {
            viewInfo.removeFromSuperview()
        }
        
        // add new views
        for viewInfo in newInfos {
            viewInfo.addSuperview()
        }
        
        deactivation.viewInfos = ViewInformationSet(infos: viewInfos)
    }
    
    static func updateConstraints<LB: LayoutBuilding>(deactivation: Deactivation<LB>, constraints: [NSLayoutConstraint]) {
        NSLayoutConstraint.deactivate(deactivation.constraints.constraints.compactMap(\.origin))
        
        var weakens: [WeakReference<NSLayoutConstraint>] = []
        for weakConstraint in constraints.weakens where !weakens.contains(weakConstraint) {
            weakens.append(weakConstraint)
        }
        
        NSLayoutConstraint.activate(weakens.compactMap(\.origin))

        
        deactivation.constraints = ConstraintsSet(constraints: constraints)
    }
    
    static func deactivate<LB: LayoutBuilding>(deactivation: Deactivation<LB>, withViewInformationSet viewInfoSet: ViewInformationSet) {
        deactivation.deactiveConstraints()
        
        for existedView in deactivation.viewInfos.infos where !viewInfoSet.infos.contains(existedView) {
            existedView.removeFromSuperview()
        }
    }
    
    static func activate(viewInfos: [ViewInformation], constraints: [NSLayoutConstraint]) {
        for viewInfo in viewInfos {
            viewInfo.addSuperview()
        }
       
        var weakens: [WeakReference<NSLayoutConstraint>] = []
        for weakConstraint in constraints.weakens where !weakens.contains(weakConstraint) {
            weakens.append(weakConstraint)
        }
        
        NSLayoutConstraint.activate(weakens.compactMap(\.origin))
    }
    
    static func updateIdentifiers<LB: LayoutBuilding>(fromBuilding building: LB?, viewInfoSet: ViewInformationSet) {
        updateIdentifiers(rootObject: building, viewInfoSet: viewInfoSet)
    }
    
    static func updateIdentifiers(rootObject: AnyObject? = nil, viewInfoSet: ViewInformationSet) {
        guard let rootObject = rootObject ?? viewInfoSet.rootview else {
            assertionFailure("Could not find root view for LayoutOptions.accessibilityIdentifiers. Please use LayoutBuilding.")
            return
        }
        
        IdentifierUpdater(rootObject).update()
    }
    
    static func animate(viewInfos: [ViewInformation]) {
        guard let root = viewInfos.first(where: { $0.superview == nil })?.view else {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            root.layoutIfNeeded()
            viewInfos.forEach { information in
                information.animation()
            }
        }
    }
}
