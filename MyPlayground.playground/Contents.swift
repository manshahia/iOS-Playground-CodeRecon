//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var toDoArray = [String] ()

//While Loop
while(count < number) { }
//If construct
if number % count == 0 { }

//Function with one parameter
func checkIfIsPrime(number : Int) -> Bool { }

//Generate Random Number
return Int(arc4random_uniform(6) + 1)


//Fetch User defaults array
if let todosObjectArray = UserDefaults.standard.object(forKey: "todoArray") as? [String]
//Set UserDefaults array
UserDefaults.standard.set(toDoArray, forKey: "todoArray")

//Timer
timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
{
    timer in
    self.updateTime(time: -1 )
    
    
    print("Timer countdown \(self.time)")
    
    if self.time <= 0
    {
        self.timer.invalidate()
    }
}

//Keyboard control
//set keyboard delegate
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    cityTextField.resignFirstResponder()
    return true
}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
}

//Create Cell
let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
cell.textLabel?.text = toDoArray[indexPath.row]
return cell



//Get data api and string utility methods
func findOutWeather( api : String)
{
    var message : String = "Unable to fetch data for your city."
    let url = URL(string: api)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let error = error
        {
            print("Client Error: ", error)
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
            else
        {
            print("Server error::", response as Any)
            return
        }
        
        if let mimeType = httpResponse.mimeType,
            mimeType == "text/html",
            let data = data,
            let stringData = String( data: data, encoding: .utf8)
        {
            let firstSeparation = stringData.components(separatedBy: self.stringToLookFor)
            if firstSeparation.count > 0 {
                let secondSeparation = firstSeparation[1].components(separatedBy: "</span>")
                if(secondSeparation.count > 0)
                {
                    message = secondSeparation[0].replacingOccurrences(of: "&deg;", with: "°")
                }
            }
            
            
            
            //                print("Weather is :  ", replaceHTMLElementsWithSigns)
            
            
            DispatchQueue.main.async(execute: {
                self.resultLabel.text = message
            })
        }
    }
    task.resume()
}
