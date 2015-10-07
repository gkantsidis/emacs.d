"Initialize Image Building"
MCCacheRepository instVarNamed: 'default' put: nil.
Deprecation raiseWarning: false.
!
"TextLint Prerequisites"
Gofer new
        renggli: 'Glamour';
        version: 'Glamour-Announcements-TudorGirba.6';
        version: 'Glamour-Browsers-TudorGirba.90';
        version: 'Glamour-Core-TudorGirba.221';
        version: 'Glamour-Helpers-TudorGirba.32';
        version: 'Glamour-Morphic-Renderer-TudorGirba.139';
        version: 'Glamour-Morphic-Theme-TudorGirba.55';
        version: 'Glamour-Morphic-Widgets-TudorGirba.31';
        version: 'Glamour-Presentations-TudorGirba.109';
        version: 'Glamour-Tools-TudorGirba.50';
        load.
Gofer new
	renggli: 'petit';
	package: 'PetitParser';
	load.
!
"TextLint"
Gofer new
	renggli: 'textlint';
	package: 'TextLint-Model';
	package: 'TextLint-View';
	package: 'TextLint-Tests';
	load.
!
"TextLint GUI"
| stream image button |
World submorphs do: [ :each |
	each class = TaskbarMorph
		ifFalse: [ each delete ] ].
stream := HTTPSocket httpGet: 'http://textlint.lukas-renggli.ch/images/logo.png'.
stream binary; reset.
image := (PNGReadWriter on: stream) nextImage asMorph.
image left: 10; top: 10; lock: true; sticky: true.
image openInWorld.
button := PluggableButtonMorph new.
button model: TLWizardGUI; actionSelector: #open; label: 'Open TextLint'.
button top: image bottom + 10; left: 10; sticky: true.
button openInWorld.
!
"Unload Build Tools"
[ Gofer new
	package: 'HudsonBuildTools';
	unload ]
		on: Error
		do: [ :err | "package not present" ].
!
"Clear Monticello Caches"
MCCacheRepository instVarNamed: 'default' put: nil.
MCFileBasedRepository flushAllCaches.
MCMethodDefinition shutDown.
MCDefinition clearInstances.
!
"Cleanup Smalltalk"
Smalltalk flushClassNameCache.
Smalltalk organization removeEmptyCategories.
Smalltalk allClassesAndTraitsDo: [ :each |
	each organization removeEmptyCategories; sortCategories.
	each class organization removeEmptyCategories; sortCategories ].
!
"Cleanup System Memory"
Author reset.
Smalltalk garbageCollect.
Symbol compactSymbolTable.
Deprecation raiseWarning: true.
!
"Save and Quit"
WorldState addDeferredUIMessage: [
	SmalltalkImage current snapshot: true andQuit: true ].
!
