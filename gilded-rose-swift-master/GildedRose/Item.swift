//
//  Item.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public struct Item: Equatable {
    var name: String 
    var sellIn: Int //Denotes number of days we have, to sell the item
    var quality: Int //Denotes how valuable the item is
}

public func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name && lhs.sellIn == rhs.sellIn && lhs.quality == rhs.quality
}
