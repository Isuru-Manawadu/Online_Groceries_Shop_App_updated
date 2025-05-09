

import SwiftUI

struct ExploreView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var explorVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var colums =  [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    
    var body: some View {
        ZStack{
            
            VStack{
                HStack{
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                    
                    Spacer()
                    
                    Text("Find Products")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                
                SearchTextField(placholder: "Search Store", txt: $txtSearch)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 4)
                
                ScrollView {
                    LazyVGrid(columns: colums, spacing: 20) {
                        ForEach(explorVM.listArr, id: \.id) {
                            cObj in
                            
                            NavigationLink(destination: ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: cObj) ) ) {
                                ExploreCategoryCell(cObj: cObj)
                                    .aspectRatio( 0.95, contentMode: .fill)
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
                
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ExploreView()
        }
        
    }
}
//explore view 
