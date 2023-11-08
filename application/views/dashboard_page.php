<!DOCTYPE html>
<html class="paceSimple sidebar sidebar-fusion">
<?php $datah = array(); //print_r($userPrivileges;);
     $datah['userPrivileges'] = $userPrivileges; ?>
    <?php $this->load->view('common'); ?>
    <body class="">
        <div class="container-fluid menu-hidden">
            <?php $this->load->view('menubar_page',$datah); ?>
            <div id="content"> 
                <?php $this->load->view('header', $datah); ?>
                <?php $this->load->view($page_url); ?>
            </div>
        </div>
    </div>
    <?php $this->load->view('footer', $datah); ?>
</body>
</html>