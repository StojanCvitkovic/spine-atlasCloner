# spine-atlasCloner
A tool for atlas creation for each individual .json file exported from Spine

Each Spine element must have a .json and .atlas file of the same name. Duplicating and renaming the .atlas file is necessary for each .json file, if the atlases are combined into one.
Sometimes there can be dozens of .json files exported from Spine, so in order to bypass duplicating and renaming, this little tool was created to do it for you.
Also it edits the .atlas file to point to the corresponding texture image, if you have changed it's name.

How to use:
-Clone/download spine-atlasCloner project locally
-Navigate to \Atlas Cloner\bin\Debug\ and open Atlas Cloner.exe
-Enter the path where the exported files are located
