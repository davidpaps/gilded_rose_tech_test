# Gilded Rose Refactoring Kata

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). 


__Specification:__

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.


__Describe your Approach and Structure:__

For this kata i first played around with the legacy code in irb. I then established the conditions to which each item were bound to. I then wrote extensive feature tests to cover all the scenarios and edge cases of the reqirement. Once i had good test coverage 0and passing tets, i then slowly refctored each item into its own method., I then, one at a time, managed to substitue in the code, whilst commenting out those portions of the legacy code. I did this until each item had a single method to update, and the update_quality method in the GildedRose class had a simple loop iterating over the items, which would call on the corrosponding ethods (which were also refactored out to make DRY).

As a final refactor step, I then made a class for each item, to apply the SRP rule and extracted each item to be called on via it's class method. All of the above steps were completed whilst keeping the tests green and passing.


__Describe how to run the app and tests:__

In order to run this code, one can clone the repo, visit the directory, run a repl, and then enter the following commands:

```
require './lib/gilded_rose'
require './lib/items'
gilded_rose = GildedRose.new([Item.new("Item Name", 10, 10)])
gilded_rose.update_quality
```

```
Item Name can be:
+5 Dexterity Vest
Aged Brie
Backstage Passes to a TAFKAL80ETC concert
Conjured Mana Cake
Elixir of the Mongoose
Sulfuras, Hand of Ragnaros
```

The item will then degrade/improve in quality as per each induvidual requirement.

In order to run the testing suite, RSPEC, open up the project directory in the terminal, and type in 'rspec'. This will display the tests, and test coverage (22 tests - 100% coverage).



