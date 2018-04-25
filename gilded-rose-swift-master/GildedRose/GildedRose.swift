//
//  GildedRose.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public class GildedRose {
    public static func updateQualityOfItems(items: Array<Item>) -> [Item] {
        var updatedItems = [Item]()
        for item in items {
            var item = item
            switch (item.name) {
            case "Aged Brie" : item = updateAgedBrieItem(item: &item)
            case "Backstage passes to a TAFKAL80ETC concert" : item = updateBackstageItem(item: &item)
            case "Sulfuras, Hand of Ragnaros" : print("Do Nothing")
            case "Conjured Mana Cake" : item = updateConjuredItem(item: &item)
            default : item = updateGeneralItem(item: &item)
            }
            updatedItems.append(item)
        }
        return updatedItems
    }
    
    public static func updateAgedBrieItem( item:inout Item) -> Item {
        if item.sellIn <= 0 {
            item = updateItemQuality(item: &item, factor: 2)
        } else {
            item = updateItemQuality(item: &item, factor: 1)
        }
        
        item.sellIn = item.sellIn - 1
        return item
    }
    
    public static func updateBackstageItem( item:inout Item) -> Item {
        if(item.sellIn <= 0) {
            item.quality = 0
        }else if item.sellIn < 6 {
            item = updateItemQuality(item: &item, factor: 3)
        } else if item.sellIn < 11 {
            item = updateItemQuality(item: &item, factor: 2)
        }else {
            item = updateItemQuality(item: &item, factor: 1)
        }
        item.sellIn = item.sellIn - 1
        return item
    }
    
    public static func updateGeneralItem( item:inout Item) -> Item {
        if item.sellIn <= 0 {
            item = updateItemQuality(item: &item, factor: -2)
        } else {
            item = updateItemQuality(item: &item, factor: -1)
        }
        item.sellIn = item.sellIn - 1
        return item
    }
    
    public static func updateConjuredItem( item:inout Item) -> Item {
        if item.sellIn <= 0 {
            item = updateItemQuality(item: &item, factor: -4)
        } else {
            item = updateItemQuality(item: &item, factor: -2)
        }
        item.sellIn = item.sellIn - 1
        return item
    }
    
    public static func updateItemQuality( item:inout Item, factor: Int) -> Item{
        item.quality = item.quality + factor
        if(item.quality < 0) {
            item.quality = 0
        }
        if(item.quality > 50) {
            item.quality = 50
        }
        return item
    }
}
