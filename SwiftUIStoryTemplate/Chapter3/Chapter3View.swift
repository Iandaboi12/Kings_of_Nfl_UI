import SwiftUI

struct Chapter3View: View {
    
    @ObservedObject var footBallVM : FootBallTeamViewModel
    @State var playoffResults = """
    """
    @State var didStartPlayOffs : Bool = false
    
    var body: some View {
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
                    Text("Let's go, \(footBallVM.coachName)!")
                        .font(.system(size: 28, weight: .bold))
                    Text("Let's take the Lions")
                        .font(.system(size: 28, weight: .bold))
                    Text("to the Superbowl!")
                        .font(.system(size: 28, weight: .bold))
                    Button(action: {
//                        footBallVM.generateTeam()
//                        footBallVM.generateWinsAndLosses()
                        didStartPlayOffs = true
                        playoffResults = footBallVM.playOffGames()
                    }) {
                        Text("Start Play-Off's")
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black, radius: 8, y: 6)
                
                }
            
                
                ScrollView {
                    
                    if didStartPlayOffs  == true {
                        
                       
                        Text(playoffResults)
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        ContentView()
                    } label: {
                        Text("Play Again")
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black, radius: 8, y: 6)
        
                    
                }
            
            }
        }
    }
}

#Preview {
    Chapter3View(footBallVM: FootBallTeamViewModel())
}
