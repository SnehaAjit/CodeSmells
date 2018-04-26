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
            updatedItems.append(item)
        }
        return updatedItems
    }
    
    public static func updateAgedBrieItem( item:inout Item){
        item.sellIn <= 0 ?  updateItemQualityAndSellin(item: &item, factor: 2) : updateItemQualityAndSellin(item: &item, factor: 1)
    }
    
    public static func updateBackstageItem( item:inout Item) {
        if(item.sellIn <= 0) {
            item.quality = 0
            updateSellinForItem(item: &item)
        }else if item.sellIn < 6 {
            updateItemQualityAndSellin(item: &item, factor: 3)
        } else if item.sellIn < 11 {
            updateItemQualityAndSellin(item: &item, factor: 2)
        }else {
            updateItemQualityAndSellin(item: &item, factor: 1)
        }
    }
    
    public static func updateGeneralItem( item:inout Item) {
        if(item.name != Constants.sulfuras) {
            item.sellIn <= 0 ?  updateItemQualityAndSellin(item: &item, factor: -2) :  updateItemQualityAndSellin(item: &item, factor: -1)
        }
    }
    
    public static func updateConjuredItem( item:inout Item) {
         item.sellIn <= 0 ?  updateItemQualityAndSellin(item: &item, factor: -4) :  updateItemQualityAndSellin(item: &item, factor: -2)
    }
    
    public static func updateItemQualityAndSellin( item:inout Item, factor: Int) {
        item.quality = item.quality + factor
        if(item.quality < 0) {
            item.quality = 0
        }
        if(item.quality > 50) {
            item.quality = 50
        }
        updateSellinForItem(item: &item)
    }
    
    public static func updateSellinForItem(item:inout Item) {
         item.sellIn = item.sellIn - 1
    }
}
