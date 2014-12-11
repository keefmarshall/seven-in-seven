% Consider a shopping list that looks like [{item, quantity, price}, ...]. Write a
% list comprehension that builds a list of items of the form [{item, total_price},
% ...], where total_price is quantity times price.

-module(day2p2).
-export([calc/1, sampleList/0]).

calc(Items) -> [{Item, Q * P} || {Item, Q, P} <- Items].

sampleList() -> [{laptop, 300, 2}, {mouse, 10, 1}, {trackpad, 30, 1}].
