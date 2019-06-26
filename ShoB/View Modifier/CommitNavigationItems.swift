//
//  CommitNavigationItems.swift
//  ShoB
//
//  Created by Dara Beng on 6/23/19.
//  Copyright © 2019 Dara Beng. All rights reserved.
//

import SwiftUI


/// Modifier to setup item for navigated or modal mode.
struct CommitNavigationItems: ViewModifier {
    
    /// Cancel action.
    ///
    /// Set `onCancel` to handle cancelation when using with `Modal`.
    /// When using with `NavigationView`, set to `nil` to use the default back navigation item.
    var onCancel: (() -> Void)?
    
    /// The action to perform when commit the form.
    var onCommit: (() -> Void)

    let commitTitle: String
    let modalCommitTitle: String
    
    
    func body(content: Content) -> some View {
        let title = onCancel == nil ? commitTitle : modalCommitTitle
        let commit = Button(action: onCommit, label: { Text(title) })
        
        if let onCancel = onCancel {
            let cancel = Button(action: onCancel, label: { Text("Cancel") })
            return content.navigationBarItems(leading: cancel, trailing: commit)
        }
        
        return content.navigationBarItems(trailing: commit)
    }
}
