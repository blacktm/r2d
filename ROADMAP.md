# Roadmap

_Road to v0.1.0_

- Add `Triangle` class
- Add `Image` class
- Add `Text` class
- Add `Line` class
- Add documentation for `Quad` class
- Add gradients support `Triangle`, and `Quad`
- Add `Song` class
  - A song is a long audio clip not kept in memory
- Add `Sound` class
  - A sound is a short audio clip which stays resident in memory for fast replaying

<!--
- `Image#animate_with`
  ```ruby
  ( ["a.jpg", "b.jpg"], millisecs)

  img.pause
  img.resume
  # returns bool
  ```
- `#on_click(&block)` for For `Rectangle` and `Image`
- `Line#intersects?` (intersecting lines?)
- `Window#key_up` and helper
- `Shape#gradient`
- `Window#width, #height`
- `Shape#contains_pt?(x, y)`
  ```ruby
  (x.min..x.max) == pt
  &&
  (y.min..y.max) == pt
  ```
- `Shape#intersects?`
  ```ruby
  # Example:
  s.intersects? r

  # Implementation:
  r1.contains? r2.pt1
  r1.contains? r2.pt2
  # etc
  r2.contains? r1.pt1
  # etc

  # See D3 implementation.
  ```
-->
