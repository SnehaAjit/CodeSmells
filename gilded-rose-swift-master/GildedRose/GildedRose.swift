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
                case Constants.agedBrie : updateAgedBrieItem(item: &item)
                case Constants.concertBackstage : updateBackstageItem(item: &item)
                case Constants.conjuredItem : updateConjuredItem(item: &item)
                default : updateGeneralItem(item: &item)
            }
            if item.name != Constants.sulfuras {
              updateSellinForItem(item: &item)
            }
            updatedItems.append(item)
        }
        return updatedItems
    }
    
    public static func updateAgedBrieItem( item:inout Item){
        if item.sellIn <= 0 {
            updateItemQuality(item: &item, factor: 2)
        } else {
            updateItemQuality(item: &item, factor: 1)
        }
    }
    
    public static func updateBackstageItem( item:inout Item) {
        if(item.sellIn <= 0) {
            item.quality = 0
        }else if item.sellIn < 6 {
            updateItemQuality(item: &item, factor: 3)
        } else if item.sellIn < 11 {
            updateItemQuality(item: &item, factor: 2)
        }else {
            updateItemQuality(item: &item, factor: 1)
        }
    }
    
    public static func updateGeneralItem( item:inout Item) {
        if(item.name != Constants.sulfuras) {
            if item.sellIn <= 0 {
                updateItemQuality(item: &item, factor: -2)
            } else {
                updateItemQuality(item: &item, factor: -1)
            }
        }
    }
    
    public static func updateConjuredItem( item:inout Item) {
        if item.sellIn <= 0 {
           updateItemQuality(item: &item, factor: -4)
        } else {
           updateItemQuality(item: &item, factor: -2)
        }
      
    }
    
    public static func updateItemQuality( item:inout Item, factor: Int) {
        item.quality = item.quality + factor
        if(item.quality < 0) {
            item.quality = 0
        }
        if(item.quality > 50) {
            item.quality = 50
        }
    }
    
    public static func updateSellinForItem(item:inout Item) {
         item.sellIn = item.sellIn - 1
    }
}
