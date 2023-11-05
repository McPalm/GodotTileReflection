# GodotTileReflection
A godot tool for smartly painting tiles based on geometry. Its just doing pattern mattching on one tilemap and then painting tiles upon another tilemap based on a set of rules.

Im really poor at explaining things so the guide here will be a work in progress.

that then piece together tilemaps based on geometry. Its designed to be mostly visual and very simple to use, its far more consistent then the build in tiles, but can be a little bit more complex to get into.

A ruleset looks like this when its build, it consist of two tilemaps.
![Example Ruleset](/media/Ruleset.png)

A Read From layer, that is the pattern in the level geometry we are looking for to match.

![Example Ruleset](/media/Pattern.png)

And you pain the desired outcome in the Pain tilemap.

![Example Ruleset](/media/Output.png)

You then just hit the dirty button on the AutoTileTemplate and it will generate a ruleset and write it on the ReflectionTileRuleSet resource given to 
