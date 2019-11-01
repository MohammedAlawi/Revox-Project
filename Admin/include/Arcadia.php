<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class Arcadia {

    public static function StringResource($code) {
		if(GET_DATA_ITEM_FROM_SQLSERVER === true) {
			$query = new querydbSQL();
			return $query->SelectW(DB_ARCADIA, TABLE_StringResource, array("code" => $code) );
		} else {
			$Database = new querydb();
			return $Database->SelectW(TABLE_StringResource, array("code" => $code) );
		}
    }

    public static function ItemResource($id) {
		if(GET_DATA_ITEM_FROM_SQLSERVER === true) {
			$query = new querydbSQL();
			return $query->SelectW(DB_ARCADIA, "ItemResource", array("id" => $id) );
		} else {
			$Database = new querydb();
			return $Database->SelectW("ItemResource", array("id" => $id) );
		}
    }

}
