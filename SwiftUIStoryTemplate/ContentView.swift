import SwiftUI

// Use the relevant folders and swift files to code your chapter of the story. Keep ContentView as-is, unless you want a different type of navigation in your story.
struct ContentView: View {
    
  
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                LinearGradient(colors:[Color("LionsSilver"), Color("HB")], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack{
                        ZStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                        }
                        Text("Kings of the NFL")
                            .font(.largeTitle)
                        Text("Pro Performers")
                    }
                    Spacer()
                    
                    NavigationLink {
                        Chapter1View()
                    } label: {
                        Text("Start Story")
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black, radius: 8, y: 6)
                    Spacer()
                }
            }

        }
        .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
