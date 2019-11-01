<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
if (!isset($_GET['iditem'])) {
    ?>
    <div id="bodyOrignal" style="margin: 50px 0 0 0;">
        <div class="row">
            <?php
			$data = $Database->SelectWhere('store', "type = 'offer' or type = 'offerRand' AND enable = 1");
            while ($row = array_shift($data)) {
                ?>
                <div class="col-lg-4">
                    <img src="<?= URL ?>img/icon/<?= $row['img'] ?>.jpg" alt=""/>
                    <h2><?= $row['name'] ?></h2>
                    <p>Price : <?= $row['price'] ?> point</p>
                    <p><a class="btn btn-default" href="<?= URL ?>?go=offer&iditem=<?= md5($row['id'] . date('Y-m-d')) ?>" role="button">View details »</a></p>
                </div>
            <?php }
				unset($data);
				?>
        </div>
    </div>
    <?php
} else {
    ?>
    <div id="bodyOrignal" style="margin: 50px auto;width: 440px;min-height: 400px;">
        <div class="row">
            <?php
            $data = $Database->SelectWhere('store', "enable = 1  AND (type = 'offer' or type = 'offerRand')");
            $idItem = security::clean($_GET['iditem']);
            for ($i = 0; $i < count($data); $i++) {
                if (md5($data[$i]['id'] . date('Y-m-d')) == $idItem) {
                    ?>
                    <form method="POST" action="<?= URL ?>?go=buy">
                        <input type="hidden" name="iditem" value="<?= $idItem ?>">
                        <div id="getItem">
							<img src="<?= URL ?>img/icon/<?= $data[$i]['img'] ?>.jpg" alt=""/>
                            <h2><?= $data[$i]['name'] ?></h2>
                            <p><?= $data[$i]['desc'] ?></p>
                            <p>Price : <?= $data[$i]['price'] ?> point</p>
                            <p>
                                <select  name="count" style="width: 40px;">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                </select>
                            </p>
                            <p style="float: left;margin-left: 90px;"><input type="submit" value="Buy Now"></p>
                        </div>
                    </form>
                    <p style="float: right;margin-right: 90px;"><input type="submit" id="shoutbox_submit" onclick="history.back(-1)" value="Cansel" />
                    <?php
                }
            }
			unset($data);
            ?>
        </div>
    </div>
<?php } ?>
</div>