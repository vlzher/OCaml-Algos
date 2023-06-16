## OCaml

### `llist` type

The `llist` type represents a lazy list, which is a potentially infinite sequence of elements. It is defined as follows:

```ocaml
type 'a llist = LNil | LCons of 'a * (unit -> 'a llist)
```

- `LNil` represents an empty lazy list.
- `LCons (x, tl)` represents a lazy list with the head element `x` and a thunk `tl` that lazily computes the tail of the list.

### `toLazyList` function

The `toLazyList` function converts a regular list (`'a list`) into a lazy list (`'a llist`) by recursively transforming each element of the list into a thunk.

```ocaml
val toLazyList : 'a list -> 'a llist
```

- Parameters:
  - `l` - The input list to be converted into a lazy list.
- Returns: A lazy list (`'a llist`) representing the same sequence of elements as the input list.

### `length` function

The `length` function calculates the length of a lazy list.

```ocaml
val length : 'a llist -> int
```

- Parameters:
  - `l` - The lazy list for which to compute the length.
- Returns: The number of elements in the lazy list.

### `filterByLength` function

The `filterByLength` function filters a lazy list based on the length of its elements.

```ocaml
val filterByLength : 'a llist -> int -> 'a llist
```

- Parameters:
  - `llist` - The lazy list to be filtered.
  - `n` - The maximum length of elements to include in the filtered list.
- Returns: A new lazy list that contains only the elements from the input list whose length is less than or equal to `n`.

### Example usage:

```ocaml
let arr = toLazyList ['a'; 'b'; 'c']
let arr1 = toLazyList [2; 3]
let arr2 = toLazyList [5.0; 6.0]
let arrFinal = toLazyList [arr; arr1; arr2]

filterByLength arrFinal 3
```

This example demonstrates the usage of the provided functions to create and filter a lazy list. The resulting lazy list will contain only the elements that have a length less than or equal to 3.

### Additional Functions

The provided code includes a few additional functions that are not explicitly described in the comments. Here is a brief overview of those functions:

- `ltake (n, lxs)` - This function takes the first `n` elements from a lazy list and returns them as a regular list.
- `lfrom k` - This function generates an infinite lazy list starting from the value `k` and incrementing by 1 for each subsequent element.
- `getHeadValue llist` - This function returns the value of the head element of a lazy list.
- `lpowiel1 (llist, n)` - This function creates a new lazy list by repeating the original lazy list `n` times.
- `lpowiel (llist)` - This function creates a new lazy list by repeating the original lazy list a number of times equal to the value of the head element of the list.
- `odwroc l` - This function reverses a regular list.
- `sumProdd xs` - This function calculates the sum and product of a list of numbers using `List.fold_left`.
- `insertSort xs f` - This function sorts a list using the insertion sort algorithm.
- `merge

Sort xs f` - This function sorts a list using the merge sort algorithm.
- `eval l` - This function evaluates a list of instructions, where each instruction represents a mathematical operation. The function uses a stack (`tstack`) to perform the calculations.
