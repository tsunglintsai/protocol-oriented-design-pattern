//
//  main.swift
//  Decorator
//
//  Created by Henry on 4/6/17.
//  Copyright © 2017 Pyrogusto Inc. All rights reserved.
//

import Foundation

/*
 This pattern allows behavior to be added to an individual object, either statically or dynamically, 
 without affecting the behavior of other objects from the same class. also Known as Object composition
 */

protocol Coffee {
    var cost: Float { get }
    var ingredients: String { get }
}

protocol CoffeeDecorator: Coffee {
    var coffee: Coffee { get }
}

extension CoffeeDecorator {
    var cost: Float {
        return coffee.cost
    }
    var ingredients: String {
        return coffee.ingredients
    }
}

struct SimpleCoffee: Coffee {
    var cost: Float {
        return 1
    }
    var ingredients: String {
        return "Coffee"
    }
}

struct WithMilk: CoffeeDecorator {
    var coffee: Coffee
    init(_ coffee: Coffee) {
        self.coffee = coffee
    }
    var cost: Float {
        return coffee.cost + 0.5
    }
    var ingredients: String {
        return coffee.ingredients + "[Milk]"
    }
}

struct WithCream: CoffeeDecorator {
    var coffee: Coffee
    init(_ coffee: Coffee) {
        self.coffee = coffee
    }
    var cost: Float {
        return coffee.cost + 1.0
    }
    var ingredients: String {
        return coffee.ingredients + "[Cream]"
    }
}


var coffee: Coffee = SimpleCoffee()
coffee = WithCream(WithMilk(coffee))
print("cost: \(coffee.cost)")
print("ingredients:\(coffee.ingredients)")
