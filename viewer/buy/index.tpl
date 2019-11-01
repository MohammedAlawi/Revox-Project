<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
if (isset($_POST['Home'])) {
    header("location: " . URL . '?go=offer');
    die;
}
?>
<div id="bodyOrignal" style="margin: 50px auto; width: 440px;min-height: 400px;">
    <div class="row">
        <?php
        if (isset($_POST['iditem']) AND isset($_POST['count'])) {
            ?>
            <?php
            $iditem = security::clean($_POST['iditem']);
            $count = security::clean($_POST['count']);
            $data = $Database->SelectW('store', array("enable" => 1) );
            for ($i = 0; $i < count($data); $i++) {
                if (md5($data[$i]['id'] . date('Y-m-d')) == $iditem) {
                    $total = $count * $data[$i]['price'];
                    ?>
                    <h1> Confirmation </h1>
                    <form method="POST" action="<?= URL ?>?go=buy">
                        <input type="hidden" name="idItembuy" value="<?= $iditem ?>">
                        <input type="hidden" name="countItem" value="<?= $count ?>">
                        <div id="getItem">
							<img src="<?= URL ?>img/icon/<?= $data[$i]['img'] ?>.jpg" alt=""/>
                            <h2><?= $data[$i]['name'] ?></h2>
                            <p><?= $data[$i]['desc'] ?></p>
                            <p>Total Price : <font size="4" color="white"><?= $total ?></font> point</p>
                            <?php
                            if ($total <= $point) {
                                ?>
                                <p style="float: left;margin-left: 90px;"><input type="submit" value="Buy Now"></p>
                            </div>
                        </form>
                        <p style="float: right;margin-right: 90px;"><input type="submit" id="shoutbox_submit" onclick="history.back(-1)" value="Cancel" /></p>
                    <?php } else { ?>
                        <form metod="POST" action="">
                            <p style="float: left;margin-left: 90px;"><input type="submit" name="error" value="Don't have Point" /></p>
                        </form>
                        <p style="float: right;margin-right: 90px;"><input type="submit" id="shoutbox_submit" onclick="history.back(-1)" value="Cancel" /></p>
                    <?php } ?>
                    <?php
                }
            }
            ?>
        <?php
        } elseif (isset($_POST['idItembuy']) AND isset($_POST['countItem'])) {
            $iditem = security::clean($_POST['idItembuy']);
            $countItem = security::clean($_POST['countItem']);
            $player = new Player();
			$data = $Database->SelectWhere("store,item_store", " id = id_store AND enable = 1 GROUP BY  id");
			if($countItem >= 1 and $countItem <= 9){
				for ($i = 0; $i < count($data); $i++) {
					if (md5($data[$i]['id_store'] . date('Y-m-d')) == $iditem) {
						$total = $countItem * $data[$i]['price'];
						if ($total <= $point) {
							$newPoint = $point - ($data[$i]['price'] * $countItem );
							$updatePoint = $player->updatePoint($_SESSION['dataPlay'][0]['account_id'], $newPoint);
							if ($data[$i]['type'] == "offerRand") {
								$rand = preg_split('/,/', $data[$i]['count']);
								if(($data[$i]['price'] * $countItem) <= $point){
									for($e = 0; $e < $countItem ; $e++){
										$count = $rand[array_rand($rand)];
										$addItem = $player->addItem($_SESSION['dataPlay'][0]['account_id'], $data[$i]['code'], $count);
									}
								} else {
									$addItem = 0;
								}
							} else {
								if(($data[$i]['price'] * $countItem) <= $point){
									$rand = preg_split('/,/', $data[$i]['count']);
									for($e = 0; $e < $countItem ; $e++){
										$count = $rand[array_rand($rand)];
										$addItem = $player->addItem($_SESSION['dataPlay'][0]['account_id'], $data[$i]['code'], $count);
									}
								} else {
									$addItem = 0;
								}
							}
						} else {
							$addItem = 0;
						}
					}
				}
			} else {
				$addItem = 0;
			}
            if ($addItem == 1) {
                ?>

                <div id="getItem">
                    <form method="POST">
                        <p style="font-size: 24px; color: green;">The acquisition was successfully</p>
                        <p><input type="submit" name="Home" value="Go Home" /></p>
                    </form>
                </div>

                <?php
            } else {
                ?>
                <div id="getItem">
                    <form method="POST">
                        <p style="font-size: 24px; color:red;">ERROR</p>
                        <p><input type="submit" name="Home" value="Go Home" /></p>
                    </form>
                </div>
                <?php
            }
        } else {
            
        }
        ?>
    </div>
</div>