//
//  DestinationSearchView.swift
//  AirBnb
//
//  Created by Shravak Jain on 26/10/24.
//

import SwiftUI
enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest = 0
    @ObservedObject var viewModel : ExploreViewModel
    
    
    var body: some View {
        VStack{
            
            HStack {
                Button{
                    withAnimation(.snappy){
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                    
                } label:{
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty{
                    Button("Clear"){
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                }
            }
            .padding()
            VStack(alignment: .leading){
                if selectedOption == .location{
                    Text("Where To ?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                        TextField("Search destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }
                else{
                    CollapsedPickerView(tittle: "Where", description: "Add description")
                }
    
               
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
        
            
            
            //date selection view
            
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("When's your trip ?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                else{
                    CollapsedPickerView(tittle: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
            
            //num guest view
            
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuest) Adults")
                    } onIncrement: {
                        numGuest += 1
                    } onDecrement: {
                        guard numGuest > 0 else { return }
                        numGuest -= 1
                    }
                }
                else{
                    CollapsedPickerView(tittle: "Who", description: "Add guests")
                }
            }
                .modifier(CollapsibleDestinationViewModifier())
                .frame(height: selectedOption == .guests ? 120 : 64)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .guests
                    }
                }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}
struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
    }
}
struct CollapsedPickerView: View {
    let tittle :String
    let description : String
    var body: some View {
        VStack{
            HStack{
                Text(tittle)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
