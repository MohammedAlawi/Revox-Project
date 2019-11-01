<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class Arcadia {

    public static function StringResource($code) {
		$query = new querydbSQL();
		return $query->SelectW(DB_ARCADIA, TABLE_StringResource, array("code" => $code) );
    }

    public static function ItemResource($id) {
		$query = new querydbSQL();
		return $query->SelectW(DB_ARCADIA, "ItemResource", array("id" => $id) );
    }

}
