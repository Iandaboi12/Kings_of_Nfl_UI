import SwiftUI


struct Chapter1View: View {
    
    @StateObject var footBallVm : FootBallTeamViewModel = FootBallTeamViewModel()
    
    var body: some View {
       // Text("Chapter 1")
        
        ZStack {
            Image("Field")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 1000)
                .ignoresSafeArea()
                .blur(radius: 3.0)
                
            VStack {
                Text("Welcome to the")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                Text("2023 - 2024 Lions")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                Text("NFL Season")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                   // .padding(.bottom, 350)
                
                
                    Text("Please Enter Your Name")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                TextField("Name Here", text: $footBallVm.coachName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                NavigationLink {
                    Chapter1View2(footBallVM: footBallVm)
                } label: {
                    Text("Build Your Team")
                        .padding()
                        .foregroundColor(.black)
                        .background(.gray)
                        .cornerRadius(10)
                }
                .shadow(color: .black, radius: 8, y: 6)
                .padding(.bottom, 250)
                
            }
        }
    }
}

#Preview {
    Chapter1View()
}
