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
 
%%%%% ATOMIC: product
% Add the atomic propositions for product in this section
product(iphone_14_pro, apple, smart_phone, 1400, 4.5).
product(iphone14, apple, smart_phone, 1200, 4.7).
product(iphone13, apple, smart_phone, 1000, 4.0).
product(ipad_air, apple, tablet, 1300, 4.5).
product(ipad_pro, apple, tablet, 1400, 5.0).
product(macbook_air, apple, laptop, 1600, 5.0).
product(macbook_pro, apple, laptop, 1700, 4.5).
product(air_pods, apple, accessories, 200, 4.5).

product(dell_mon_1, dell, monitor, 400, 2.0).
product(dell_mon_2, dell, monitor, 500, 4.5).

product(zfold4, samsung, smart_phone, 2500, 4.5).
product(zflip4, samsung, smart_phone, 1400, 4.5).
product(s22_ultra, samsung, smart_phone, 1800, 4.0).
product(galaxy_tab_s8, samsung, tablet, 1400, 5.0).
product(galaxy_tab_s6_lite, samsung, tablet, 500, 3.5).
product(galaxy_watch_5, samsung, smart_watch, 400, 4.0).
product(galaxy_buds_2_pro, samsung, accessories, 10, 3.9).
product(galaxy_buds_2, samsung, accessories, 5, 3.1).
product(hdmi_cable, samsung, cable, 15, 4.0).
product(galaxy_tab_10, samsung, tablet, 200, 3.5).
product(galaxy_tab_11, samsung, tablet, 200, 4.5).
product(galaxy_book_2_pro_360, samsung, laptop, 1400, 2.7).
product(galaxy_book_2_360, samsung, laptop, 400, 4.0).
product(zflip3, samsung, smart_phone, 400, 1.5).

product(hdmi_cable_1, rocketfish, cable, 20, 1.0).
product(hdmi_cable_2, rocketfish, cable, 10, 2.5).
 
%%%%%  ATOMIC: inStock
% Add the atomic propositions for inStock in this section
inStock(iphone_14_pro, best_buy, 10).
inStock(iPhone14, best_buy, 15).
inStock(iPhone13, best_buy, 0).
inStock(ipad_air, best_buy, 25).
inStock(ipad_air, eaton_centre_computer_shack, 25).
inStock(ipad_pro, best_buy, 30).
inStock(ipad_pro, eaton_centre_computer_shack, 30).
inStock(macbook_pro, montreal_computer_shack, 40).
inStock(macbook_air, eaton_centre_computer_shack, 10).
inStock(macbook_air, future_shop, 30).
inStock(macbook_air, square_one_computer_shack, 15).
inStock(macbook_pro, computer_shack, 15).
inStock(air_pods, eaton_centre_computer_shack, 0).
inStock(macbook_air, montreal_computer_shack, 30).

inStock(dell_mon_1, best_buy, 5).
inStock(dell_mon_2, eaton_centre_computer_shack, 0).
 
inStock(zfold4, computer_shack, 25).
inStock(zflip4, montreal_computer_shack, 30).
inStock(s22_ultra, future_shop, 10).
inStock(galaxy_tab_s8, future_shop, 15).
inStock(galaxy_tab_s6_lite, future_shop, 0).
inStock(galaxy_watch_5, future_shop, 25).
inStock(galaxy_buds_2_pro, future_shop, 30).
inStock(galaxy_buds_2, future_shop, 0).
inStock(galaxy_tab_10, square_one_computer_shack, 10).
inStock(galaxy_tab_10, montreal_computer_shack, 10).
inStock(galaxy_tab_11, montreal_computer_shack, 10).
inStock(galaxy_book_2_pro_360, square_one_computer_shack, 5).
inStock(galaxy_book_2_pro_360, future_shop, 5).
inStock(galaxy_book_2_pro_360, computer_shack, 5).
inStock(galaxy_book_2_360, future_shop, 9).
inStock(galaxy_book_2_360, eaton_centre_computer_shack, 9).
inStock(galaxy_book_2_360, best_buy, 9).
inStock(zflip3, best_buy, 20).

inStock(hdmi_cable, future_shop, 10).
inStock(hdmi_cable_1, eaton_centre_computer_shack, 5).
inStock(hdmi_cable_2, eaton_centre_computer_shack, 5).
 
%%%%% ATOMIC: location
% Add the atomic propositions for location in this section
location(best_buy, boston).
location(best_buy, toronto).
location(best_buy, calgary).
location(best_buy, ottawa).
location(best_buy, new_york).
location(computer_shack, new_york).
location(computer_shack, boston).
location(eaton_centre_computer_shack, toronto).
location(montreal_computer_shack, montreal).
location(future_shop, boston).
location(future_shop, toronto).
location(future_shop, calgary).
location(future_shop, ottawa).
location(future_shop, new_york).
location(future_shop, montreal).
location(square_one_computer_shack, mississauga).
 
%%%%% ATOMIC: canShip
% Add the atomic propositions for canShip in this section
canShip(iphone_14_pro, calgary).
canShip(iphone14, new_york).
canShip(iphone13, toronto).
canShip(ipad_air, boston).
canShip(ipad_air, mississauga).
canShip(ipad_pro, ottawa).
canShip(macbook_air, calgary).
canShip(macbook_air, ottawa).
canShip(macbook_air, toronto).
canShip(macbook_pro, new_york).
canShip(macbook_pro, mississauga).
canShip(air_pods, toronto).

canShip(dell_mon_1, toronto).
canShip(dell_mon_2, toronto).

canShip(zfold4, boston).
canShip(zflip4, ottawa).
canShip(s22_ultra, calgary).
canShip(galaxy_tab_s8, new_york).
canShip(galaxy_tab_s6_lite, toronto).
canShip(galaxy_watch_5, boston).
canShip(galaxy_buds_2_pro, ottawa).
canShip(galaxy_buds_2, ottawa).
canShip(hdmi_cable, montreal).
canShip(galaxy_tab_10, mississauga).
canShip(galaxy_tab_11, mississauga).
canShip(zflip3, toronto).
canShip(galaxy_book_2_pro_360, mississauga).

 
%%%%% LEXICON
% Add the lexicon to this section
% product(ProductName, Manufacturer, Type, Price, Rating)
% inStock(ProductName, StoreName, Count) 
% location(StoreName, City)
% canShip(ProductName, City)

article(a). article(an). article(any). article(the). 

common_noun(laptop, X) :- product(X, _, laptop, _, _).
common_noun(stock, X) :- inStock(_, _, X).
common_noun(rating, X) :- product(_, _, _, _, X).
common_noun(tablet,X) :- product(X, _, tablet, _, _).
common_noun(ipad,X) :- product(X, apple, tablet, _, _).
common_noun(hdmi_cable, X) :- product(X, _, cable, _, _).
common_noun(hdmi_cord, X) :- product(X, _, cable, _, _).
common_noun(city, X) :- proper_noun(city), X is city.
common_noun(monitor, X) :- product(X, _, monitor, _, _).
common_noun(smart_phone, X) :- product(X, _, smart_phone, _, _).
common_noun(accessories, X) :- product(X, _, accessories, _, _).
common_noun(smart_watch, X) :- product(X, _, smart_watch, _, _).
common_noun(store, X) :- location(X, _).
common_noun(price, X) :- product(_, _, _, X, _).
common_noun(brand, X) :- product(_, X, _, _, _).


preposition(with, X, Y) :- preposition(in, X, Y). 
preposition(in, X, Y) :- inStock(Y, X, _).
preposition(in, X, Y) :- inStock(X, Y, Z), Z > 0.
preposition(in, X, Y) :- location(X, Y).
preposition(at, X, Y) :- inStock(X, Y, Z), Z > 0.
preposition(at, X, Y) :- location(X, Y).
preposition(that_can_ship_to, X, Y) :- canShip(X, Y).
preposition(of, X, Y) :- product(Y, X, _, _, _).
preposition(of, X, Y) :- product(Y, _, _, _, X).
preposition(of, X, Y) :- product(Y, _, _, X, _).
preposition(of, X, Y) :- inStock(Y, _, X).

proper_noun(X) :- not article(X), not adjective(X,_), not common_noun(X,_), not preposition(X,_,_). 

adjective(apple, X) :- product(X, apple, _, _, _).
adjective(samsung, X) :- product(X, samsung, _, _, _).
adjective(dell, X) :- product(X, dell, _, _, _).
adjective(rocketfish, X) :- product(X, rocketfish, _, _, _).
adjective(highly_rated, X) :- product(X, _, _, _, R), R >= 4.0.
adjective(good, X) :- adjective(highly_rated, X).
adjective(medium_rated, X) :- product(X, _, _, _, R), R >= 2.5, R < 4.0 .
adjective(decent, X) :- adjective(medium_rated, X).
adjective(lowly_rated, X) :- product(X, _, _, _, R), R < 2.5.
adjective(expensive, X) :- product(X, _, _, P, _), P > 1000.
adjective(cheap, X) :- product(X, _, _, P, _), P =< 200.
adjective(most_expensive, X) :- product(X, B, T, Price1, _), not (product(_, B, T, Price2, _), Price1 < Price2).
adjective(cheapest, X) :- product(X, B, T, Price1, _), not (product(_, B, T, Price2, _), Price1 > Price2).
adjective(best, X) :- product(X, B, T, _, R1), not (product(_, B, T, _, R2), R1 < R2).

%%%%% EXTRA LANGUAGE FEATURES
% Put the extra language features for question 4 in this section
 
 
%%%%% PARSER
what(Words, Ref) :- np(Words, Ref).
 
/* Noun phrase can be a proper name or can start with an article */
 
np([Name],Name) :- proper_noun(Name).
np([Art|Rest], What) :- article(Art), np2(Rest, What).
 
 
/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */
 
np2([Adj|Rest],What) :- adjective(Adj,What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).
 
 
/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */
 
mods([], _).
mods([in, the, stock | Rest], What) :- mods(Rest, What).
mods([in, stock | Rest], What) :- mods(Rest, What).
mods(Words, What) :-
    not Words = [in, the, stock | _], not Words = [in, stock | _],
    appendLists(Start, End, Words),
    prepPhrase(Start, What),    mods(End, What).
 
prepPhrase([Prep|Rest], What) :-
   preposition(Prep, What, Ref), np(Rest, Ref).
 
appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).
 
%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
 
 
 
 

