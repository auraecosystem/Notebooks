// Define global world settings
world
    fps = 30
    view = 6
    turf = /turf/floor

// Define basic environment turfs
turf
    floor
        icon = 'icons.dmi'
        icon_state = "floor"
    wall
        icon = 'icons.dmi'
        icon_state = "wall"
        density = 1 // Prevents entities from walking through

// Define the player mob and attributes
mob
    icon = 'icons.dmi'
    icon_state = "player"
    
    var/hp = 100
    var/max_hp = 100

    // Custom verb command usable in-game
    verb/check_status()
        set category = "Commands"
        set desc = "Displays your current health status."
        
        src << "Your current HP is [hp]/[max_hp]."

    // Automatically called when a player logs in
    Login()
        ..()
        src << "Welcome to the world!"
