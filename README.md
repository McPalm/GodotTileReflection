# GodotTileReflection
A godot tool for smartly painting tiles based on geometry. Its just doing pattern mattching on one tilemap and then painting tiles upon another tilemap based on a set of rules.

Im really poor at explaining things so the guide here will be a work in progress.

that then piece together tilemaps based on geometry. Its designed to be mostly visual and very simple to use, its far more consistent then the build in tiles, but can be a little bit more complex to get into.

Basically, you generate a new set of rules using the AutoTileTemplate script

You set up a tileset to be ReadFrom, which you paint patterns of geometry on. And you set up a tileset to be Paint, and paint the desired output when there is matching geometry. You then press Dirty and the script will write on a ReflectionRuleSet resource.

When these rules are then used later in the ReflectionRulePainter, it will match and paint them in order they appear on the template you used to generate it, going left to right, and then top to bottom. Overwriting old rule matches.

Its a very lightweight project, you can open the scene in the ExampleAsset folder and figure out how its set up yourself.
