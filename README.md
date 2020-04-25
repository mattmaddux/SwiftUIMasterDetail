# SwiftUIMasterDetail

A simple view builder for making master-detail layouts without the need to use NavigationView and more easily managed. Automatically scales and adjusts based on device and multitasking status. Works like a stack on narrow views (iPhone, slide-over) and a master-detail on wider views. Width of master column adjusts based on the size of the window (mimicking the size of Apple's NavigationView master column).

## Installation

### Swift Package Manager

1. File -> Swift Packages -> Add Package Dependency
2. Enter https://github.com/mattmaddux/SwiftUIMasterDetail


### Manual

Copy the following files to your project:
- MasterDetailView.swift


## Usage

Create your master and detail views separately. Make sure they can edit a bindable bool for showing/hiding the detail side when in stack mode.

```swift
import SwiftUI
import SwiftUIDevice

struct MasterView: View {
    
    @Binding var showingDetail: Bool
    
    var body: some View {
        VStack {
            Text("Master")
            Button(action: { self.showingDetail = true }) {
                Text("Select detail")
            }
        }.background(Color.red)
    }
    
}

struct DetailView: View {
    
    @Binding var showingDetail: Bool
    
    var body: some View {
        VStack {
            Text("Detail")
            Button(action: { self.showingDetail = false }) {
                Text("Remove detail")
            }
        }.background(Color.green)
    }
}
```

Use them to build your master-detail view.


```swift
import SwiftUI
import SwiftUIDevice


struct ContentView: View {
    
    @State var showingDetail: Bool = false
    
    var body: some View {
        MasterDetailView(showingDetail: $showingDetail,
                         master: { MasterView(showingDetail: self.$showingDetail) },
                         detail: { DetailView(showingDetail: self.$showingDetail) })
    }
    
}

```

### SPM Dependencies

- SwiftUIDevice - https://github.com/mattmaddux/SwiftUIDevice
