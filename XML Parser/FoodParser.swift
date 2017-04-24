

//
//  FoodParser.swift
//  XML Parser
//
//  Created by Asif Ikbal on 4/20/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import Foundation


class FoodParser:XMLParser, XMLParserDelegate {
    
    var foodsArray: [Food] = []
    var foodObj:Food?
    var elementString:String = ""
    
    func parseData() -> [Food] {
        
        // set the delegate for parser
        self.delegate = self
        
        // start parsing
        self.parse()
        
        return foodsArray
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("parsing started")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("start element called \(elementName)")
        
        if elementName == "food" {
            foodObj = Food()
            
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("found Characters called", elementString)
        elementString += string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("Did end element called")
        
        if elementName == "name" {
            foodObj?.foodName = elementString
        } else if elementName == "price" {
            foodObj?.foodPrice = elementString
        } else if elementName == "description" {
            foodObj?.foodDescrition = elementString
        } else if elementName == "calories" {
            foodObj?.foodCaloris = Int(elementString)!
        }
        
        elementString = ""
        
        if elementName == "food"{
            foodsArray.append(foodObj!)
        }
        
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("parser did ending")
    }
    
    
}
