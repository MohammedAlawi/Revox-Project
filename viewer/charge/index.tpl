<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
if(!isset($_GET['type']) or $_GET['type'] == null)
    header('location: ' . URL . '?go=charge&type=paypal');
    ?>
	<style>
	#left {width: 150px;}
	#bodyOrignal {margin: 50px 0 0 150px;}
	.purchase {padding-left: 0;}
	.coin-money-price {width: 60%;}
	.buy-coins {padding-left: 38.5%;position: relative;top: 85px;padding-bottom: 0px;}
	
	
	</style>
    <aside id="left">
        <article>
            <ul id="left_menu">
                <li><a href="<?= URL ?>?go=charge&type=paypal"><img src="img/bullet.png">PayPal</a><p></p></li>
                <li><a href="<?= URL ?>?go=charge&type=Auther"><img src="img/bullet.png">Auther way</a><p></p></li>
            </ul>
        </article>                   
    </aside>
    <div id="bodyOrignal">
        <div class="row">
			<div id="posts_content" style="text-align:center;">
				<div class="cont-image">    
					<div class="purchase" align="center">
						<div class="d-cont coin-money-price">
							<p>You will be charged <br>via PayPal</p> 
							<div style="font-size:6px;">POINTS<span id="payment-infoPane-price">50</span></div>
							<div style="margin-right:30px;">$<span id="payment-infoPane-dollars">5</span></div>
						</div>
						<p>You will be charged in USD. Please remember all refunds have to be approved.</p>
						<input type="submit" value="Charge" onclick="return submitPaymentForm();">
					</div>
					
					<div class="buy-coins">
						<form action="<?=URL?>checkout.php" method="post" target="paypal" id="paypal-form">
							<input type="hidden" name="item_number" id="paypal-product-id" value="Revolution">
							<input type="hidden" name="amount" value="5.00">
						</form>
						
						<div class="container-left coins-number" align="center">
							<ul>
								<li id="onemore-a"><a href="javascript: void(0);" id="payment-increase-coins"></a></li>
								<li><input readonly="true" id="selected-coins-input" type="text" value="50"></li>
								<li id="oneless-a"><a href="javascript: void(0);" id="payment-decrease-coins"></a></li>
							</ul>
						</div>   
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>