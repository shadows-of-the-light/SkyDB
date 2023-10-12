------------------------------------------------------------------------------------------
-- Haptic Resources -----------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Notes: Lists all haptic definition/ haptic resources to be loaded at program startup and
--			remain loaded until program termination.
--
------------------------------------------------------------------------------------------




resource "HapticFile" "Hit2sec" { source = "Hit2sec" }
resource "HapticFile" "LongFade_3sec" { source = "LongFade_3sec" }
resource "HapticFile" "Whoosh1" { source = "Whoosh1" }
resource "HapticFile" "BumpLargeShort" { source = "BumpLargeShort" }
resource "HapticFile" "BumpSmallMedShort" { source = "BumpSmallMedShort" }
