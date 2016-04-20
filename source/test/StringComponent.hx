package;

import nebula.ecs.component.AbstractComponent;

class StringComponent extends AbstractComponent
{
    public var value:String;
    
    public function new(value:String)
    { 
        super();
        this.value = value;
    }
}