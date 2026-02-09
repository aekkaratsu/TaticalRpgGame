// Scripts 
function InventorySearch(rootObject,itemType) // Sent Instance's id to root object first
{
    for (var i = 0; i < INVENTORY_SOLTS; i += 1)
    {
        if (rootObject.inventory[i] == itemType)
        {
            return i;
        }
    }
    return(-1); // No match item

}

function InventoryRemove(rootObject,itemType) {
    var _slot = InventorySearch(rootObject,itemType);
    if (_slot != -1) // If emty slot exist put new item type inside it.
    {
        with(rootObject) inventory[_slot] = -1;
        return true;    
    }
    else return false;
}

function  InventoryAdd(rootObject,itemType){
    var _slot = InventorySearch(rootObject, -1);
    if (_slot != -1) // If emty slot exist put new item type inside it.
    {
        with (rootObject) inventory[_slot] = itemType; 
        return true;
    }
    else return false;
}