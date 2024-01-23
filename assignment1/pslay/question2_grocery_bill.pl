% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Jason Quantrill
%%%%% NAME: Laura Jamikeshova
%%%%% NAME: Patrick Santoso Lay
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC: cost
% Add the atomic propositions for cost in this section
cost(bread,2).
cost(lettuce,1).
cost(apple,1.50).
cost(chocolate_bar,2.50).
cost(ginger_ale,1.75).

%%%%%  ATOMIC: twoForOneSale
% Add the atomic propositions for twoForOneSale in this section
twoForOneSale(apple).
twoForOneSale(ginger_ale).

%%%%% ATOMIC: taxable
% Add the atomic propositions for taxable in this section
taxable(ginger_ale).
taxable(chocolate_bar).

%%%%% ATOMIC: numPurchased
% Add the atomic propositions for numPurchased in this section
numPurchased(bread,2).
numPurchased(lettuce,3).
numPurchased(apple,7).
numPurchased(chocolate_bar,5).
numPurchased(ginger_ale,2).

%%%%% ATOMIC: taxRate
% Add the atomic propositions for taxRate in this section
taxRate(0.13).

%%%%% RULE: costAfterTax
% Add the rule(s) for costAfterTax in this section
costAfterTax(Item, AfterTax):-taxable(Item), cost(Item, Price), taxRate(TaxRate), AfterTax is Price * (1 + TaxRate).
costAfterTax(Item, AfterTax):-not taxable(Item), cost(Item, Price), AfterTax is Price.

%%%%% RULE: costAfterTaxAndSale
% Add the rule(s) for costAfterTaxAndSale in this section
costAfterTaxAndSale(Item, AfterSaleAndTax) :- twoForOneSale(Item), costAfterTax(Item, AfterTax), AfterSaleAndTax is (numPurchased(Item) // 2 + numPurchased(Item) mod 2) * AfterTax. 
costAfterTaxAndSale(Item, AfterSaleAndTax) :- not twoForOneSale(Item), costAfterTax(Item, AfterTax), AfterSaleAndTax is numPurchased(Item) * AfterTax.


%%%%% RULE: totalCost
%  Add the rule(s) for totalCost in this section
totalCost(Cost) :- costAfterTaxAndSale(bread, P1), costAfterTaxAndSale(lettuce, P2), costAfterTaxAndSale(apple, P3), costAfterTaxAndSale(ginger_ale, P4), costAfterTaxAndSale(chocolate_bar, P5), Cost is P1 + P2 + P3 + P4 + P5.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
