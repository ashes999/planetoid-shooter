package pulsar.ecs.system;

import pulsar.ecs.component.AbstractComponent;
import pulsar.ecs.Container;

// Base class, don't use directly.
class AbstractSystem
{
    private var container:Container;
    
    // component types we care about. An entity must have all of these for us to manage them.
    private var componentTypes:Array<Class<AbstractComponent>> = [];
    
    // entities with whatever components we care about
    private var entities:Array<Entity> = [];
    
    // First function is our usual container, second is a list of components. We only care
    // about entities that have all those components.
    private function new(container:Container, componentTypes:Array<Class<AbstractComponent>>)
    {
        this.container = container;
        this.componentTypes = componentTypes;
    }
    
    // Everything's initialized
    public function create():Void { } 
    
    // Called every update loop
    public function update(elapsed:Float):Void { }
    
    // A new entity was added, or an existing entity was changed.
    // Update our entity list accordingly.
    public function entityChanged(entity:Entity):Void
    {
        // Has all required types we care about
        if (doesHaveAllRequiredComponentTypes(entity))
        {
            // We don't know about it yet
            if (this.entities.indexOf(entity) == -1)
            {
                // Track it
                this.entities.push(entity);
            }
        }
        else
        {
            // Doesn't have alll required types. If we know about it, excise it.
            if (this.entities.indexOf(entity) > -1)
            {
                this.entities.remove(entity);
            }
        }
    }
    
    private function doesHaveAllRequiredComponentTypes(entity:Entity):Bool
    {
        for (type in componentTypes)
        {
            if (!entity.has(type))
            {
                return false;
            }
        }
        
        return true;
    }
}