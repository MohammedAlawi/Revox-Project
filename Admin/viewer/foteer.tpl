<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
?>
<footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small> © 2018 Revolution Team. All rights reserved.</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="<?=URL?>?go=logout">Logout</a>
          </div>
        </div>
      </div>
    </div>
	
    <script src="<?=URL?>style/vendor/jquery/jquery.min.js"></script>
    <script src="<?=URL?>style/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?=URL?>style/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="<?=URL?>style/vendor/chart.js/Chart.min.js"></script>
    <script src="<?=URL?>style/vendor/datatables/jquery.dataTables.js"></script>
    <script src="<?=URL?>style/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="<?=URL?>style/js/sb-admin.min.js"></script>
    <script src="<?=URL?>style/js/sb-admin-datatables.min.js"></script>
    <script src="<?=URL?>style/js/sb-admin-charts.min.js"></script>
  </div>
</body>
</html>