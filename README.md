layoutmanager-kerning-bug
=========================

Sample Code I put together while filing Radar #15154377 (http://openradar.appspot.com/radar?id=5272939939233792)

The issue is that the `boundingRectForGlyphRange:inTextContainer:` in `NSLayoutManager` is not returning the correct bounding ranges when there is kerning applied by the font.

![Screenshot](http://f.cl.ly/items/0q02442t3W3g120c2V3p/Screen%20Shot%202013-10-04%20at%2012.20.30%20PM.png)
