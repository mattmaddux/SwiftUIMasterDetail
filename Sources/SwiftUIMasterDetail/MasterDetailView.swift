//
//  MasterDetailView.swift
//  
//
//  Created by Matt Maddux on 4/24/20.
//

import Foundation
import SwiftUI
import SwiftUIDevice


struct MasterDetailView<Master, Detail, Placeholder>: View where Master: View, Detail: View, Placeholder: View  {
    
    @Binding var showingDetail: Bool
    private let quickSlideAnimation: Animation = Animation.linear(duration: 0.2)
    private let master: () -> Master
    private let detail: () -> Detail
    private let placeholder: () -> Placeholder?
    
    

    init(showingDetail: Binding<Bool>, @ViewBuilder master: @escaping () -> Master, @ViewBuilder detail: @escaping () -> Detail, @ViewBuilder placeholder: @escaping () -> Placeholder? = { nil }) {
        self._showingDetail = showingDetail
        self.master = master
        self.detail = detail
        self.placeholder = placeholder
    }

    var body: some View {
        WindowReader { windowClass in
            GeometryReader{ geometry in
                if windowClass == .veryNarrow {
                    ZStack {
                        self.master()
                            .offset(x: self.showingDetail ? -geometry.size.width / 3 : 0)
                            .animation(self.quickSlideAnimation)
                        self.detail()
                            .offset(x: self.showingDetail ? 0 : geometry.size.width)
                            .animation(self.quickSlideAnimation)
                        
                    }
                } else {
                    HStack(spacing: 0) {
                        self.master()
                            .frame(width: self.masterPanelWidth(forWindowClass: windowClass))
                            .frame(maxHeight: .infinity)
                        Divider()
                        if self.placeholder() != nil && !self.showingDetail {
                            self.placeholder()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        } else {
                            self.detail()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        }
                    }
                }
            }
        }
    }
    
    private func masterPanelWidth(forWindowClass windowClass: WindowClass) -> CGFloat {
        switch windowClass {
            case .veryNarrow: return 0
            case .narrow: return 320
            case .wide: return 375
            case .veryWide: return 414
        }
    }
}
