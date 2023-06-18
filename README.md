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
# Codable 
        /**
         - JSONEncoder -> converts swift objects(class and struct) or Values(disctionary, array etc) into JSON data format
         - .encode -> when you call this method you pass in the swift object/value that you want to encode as a param. this will return a "DATA" object(bytes) containing a
         JSON representation of the encoded data.
         **********************************************************************
         JSONSerialization - converts JSON data to and from Swift objects ie(JSON to  Swift objects and Swift objects  to JSON data).
         - JSON to  Swift objects -> we use JSONSerialization.jsonObject(with: data,options: <#T##JSONSerialization.ReadingOptions#>) --- method to deserialize the JSON data into swift values such as Array, Dict and returns an optional "Any" object representing deserialized JSON.
         - You need to cast the returned object ANY, to whatever swift value you want
         - Swift objects  to JSON data -> use JSONSerialization.data(withJSONObject: <#T##Any#>,options: <#T##JSONSerialization.WritingOptions#>) -- to serialize the swift object into jsondata
         the serialized JSON data can be obtained as data wich can be converted into a string.
         ************
         use JSONSerialization when you want the output  to be of specific   swift object/value eg dict etc
         //NB: JSONSerialization is a two way ie can converts JSON data to and from Swift objects using jsonObject and data respectively
         use JSONEncoder to convert swift object to JSON DATA
         use JSONDEcoder to convert JSON DATAs to swift object
         */
         
#Bottom navigation view by use of TabView
            TabView{
                HomeView()
                    .tabItem(){
                        Label("Home", systemImage: "house")
                    }
                    }
