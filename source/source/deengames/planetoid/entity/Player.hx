package deengames.planetoid.entity;

import nebula.ecs.Container;
import nebula.ecs.component.KeyboardInputComponent;
import nebula.ecs.component.ColourComponent;
import nebula.ecs.component.SpriteComponent;
import nebula.ecs.component.PositionComponent;
import nebula.ecs.component.CameraComponent;
import nebula.ecs.component.MouseClickComponent;
import nebula.ecs.Entity;


class Player
{
    // TODO: replace with a fluent interface
    // eg. new Entity().color(255, 0, 0).size(32, 32).move(0, 0).moveToKeyboard(100);
    public static function create():Entity
    {
        var entity:Entity =  new Entity()
            //.colour(255, 0, 0)
            .move(0, 0)
            .trackWithCamera()
            .moveWithKeyboard(100);
        entity.onClick(function(x:Float,y:Float)
            {
                entity.get(nebula.ecs.component.ProgressBarComponent).currentProgress += 25;
            });
            
        var p = new nebula.ecs.component.ProgressBarComponent(100);
        p.currentProgress = 33;
        
        entity.add(p);
        return entity;
    }
}