import SwiftUI

struct Chapter2View: View {
    
    @ObservedObject var footBallVM : FootBallTeamViewModel
    @State var didStartGame : Bool = false
    
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
                    Text("Let's Go Lions!")
                        .font(.system(size: 36, weight: .bold))
                    
                    Button(action: {
                        //footBallVM.generateTeam()
                        footBallVM.generateWinsAndLosses()
                        didStartGame = true
                    }) {
                        Text("Play Regular Season")
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black, radius: 8, y: 6)
                }
                
                ScrollView {
                    
                    if didStartGame  == true {
                        
                        
                        ForEach(footBallVM.teams) { game in
                            
                            VStack {
                                
                                Text("\(game.gameWeek)")
                                Text("\(game.opponentPlaying)")
                                
                                
                                if footBallVM.pointTotal > game.Score {
                                    Text("Great job, coach! You Won against the \(game.TeamName) !")
                                    
                                    
                                } else if footBallVM.pointTotal < game.Score {
                                    Text("Your team lost against the \(game.TeamName) , SOL!")
                                    
                                    
                                } else {
                                    Text("it's a tie...")
                                    
                                    
                                }
                                
                            }
                        }
                        
                        Text("Great job \(footBallVM.coachName)!!")
                        Text("You've made it through the regular season, now let's see how you made it to the play-offs!")
                        Text("You need to have at least 10 regualar season wins to make it.")
                        Text("You're ending season scores are")
                       
                        
                        Text("Total Wins")
                        Text("\(footBallVM.totalWins)")
                        
                        Text("Total Losses")
                        Text("\(footBallVM.totalLosses)")
                        
                        Text("Total Draws")
                        Text("\(footBallVM.totalDraws)")
                        
                        if footBallVM.totalWins >= 10 {
                            Text("You made it, you're moving on to the play-offs!")
                        }
                        
                        else {
                            Text("Better luck next season, looks like you're still the same old Lions")
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                if footBallVM.totalWins >= 10 {
                    
                    NavigationLink {
                        Chapter3View(footBallVM: footBallVM)
                    } label: {
                        Text("Go to Play-Off's")
                            .padding()
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black, radius: 8, y: 6)
                    
    
                    
                }
                
                if footBallVM.totalWins < 10 {
                    
                    NavigationLink {
                        Chapter1View2(footBallVM: footBallVM)
                    } label: {
                        Text("Start Over")
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
    Chapter2View(footBallVM: FootBallTeamViewModel())
}
