#  Firebase Firestore for Storage aka DB
# Firebase Auth
# UI
1.  HStack positions views in a horizontal line, VStack positions them in a vertical line, and ZStack overlays views on top of one another.

2. @State property- makes the view dependent on the state of name, so whenever the text value of name changes, the view is updated to show that change. it is meant to hold value types such as Bools, Integers, Strings, structs and so on. and not instances of classes.
    - SwiftUI use “@State” to allow you to modify values inside a struct, which would normally not be allowed because structs are value types. While Views are volatile. State is a persistent storage created by SwiftUI on your view's behalf.
    
3. ObservableObject protocol is used to create observable objects that can be used to store and manage state in your views. It is part of the Combine framework, which provides a reactive programming paradigm for handling asynchronous events and data streams.
    -To use ObservableObject, you need to create a custom class or structure that conforms to the protocol. 
    -To observe an ObservableObject, you can use the 
        a.@StateObject - - the instance of the ViewModel will be kept and reused even after a view is discarded and redrawn.
        b.@ObservedObject - When a view creates its own @ObservedObject instance it is recreated every time a view is discarded and redrawn:
        c.@EnvironmentObject to inject an observable object at the environment level, making it accessible to multiple views.
        
  # Summing up the differences
         - Use @State for simple properties that belong to a single view. They should usually be marked private.
         - Use @ObservedObject for complex properties that might belong to several views. Most times you’re using a reference type you should be using @ObservedObject for it.
         -   Use @StateObject once for each observable object you use, in whichever part of your code is responsible for creating it.
         -   Use @EnvironmentObject for properties that were created elsewhere in the app, such as shared data.
