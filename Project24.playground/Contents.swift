import UIKit

let name = "André"

for letter in name {
//    print("give me a \(letter)!")
}

//reads the fourth character of the string
let letter = name[name.index(name.startIndex, offsetBy: 3)]

extension String {
    //special method that reads intervals between arrays and strings
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

//possible because of the extension
let letter2 = name[3]

let password = "123456"
password.hasPrefix("123")
password.hasSuffix("456")

extension String {
    
    //remove a sufix if it exists
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    // remove a suffix if it exists
        func deletingSuffix(_ suffix: String) -> String {
            guard self.hasSuffix(suffix) else { return self }
            return String(self.dropLast(suffix.count))
        }
}

password.deletingPrefix("123")

let weather = "it's going to rain"
//give capital letters to the firs letter of every word
let weatherCapitalized = weather.capitalized

extension String {
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        //make the first letter uppercased and append the rest normally
        return firstLetter.uppercased() + self.dropFirst()
    }
}

weather.capitalizedFirst // It's going to rain

//takes a string parameter and returns a boolean depending on whether that parameter exists in the string
let input = "Swift is like Objective-C without the C"
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

extension String {
    //read whats inside an array and returns a boolean
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }

        return false
    }
}
//see if theres the same string inside of the array
input.containsAny(of: languages)

//a function inside the other to see if theres the same string and returns a boolean
languages.contains(where: input.contains)

let string = "This is a test string"
//like css, adds formatting into a String using a dictionary
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

//let attributedString = NSAttributedString(string: string, attributes: attributes)

//an attributed string that you can modify
let attributedString = NSMutableAttributedString(string: string)
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))

extension String {
    
//Challenge 1: Create a String extension that adds a withPrefix() method. If the string already contains the prefix it should return itself; if it doesn’t contain the prefix, it should return itself with the prefix added.
    func withPrefix(_ prefix: String) -> String {
        if self.contains(prefix) { return self } else { return prefix + self}
    }
//Challenge 2: Create a String extension that adds an isNumeric property that returns true if the string holds any sort of number.
    func isNumeric() -> Bool{
        if Double(self) == nil {
            return false
        } else {
            return true
        }
    }
// Challenge 3: 3. Create a String extension that adds a lines property that returns an array of all the lines in a string. So, “this\nis\na\ntest” should return an array with four elements.
    var addLines: [String.SubSequence] { self.split(separator: "\n") }
}

var pet = "pet"
var carpet = pet.withPrefix("car")
print(carpet)

var numberString = "123123"
if numberString.isNumeric() {
    print("has numbers inside")
} else {
    print("doesn't have numbers inside")
}

var addLinesTest = "this\nis\na\ntest"
print(addLinesTest.addLines)
