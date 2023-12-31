
<div class="col-lg-12" style="margin-top:20px;">
  <div class="col-sm-4">
    <h4></h4>
  </div>
  <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12 pull-right">
      <?php if ($userPrivileges->administration_control->projects->Add == 1) { ?>
      <a href="#modal-add" data-toggle="modal" class="btn-sm btn-warning pull-right" style="margin-left:8px;">Add Project</a> 
      <a href="#modal-add-manager" data-toggle="modal" class="btn-sm btn-warning pull-right" style="margin-left:8px;">Add Manager</a>
      <a href="#modal-edit-manager" data-toggle="modal" class="btn-sm btn-warning pull-right" style="margin-left:8px;">Edit Manager</a>
  </div>
       <?php } ?>
</div>
<div class="innerLR" style="margin-top:60px;">
  <div class="widget widget-body-white widget-heading-simple">
    <div class="widget-body overflow-x" style="padding:10px;">
      <table class="dynamicTable tableTools table table-striped overflow-x">
        <thead>
          <tr style="background-color:#c72a25; color:#FFF;">
            <th width="70" class="thead-th-padg">Project Name</th>
            <th width="70 " class="thead-th-padg">Client Name</th>
            <th width="70" class="thead-th-padg">Manager Name</th>
            <th width="60" class="thead-th-padg">Project Status</th>
            <th width="70" class="thead-th-padg">Start Date</th>
            <th width="70" class="thead-th-padg">Dead Line Date</th>
            <th width="90" class="thead-th-padg">Project's Estimated Cost</th>
            <th width="70" class="thead-th-padg" align="right" style="padding-right: 50px !important;text-align: right;">
                <?php if (($userPrivileges->administration_control->projects->Edit == 1) || ($userPrivileges->administration_control->projects->Delete == 1)) { ?>
                            Actions
                         <?php } ?>
            </th>
          </tr>
        </thead>
        <tbody>
          <?php
                    if (!empty($project_detail)) {
                     foreach ($project_detail as $project)
                         {
                            ?>
          <tr class="gradeX">
            <td><span><?php echo $project->project_name; ?> </span></td>
            <td><?php echo $project->client_name;  ?></td>
            <td><?php echo $project->manager_name;  ?></td>
            <td><span><?php echo $project->project_status; ?> </span></td>
            <td><span><?php if($project->start_Date !="") { $date=date_create($project->start_Date); echo date_format($date,"d F Y"); } ?> </span></td>
            <td><span><?php if($project->start_Date !="") {$date=date_create($project->dead_line_date); echo date_format($date,"d F Y");} ?> </span></td>
            <td><span><?php if($project->start_Date !=""){echo $project->project_total_estimate_amount;} ?> </span></td>
            <td align="right"><?php if ($userPrivileges->administration_control->projects->Edit == 1) { ?>
                <a href="#modal-edit" onclick="edit_project('<?php echo $project->project_id; ?>')" data-toggle="modal" class="btn-xs btn-success td-btn-marg-right">Edit</a> 
                <?php } 
                  if ($userPrivileges->administration_control->projects->Delete == 1) { ?>
                <a href="#nogo" class="btn-xs btn-danger td-btn-marg-right" onclick="delete_project('<?php echo $project->project_id; ?>')">Delete</a></td>
                <?php } ?>
          </tr>
          <?php  } } ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div class="modal fade"  id="modal-add">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title">Add Project</h3>
      </div>
      <!-- // Modal heading END --> 
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="innerAll">
          <div class="innerLR">
            <form class="form-horizontal" role="form" id="addForm">
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align: left; margin-bottom:10px;">Project Name</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="project_name" id="project_name" maxlength="200"  placeholder="Project Name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label"style="text-align: left;">Client Assigned</label>
                <div class="col-sm-7"> 
                  <select  class="form-control" name="client_name" id="client_name">
                    <option value="">Select</option>
                   <?php foreach($clent_details as $client){
                       
                       ?>
                    
                    
                    <option value="<?php echo $client->client_name; ?>"><?php echo $client->client_name; ?></option>
                   <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label"style="text-align: left;">Currency </label>
                <div class="col-sm-7"> 
                  <!--  <input type="file" class="form-control" name="project_logo" style="height:24px; padding-bottom:30px; border-radius: 0;"/> -->
                  <select  class="form-control" name="currency_code" id="currency_code" >
                    <option value="">Select</option>
                   <?php foreach($currency as $currency11){ ?>
                    <option value="<?php echo $currency11->currency_code; ?>"><?php echo $currency11->currency_code; ?></option>
                   <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-4 control-label"style="text-align: left;">Start Date </label>  
                  <div class="col-sm-7">
                      <div class="input-group date datepicker2" style="width:100%;">
                          <input class="form-control height_25" type="text" name="project_start_date" id="project_start_date" data-bv-field="project_start_date">
                          <span class="input-group-addon padding_3"><i class="fa fa-th"></i></span>
                      </div><i class="form-control-feedback bv-icon-input-group" data-bv-icon-for="project_start_date" style="display: none;"></i>
                    <!-- <small class="help-block" data-bv-validator="notEmpty" data-bv-for="project_start_date" data-bv-result="NOT_VALIDATED" style="display: none;">This field is required</small> -->
                </div>
              </div>      
              <!-- <div class="form-group">
                  <label class="col-sm-4 control-label"style="text-align: left;">Completed Date </label>  
                  <div class="col-sm-7">
                      <div class="input-group date datepicker2" style="width:100%;">
                          <input class="form-control height_25" type="text" name="project_completed_date" id="project_completed_date" data-bv-field="project_completed_date">
                          <span class="input-group-addon padding_3"><i class="fa fa-th"></i></span>
                      </div><i class="form-control-feedback bv-icon-input-group" data-bv-icon-for="project_completed_date" style="display: none;"></i>
                  <small class="help-block" data-bv-validator="notEmpty" data-bv-for="project_completed_date" data-bv-result="NOT_VALIDATED" style="display: none;">This field is required</small></div>
              </div> -->
              <div class="form-group">
                  <label class="col-sm-4 control-label"style="text-align: left;">Dead Line Date </label>  
                  <div class="col-sm-7">
                      <div class="input-group date datepicker2" style="width:100%;">
                          <input class="form-control height_25" type="text" name="project_dead_line_date" id="project_dead_line_date" data-bv-field="project_dead_line_date">
                          <span class="input-group-addon padding_3"><i class="fa fa-th"></i></span>
                      </div><i class="form-control-feedback bv-icon-input-group" data-bv-icon-for="project_dead_line_date" style="display: none;"></i>
                      <!-- <small class="help-block" data-bv-validator="notEmpty" data-bv-for="project_dead_line_date" data-bv-result="NOT_VALIDATED" style="display: none;">This field is required</small> -->
                  </div>
              </div>      
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Manager Name</label>
                <div class="col-sm-7">
                   <select  class="form-control" name="manager_name" id="manager_name" >
                    <option value="">Select</option>
                  <?php
                    foreach($manager_list as $manager_data){
                  ?>
                  <option value="<?php echo $manager_data->name;?>"><?php echo $manager_data->name;?></option>
                   <?php  }?>
                   </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align: left; margin-bottom:10px;">Project Estimated Cost (In Rs.)</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="est_cost" id="est_cost" maxlength="10"  placeholder="Project Estimated Cost">
                </div>
              </div>
              <img id="addloader" src="<?php echo base_url(); ?>assets/images/ajax-loader.gif" style="display:none;margin-left: 200px;"/>
              <div class="form-group">
                <div class="col-sm-offset-1 col-sm-10"> 
                  <button class="btn btn-success pull-right">Save</button>
                   <a href="#" class="btn btn-primary pull-right" data-dismiss="modal" style="margin-right:20px;">Cancel</a> </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade"  id="modal-add-manager">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title">Add Manager</h3>
      </div>
      <!-- // Modal heading END --> 
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="innerAll">
          <div class="innerLR">
            <form class="form-horizontal" role="form" id="addManager">
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align: left; margin-bottom:10px;">Manager Name</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="add_manager_name" id="add_manager_name" maxlength="200"  placeholder="Manager Name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label"style="text-align: left;">Status</label>
                <div class="col-sm-7"> 
                  <select  class="form-control" name="manager_status" id="manager_status">
                    <option value="Active" selected>Active</option>
                    <option value="Inactive">In Active</option>
                  </select>
                </div>
              </div>
              <img id="addloader" src="<?php echo base_url(); ?>assets/images/ajax-loader.gif" style="display:none;margin-left: 200px;"/>
              <div class="form-group">
                <div class="col-sm-offset-1 col-sm-10"> 
                  <button class="btn btn-success pull-right">Save</button>
                   <a href="#" class="btn btn-primary pull-right" data-dismiss="modal" style="margin-right:20px;">Cancel</a> </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade"  id="modal-edit-manager">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title">Edit Manager</h3>
      </div>
      <!-- // Modal heading END --> 
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="innerAll">
          <div class="innerLR">
            <form class="form-horizontal" role="form" id="editManager">
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Select Manager</label>
                <div class="col-sm-7">
                   <select  class="form-control" name="select_manager_name" id="select_manager_name" onchange="myFunction(this)">
                    <option value="">Select</option>
                  <?php
                    foreach($all_manager_list as $manager_data){
                  ?>
                  <option value="<?php echo $manager_data->id;?>"><?php echo $manager_data->name;?></option>
                   <?php  }?>
                   </select>
                </div>
              </div>
              <div class="form-group" id="edit_manager_group" style="display:none;">
                <label class="col-sm-4 control-label" style="text-align: left; margin-bottom:10px;">Manager Name</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="edit_manager_name" id="edit_manager_name" maxlength="200"  placeholder="Manager Name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label"style="text-align: left;">Status</label>
                <div class="col-sm-7"> 
                  <select  class="form-control" name="edit_manager_status" id="edit_manager_status">
                    <option value="Active" selected>Active</option>
                    <option value="Inactive">In Active</option>
                  </select>
                </div>
              </div>
              <img id="addloader" src="<?php echo base_url(); ?>assets/images/ajax-loader.gif" style="display:none;margin-left: 200px;"/>
              <div class="form-group">
                <div class="col-sm-offset-1 col-sm-10"> 
                  <button class="btn btn-success pull-right">Save</button>
                   <a href="#" class="btn btn-primary pull-right" data-dismiss="modal" style="margin-right:20px;">Cancel</a> </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade"  id="modal-edit">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal heading -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title">Edit Project</h3>
      </div>
      <!-- // Modal heading END --> 
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="innerAll">
          <div class="innerLR">
            <form class="form-horizontal" role="form" id="editForm">
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Project Name</label>
                <div class="col-sm-7">
                  <input type="text" name="edit_project_name" id="edit_project_name" maxlength="200" class="form-control">
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Client Assigned</label>
                <div class="col-sm-7">
                  <select  class="form-control" name="edit_client_name" id="edit_client_name">
                   <option value="">Select</option>
                   <?php foreach($clent_details as $client){ ?>
                    <option value="<?php echo $client->client_name; ?>"><?php echo $client->client_name; ?></option>
                   <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Currency</label>
                <div class="col-sm-7">
                   <select  class="form-control" name="edit_currency_code" id="edit_currency_code" >
                    <option value="">Select</option>
                    <?php foreach($currency as $currency1){ ?>
                    <option value="<?php echo $currency1->currency_code;  ?>"><?php echo $currency1->currency_code;  ?></option>
                   <?php } ?>
                   </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Project Status</label>
                <div class="col-sm-7">
                   <select  class="form-control" name="project_status" id="project_status" >
                    <option value="">Select</option>
                    <option value="Active">Active</option>
                    <option value="On-Hold">On-Hold</option>
                    <option value="Completed">Completed</option>
                    <option value="In-Progress">In-Progress</option>
                   </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align:left;margin-bottom:10px">Manager Name</label>
                <div class="col-sm-7">
                   <select  class="form-control" name="edit_manager_name" id="edit_manager_name" >
                    <option value="">Select</option>
                  <?php
                    foreach($manager_list as $manager_data){
                  ?>
                  <option value="<?php echo $manager_data->name;?>"><?php echo $manager_data->name;?></option>
                   <?php  }?>
                   </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-4 control-label" style="text-align: left; margin-bottom:10px;">Project Estimated Cost (In Rs.)</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="edit_est_cost" id="edit_est_cost" maxlength="10"  placeholder="Project Estimated Cost">
                </div>
              </div>

              <input type="hidden" id="edit_project_id" value="">
              <img id="editloader" src="<?php echo base_url(); ?>assets/images/ajax-loader.gif" style="display:none;margin-left: 200px;"/>
              <div class="form-group">
                <div class="col-sm-offset-1 col-sm-10">
                  <button class="btn btn-success pull-right">Save</button>
                  <a href="#" class="btn btn-primary pull-right" data-dismiss="modal" style="margin-right:20px;">Cancel</a> </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- // Modal body END --> 
      
    </div>
  </div>
</div>
<script>
    $(document).ready(function () {
        
        $('#modal-add').modal({
          backdrop: 'static',
          keyboard: true,
            show: false   
        })
        $('#modal-edit').modal({
          backdrop: 'static',
          keyboard: true,
            show: false   
        })
        
        $('#modal-add').on('shown.bs.modal', function () {
            $('#addForm').bootstrapValidator('resetForm', true);
            $('.btn-success').removeAttr("disabled");
            $('#client_id').prop('selectedIndex',0);
            $('#currency_id').prop('selectedIndex',0);
        });
        $('#addForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                project_name: {
                    validators: {
                        notEmpty: {
                            message: 'This field is required.'
                        }
                    }
                },
                manager_name: {
                        validators: {
                            notEmpty: {
                                message: 'Manager name is required'
                            }
                        }
                },
                project_start_date: {
                        validators: {
                            notEmpty: {
                                message: 'Start date is required'
                            }
                        }
                },
                project_dead_line_date: {
                        validators: {
                            notEmpty: {
                                message: 'Dead line date is required'
                            }
                        }
                },
                est_cost: {
                        validators: {
                            notEmpty: {
                                message: 'Estimated Cost is required'
                            }
                        }
                },
            }
        })
          .on('success.form.bv', function (e) {
                    e.preventDefault();
                    $('.btn-success').attr("disabled", "disabled");
                    var project_name = $('#project_name').val();
                    var client_name =  $('#client_name').val();
                    var currency_code = $('#currency_code').val();
                    var manager_name = $('#manager_name').val();
                    var start_date = $('#project_start_date').val();
                    var dead_line_date = $('#project_dead_line_date').val();
                    var est_cost = $('#est_cost').val();
                    const date1 = new Date(start_date); 
                    const date2 = new Date(dead_line_date); 
                    if (date1 > date2) { 
                      alert('Start date should be lesser than deadline date!!');
                      $('.btn-success').removeAttr("disabled");
                      return false;
                    } 
                    $.ajax({
                        async: true,
                        type: "POST",
                        url: CURRENT_URL + '/project/add_project',
                        dataType: "json",
                        data: {project_name: project_name,client_name:client_name,currency_code:currency_code,manager_name:manager_name,start_date:start_date,dead_line_date:dead_line_date},
                        beforeSend: function ()
                        {
                            $("#addloader").show();
                        },
                        success: function (data) {
                            bootbox.alert(data.message, function () {
                                if (data.status == "SUCCESS")
                                {
                                    $("#modal-add").modal("hide");
                                    location.reload();
                                }
                                else
                                {
                                    //$("#modal-add").modal("show");
                                    $('.btn-success').removeAttr("disabled");
                                }

                            });

                        },
                        error: function (xhr, status, error) {
                            bootbox.alert(status);
                        },
                        complete: function ()
                        {
                            $("#addloader").hide();
                        }
                    });
          });
          
        $('#addManager').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
              add_manager_name: {
                validators: {
                  notEmpty: {
                    message: 'Manager name is required'
                  }
                }
              },
              manager_status: {
                validators: {
                    notEmpty: {
                      message: 'This field is required.'
                    }
                }
              },
            }
        }).on('success.form.bv', function (e) {
              e.preventDefault();
              $('.btn-success').attr("disabled", "disabled");
              var manager_name = $('#add_manager_name').val();
              var manager_status = $('#manager_status').val();
              $.ajax({
                  async: true,
                  type: "POST",
                  url: CURRENT_URL + '/project/add_manager',
                  dataType: "json",
                  data: {manager_name: manager_name,manager_status:manager_status},
                  beforeSend: function ()
                  {
                    $("#addloader").show();
                  },
                  success: function (data) {
                    bootbox.alert(data.message, function () {
                      if (data.status == "SUCCESS")
                      {
                          $("#modal-add").modal("hide");
                          location.reload();
                      }
                      else
                      {
                          //$("#modal-add").modal("show");
                          $('.btn-success').removeAttr("disabled");
                      }
                    });
                  },
                  error: function (xhr, status, error) {
                      bootbox.alert(status);
                  },
                  complete: function ()
                  {
                    $("#addloader").hide();
                  }
              });
        });

        $('#editManager').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
              edit_manager_name: {
                validators: {
                  notEmpty: {
                    message: 'Manager name is required'
                  }
                }
              },
              edit_manager_status: {
                validators: {
                    notEmpty: {
                      message: 'This field is required.'
                    }
                }
              },
            }
        }).on('success.form.bv', function (e) {
              e.preventDefault();
              $('.btn-success').attr("disabled", "disabled");
              var manager_id = $('#select_manager_name').val();
              var manager_name = $('#edit_manager_name').val();
              var manager_status = $('#edit_manager_status').val();
              $.ajax({
                  async: true,
                  type: "POST",
                  url: CURRENT_URL + '/project/edit_manager',
                  dataType: "json",
                  data: {manager_id:manager_id,manager_name: manager_name,manager_status:manager_status},
                  beforeSend: function ()
                  {
                    $("#addloader").show();
                  },
                  success: function (data) {
                    bootbox.alert(data.message, function () {
                      if (data.status == "SUCCESS")
                      {
                          $("#modal-add").modal("hide");
                          location.reload();
                      }
                      else
                      {
                          $('.btn-success').removeAttr("disabled");
                      }
                    });
                  },
                  error: function (xhr, status, error) {
                      bootbox.alert(status);
                  },
                  complete: function ()
                  {
                    $("#addloader").hide();
                  }
              });
        });
          

        $('#editForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                edit_project_name: {
                    validators: {
                        notEmpty: {
                            message: 'The Company Name is required'
                        }
                    }
                },
                project_status: {
                        validators: {
                            notEmpty: {
                                message: 'Project status is required'
                            }
                        }
                    },
                    edit_manager_name: {
                        validators: {
                            notEmpty: {
                                message: 'Manager name is required'
                            }
                        }
                    },
                edit_est_cost: {
                        validators: {
                            notEmpty: {
                                message: 'Estimated Cost is required'
                            }
                        }
                },
            }
        })
                .on('success.form.bv', function (e) {
                    e.preventDefault();
                     $('.btn-success').attr("disabled", "disabled");
                    var project_id = $('#edit_project_id').val();
                    var project_name = $('#edit_project_name').val();
                    var client_name =    $('#edit_client_name').val();
                    var currency_code = $('#edit_currency_code').val();
                    var project_status = $('#project_status').val();
                    var manager_name = $('#edit_manager_name').val();
                    var est_cost = $('#edit_est_cost').val();
                    

                    $.ajax({
                        async: true,
                        type: "POST",
                        url: CURRENT_URL + '/project/submit_edit_project',
                        dataType: "json",
                        data: {project_id: project_id, project_name: project_name,client_name: client_name, currency_code: currency_code,project_status:project_status,type:1,manager_name:manager_name, est_cost:est_cost},
                        beforeSend: function ()
                        {
                            $("#editloader").show();

                        },
                        success: function (data) {
                             
                            
                            bootbox.alert(data.message, function () {
                                if (data.status == "SUCCESS")
                                {
                                    $("#modal-edit").modal("hide");
                                    window.stop();
                                    location.reload();
                                }
                                else
                                {
                                    //$("#modal-edit").modal("show");
                                    $('.btn-success').removeAttr("disabled");
                                }

                            });
                        },
                        error: function (xhr, status, error) {
                            alert(status);
                        },
                        complete: function ()
                        {
                            $("#editloader").hide();
                        }
                    });



                });
        initTables();
    });

    function edit_project(id) {
         $('#modal-edit').on('shown.bs.modal', function () {
            $('#editForm').bootstrapValidator('resetForm', true);
            $('.btn-success').removeAttr("disabled");
            $('#edit_client_id').prop('selectedIndex',0);
            $('#edit_currency_id').prop('selectedIndex',0);
        var request = $.ajax({
            url: CURRENT_URL + '/project/edit_project',
            type: "POST",
            data: {project_id: id},
            dataType: "json"
        });
        request.done(function (msg) {
            $.each(msg, function (i, item) {
               $('#edit_currency_code').val(item.currency_code);
               $('#edit_client_name').val(item.client_name);
               $('#edit_project_name').val(item.project_name);
                $('#edit_project_id').val(item.project_id);
                $('#project_status').val(item.project_status);
                $('#edit_manager_name').val(item.manager_name);
                $('#edit_est_cost').val(item.project_total_estimate_amount);
                $('.btn-success').removeAttr("disabled");
            });
        });
        request.fail(function (jqXHR, textStatus) {
            alert("Request failed: " + textStatus);
        });
        });
    }

    function delete_project(id) {
        bootbox.confirm("Are you sure you want to delete project?", function (result) {

            if (result == true) {

                var request = $.ajax({
                    url: CURRENT_URL + '/project/delete_project',
                    type: "POST",
                    data: {project_id: id},
                    dataType: "json"
                });
                request.done(function (data) {
                    bootbox.alert(data.message, function () {
                        if (data.status == "SUCCESS")
                        {

                            window.stop();
                            location.reload();
                        }


                    });
                });
                request.fail(function (jqXHR, textStatus) {
                    alert("Request failed: " + textStatus);
                });
            }
        });

    }

    function myFunction(sel){
      var manager_name = sel.options[sel.selectedIndex].text;
      if(manager_name == 'Select'){
        $("#edit_manager_group").hide();
      } else{
        $("#edit_manager_name").val(manager_name);
        $("#edit_manager_group").show();
      }
    }
</script>