<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class settingWord {
    
    public static function delete_between($one,$tow,$string) {
        return preg_replace('/'.$one.'[\s\S]+?'.$tow.'/', '',$string);
    }

}
