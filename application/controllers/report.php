<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*
  Project Name : Timesheet
  Developed In: Clavis Technologies Pvt Ltd.
  Modification History
  Create Date           Version         Author			Description                                Last modified
  __________	___________	_______________   ________________________________________  ________________________________________
 24-03 -2015            1.0             Dablu                 Controller for Report                        24-03-2015
 */

class Report extends CI_Controller {

    function __construct() {
        // Construct our parent class
        parent::__construct();
       // $this->load->library('pdf');
        $this->load->model('company_model');
        $this->load->model('client_model');
        $this->load->model('project_model');
        $this->load->model('activity_model'); 
        $this->load->model('subactivity_model');
        $this->load->model('team_model');
        $this->load->model('userdetails_model');
        $this->load->model('task_model');
        $this->load->model('report_model');
        $this->load->helper('string');
        $this->load->helper('common');
        $this->load->library('session');
    
        
    }


        function timesheet_report() {
        if (!$this->session->userdata('logged_in')) {
            redirect(site_url("login"), 'refresh');
        }
        $all_userdata = $this->session->userdata('logged_in');
        $data = array();
        $data['userPrimeryId'] = $all_userdata['userPrimeryId'];
        $getUserPrivileges = $this->common_model->getUserPrivileges($data);
        $data['userPrivileges'] = json_decode($getUserPrivileges->user_privileges);
        $data['company_detail'] = $this->company_model->listCompany();
        $data['client_detail'] = $this->client_model->listClient();

        // $data['project_detail'] = $this->project_model->listProject();
        $data['project_detail'] = $this->project_model->listProject_report();//echo "<pre>"; print_r($data['project_detail']); echo "</pre>";die;
        $data['activity_detail'] = $this->activity_model->listActivity();
        $data['subactivity_detail'] = $this->subactivity_model->listSubactivity();
        $data['user_detail'] = $this->userdetails_model->listUserdetails();
        $data['team_details'] = $this->team_model->detailTeam();
        $data['task_detail'] = $this->task_model->taskDetail();
        $data['user_logo'] = $this->report_model->logoDetail($data['userPrimeryId']);
        $data['page_url'] = 'report_content';  //echo "<pre>"; print_r($data); echo "</pre>";die;
        $this->load->view('dashboard_page', $data);
    }
    function submit_report() {
        if (!$this->session->userdata('logged_in')) {
            redirect(site_url("login"), 'refresh');
        }
        // echo "ddd"; die;
        $all_userdata = $this->session->userdata('logged_in');
        $data = array();
        $data['userPrimeryId'] = $all_userdata['userPrimeryId'];
        $getUserPrivileges = $this->common_model->getUserPrivileges($data);
        $data['userPrivileges'] = json_decode($getUserPrivileges->user_privileges);
        $data['user_logo'] = $this->report_model->logoDetail($data['userPrimeryId']);
        $data['isBillable'] = $this->input->post('isBillable');
        $data['companyId'] = $this->input->post('companyId');
        $data['clientId'] = $this->input->post('clientId');
        $data['projectId'] = $this->input->post('projectId');
        $data['employeeId'] = $this->input->post('employeeId');
        $data['teamId'] = $this->input->post('teamId');
        $data['activityId'] = $this->input->post('activityId');
        $data['taskId'] = $this->input->post('taskId');
        $data['teamId'] = $this->input->post('teamId');
        $data['viewBy'] = $this->input->post('viewBy');
        $data['startDate']=$this->input->post('startDate');
        $data['endDate']=$this->input->post('endDate');
        $data['billable']=$this->input->post('billable');
        $data['description']=$this->input->post('description');
        $start_date=(!empty($data['startDate']))? date('Y-m-d', strtotime($data['startDate'])):'';
        $end_date=(!empty($data['endDate']))? date('Y-m-d', strtotime($data['endDate'])):'';
        $newdata = array(
                   'viewBy'  => $data['viewBy'],
                   'companyId' => $data['companyId'],
                   'clientId' => $data['clientId'],
                   'projectId' => $data['projectId'],
            'teamId' => $data['teamId'],
            'startDate' => $start_date,
            'endDate' => $end_date,
            'billable' => $data['billable'],
            'description' => $data['description'],
             'employeeId'=> $data['employeeId']
               );
         $data['startDate']=$start_date;
         $data['endDate']=$end_date;
         $data1=$data;
        $this->session->set_userdata($newdata);
        $data['employee_detail'] = $this->report_model->listTimesheetReport($data);
        $data['employee_hour_rate'] = $this->report_model->list_hour_rate($data1);
        $this->load->view('report_data_content', $data);
    }
    // Added by Satish - add this method to common helper
    function convertToHoursMins($time, $format = "%'.02d:%'.02d") {
        settype($time, 'integer');
        if ($time < 1) {
            return;
        }
        $hours = floor($time / 60);
        $minutes = ($time % 60);
        return sprintf($format, $hours, $minutes);
    }
    // end of method
    function download_report_excel() {
        if (!$this->session->userdata('logged_in')) {
            redirect(site_url("login"), 'refresh');
        } 
        $all_userdata = $this->session->userdata('logged_in');
        $data['userPrimeryId'] = $all_userdata['userPrimeryId'];
        // $viewBy = $this->session->userdata('viewBy');
        $viewBy = $this->session->userdata('viewBy');   
        //$viewBy='company';
        $data['viewBy'] = $this->session->userdata('viewBy');
        $data['isBillable']= $this->session->userdata('isBillable');
        $data['companyId'] = $this->session->userdata('companyId');
        $data['clientId'] = $this->session->userdata('clientId');
        $data['projectId'] = $this->session->userdata('projectId');
        $data['employeeId'] = $this->session->userdata('employeeId');
        $data['teamId'] = $this->session->userdata('teamId');
        $data['activityId']=$this->session->userdata('activityId');
        $data['taskId']= $this->session->userdata('taskId');
        $data['teamId'] = $this->session->userdata('teamId');
        $startDate=$this->session->userdata('startDate');
        $endDate=$this->session->userdata('endDate');
        $data['billable']=$this->session->userdata('billable');
        $data['description']=$this->session->userdata('description');
        $start_date=(!empty($startDate))? date('Y-m-d', strtotime($startDate)):'';
        $end_date=(!empty($endDate))? date('Y-m-d', strtotime($endDate)):'';
        $data['startDate']=$start_date;
        $data['endDate']=$end_date;
        $description = $data['description'];
        $employee_detail = $this->report_model->listTimesheetReport($data); 
        $employee_hour_rate = $this->report_model->list_hour_rate($data); //echo "<pre>"; print_r($employee_hour_rate); echo "</pre>"; die;
        $common = new Common();
        //load our new PHPExcel library
        $this->load->library('excel');
        //activate worksheet number 1
        $this->excel->setActiveSheetIndex(0);
        //name the worksheet
        $this->excel->getActiveSheet()->setTitle('Timesheet Report');
        //set cell A1 content with some text
        $col = 0;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Company');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Client');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Project');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Team');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'User');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Activity');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Disbursement');
        $col ++; 
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Descriptions');
        $col ++; 
        // $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Time/Units');
        // $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Billable');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Date');
        $col ++; 		
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Start Date');
        $col ++; 
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'End Date');
        $col ++; 
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Time (HH:mm)');
        $col ++;
        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Amount');
        $col ++;
        $row = 2;
        $counter = 0;
        $companyName = '';
        $oldVal = '';
        $to = 0;
        $toMinute = 0;     
        $totalFinaMurVal = 0;  
        $workmintes = 0;          
        if(!empty($employee_detail)){
            foreach($employee_detail as $emp_detail){                                        
                $tempVal = getViewByVal($viewBy, $emp_detail);
                if ($oldVal == "" && $counter ==1) {
                    $oldVal = $tempVal;
                    // $row++;
                    $col = 0;
                    $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $tempVal);
                    $row++;
                }else if($oldVal == $tempVal){

                } 
                else {
                    if ($tempVal != '') {
                        // $row++;
                        $oldVal = $tempVal;
                        $col = 0;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, 'Total');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        if ($description == 1) {
                            $col++;
                        }
                        // $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, @$total_units);
                        // $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, @$total_hours_data);
                        $col++;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, number_format($totalFinaMurVal, 2));
                        $row++; // next Rows 
                        $col = 0;
                        $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $tempVal);
                        //$col++;
                        $row++;
                    }
                    $total_units = 0;
                    $to = 0;
                    $toMinute = 0;
                }
                $t2 = $emp_detail->end_time;
                $t1 = $emp_detail->start_time;
                $e_seconds = strtotime($t2);
                $s_seconds = strtotime($t1);
                $end_time = $t2;
                $seconds = strtotime($end_time);
                $st_time = $t1;
                $seconds = strtotime($st_time);
                $total = $e_seconds - $s_seconds;
                $minut = $total / 60;$workmintes= $workmintes + $minut;
                $total_hours1 = $this->convertToHoursMins($minut);
                @$to = $to + $total;
                $minut = $to / 60;
                $total_hours_data = $this->convertToHoursMins($minut);//gmdate("H:i", ($minut * 60));

                //----------- GET MUR RATE FROM HELPER ACCORDING TO DATE START --------
                // $getMurRateHelper = $common->userRoleRateMur($emp_detail->id, $emp_detail->timesheet_date);

                // if($getMurRateHelper){
                //     $rate_mur = $getMurRateHelper->hourly_rate;
                // } else{
                    $rate_mur = 0;
                // }
        
                //----------- GET MUR RATE FROM HELPER ACCORDING TO DATE END --------
                $forMinuteMurVal = explode(':',$total_hours1);
                $forMinuteMurValCalculate = $forMinuteMurVal[1]*0.0167;
                $HourMurVal = $forMinuteMurVal[0]+$forMinuteMurValCalculate;
                $FinalMurVal = $HourMurVal*$rate_mur;
                foreach ($employee_hour_rate as $hr_rate){ //echo $emp_detail->emp_id.$hr_rate->user_id.$emp_detail->timesheet_date.$hr_rate->date; die;
                    if(($emp_detail->emp_id==$hr_rate->user_id) && ($emp_detail->timesheet_date>=$hr_rate->date && $emp_detail->timesheet_date<=$hr_rate->end_date)){ 
                        $FinalMurVal = $HourMurVal* $hr_rate->hourly_rate;
                    break;
                    }
                }
                $totalFinaMurVal = $totalFinaMurVal + $FinalMurVal;

                if($emp_detail->billable == 0){
                    $billable = "No";
                }else{
                    $billable = "Yes";
                }

                $col = 0;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->company_name);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->client_name);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->project_name);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->team_name);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->empName .$emp_detail->surname);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail-> activity_name);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->disbursement);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->comments);
                $col ++;
                // $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->time_units);
                // $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->billable);
                $col ++;
	            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, date('d F Y',  strtotime($emp_detail->timesheet_date)));
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->start_time);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $emp_detail->end_time);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $total_hours1);
                $col ++;
                $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, number_format($FinalMurVal, 2));
                $row++;
                $total_units=@$total_units+$emp_detail->time_units;
            } 
            //$oldVal = $tempVal;
            //  $row++;
            $col = 0;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, 'Total');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;  
            if ($description == 1) {
                $col++;
            }
            // $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, @$total_units);
            // $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, '');
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $this->convertToHoursMins($workmintes));
            $col++;
            $this->excel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, number_format($totalFinaMurVal, 2));
            $col++;
        }
        $filename='Timesheet Report.xls'; //save our workbook as this file name    
        header('Content-Type: application/vnd.ms-excel'); //mime type
        header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
        header('Cache-Control: max-age=0'); //no cache

        //save it to Excel5 format (excel 2003 .XLS file), change this to 'Excel2007' (and adjust the filename extension, also the header mime type)
        //if you want to save it as .XLSX Excel 2007 format
        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');  
        //force user to download the Excel file without writing it to server's HD
        $objWriter->save('php://output');
    }

    function project_wise_report() {
        if (!$this->session->userdata('logged_in')) {
            redirect(site_url("login"), 'refresh');
        }
        $all_userdata = $this->session->userdata('logged_in');
        $data = array();
        $data['userPrimeryId'] = $all_userdata['userPrimeryId'];
        $getUserPrivileges = $this->common_model->getUserPrivileges($data);
        $data['userPrivileges'] = json_decode($getUserPrivileges->user_privileges);
        if(!empty($all_userdata['userTmId'])){
            $data['client_detail'] = $this->client_model->listClientNew($all_userdata['userUname']);
        }
        else{
            $data['client_detail'] = false;   
        }

        // $data['project_detail'] = $this->project_model->listProject();
        // $data['project_detail'] = $this->project_model->listProject_report();

        // $data['activity_detail'] = $this->activity_model->listActivity();
        // $data['subactivity_detail'] = $this->subactivity_model->listSubactivity();
        // $data['user_detail'] = $this->userdetails_model->listUserdetails();
        // $data['team_details'] = $this->team_model->detailTeam();
        // $data['task_detail'] = $this->task_model->taskDetail();
        $data['user_logo'] = $this->report_model->logoDetail($data['userPrimeryId']);
        $data['page_url'] = 'project_wise_report_content';
        $this->load->view('dashboard_page', $data);
    }
    
    function submit_project_wise_report() {
        if (!$this->session->userdata('logged_in')) {
            redirect(site_url("login"), 'refresh');
        }
        $all_userdata = $this->session->userdata('logged_in');
        $data = array();
        $data['userPrimeryId'] = $all_userdata['userPrimeryId'];
        $getUserPrivileges = $this->common_model->getUserPrivileges($data);
        $data['userPrivileges'] = json_decode($getUserPrivileges->user_privileges);
        $data['user_logo'] = $this->report_model->logoDetail($data['userPrimeryId']);
        $data['clientId'] = $this->input->post('clientId');
        $data['projectId'] = $this->input->post('projectId');
        $data['startDate']=$this->input->post('startDate');
        $data['endDate']=$this->input->post('endDate');
        $start_date=(!empty($data['startDate']))? date('Y-m-d', strtotime($data['startDate'])):'';
        $end_date=(!empty($data['endDate']))? date('Y-m-d', strtotime($data['endDate'])):'';
        $this->db->select('project_id,project_name,client_name');
        $this->db->from('project');
        $this->db->where('project_name', $data['projectId']);
        $this->db->where('client_name',$data['clientId']);
        $pro_query = $this->db->get();
        $pro_result = $pro_query->result();

        $project_id = $pro_result[0]->project_id;
        if($project_id){
            $this->db->select('*');
            $this->db->from('task');
            $this->db->where('project_id', $project_id);
            $task_query = $this->db->get();
            $task_result = $task_query->result_array();
            $task_detail = [];
            echo '<pre>';
            foreach ($task_result as $key => $value) {
                $task_detail[$value['task_name']] = $value;
            } 
            print_r($task_detail);
        }


        if(!empty($data)){
            $requet_data['clientId'] = $data['clientId'];
            $requet_data['projectId'] = $data['projectId'];
            $requet_data['startDate'] = $start_date;
            $requet_data['endDate'] = $end_date;
            $data['report_detail'] = $this->report_model->listProjectWiseReport($requet_data);
            
            // echo $this->db->last_query();
            print_r($data['report_detail']);
            $final_report_data = [];
            foreach ($task_detail as $key => $value) {
                foreach ($data['report_detail'] as $key1 => $value1) {
                    if(in_array($key,$value1)){
                        $final_report_data[][$key] = $value1;
                    }
                }
            }
            // print_r($final_report_data);
            // die;
            // $task_names = [];
            // foreach ($data['report_detail'] as $key => $value) {
            //     if()
            // }
            echo '</pre>';
            $this->load->view('project_wise_report_data_content', $data);
        }
    }
    public function timesheet_report_pending() {
        if (!$this->session->userdata('logged_in')) {
            redirect(site_url("login"), 'refresh');
        }
            $all_userdata = $this->session->userdata('logged_in'); 
            $data = array();
            $data['userPrimeryId'] = $all_userdata['userPrimeryId'];
            $getUserPrivileges = $this->common_model->getUserPrivileges($data);
            $data['userPrivileges'] = json_decode($getUserPrivileges->user_privileges);
            $data['pending_report'] = $this->report_model->pending_report();
            $data['page_url'] = 'pending_report';
            $this->load->view('dashboard_page', $data);
    }
    function approve_pending_report(){ 
       $id = $this->input->post('id');
       $status = $this->input->post('status');
       $remarks = $this->input->post('remarks');
       $this->db->set('approver_remarks', $remarks)->set('action_by', $this->session->userdata('logged_in')['userUname'])
                ->set('status', $status)->set('action_date', date('Y-m-d H:i:s'))
                ->where('timesheet_id', $id)->update('timesheet_pending');
       if($status=='2'){
        $this->db->select('timesheet_id, emp_id, timesheet_date, start_time, end_time, client_name, activity_name, subactivity_name, task_name, billable, time_units, time_minutes, comments, time_status, reason_to_reject, reason_to_exceed_time, project_name, created_by, updated_by, created, updated, disbursement')->from('timesheet_pending')->where('timesheet_id', $id);
        $data = $this->db->get()->result_array();  //echo "<pre>";print_r($claims); echo "</pre>"; die;
        $this->db->insert_batch('timesheet', $data);
        $this->session->set_flashdata('flash_message', "Selected TimeSheet has been approved successfully.");
       }else{
        $this->db->select('emp_id, timesheet_date')->from('timesheet_pending')->where('timesheet_id', $id);
        $data1 = $this->db->get()->result_array();
        $this->db->select('empName, emailId')->from('employee')->where('id', $data1[0]['emp_id']);
        $data2 = $this->db->get()->result_array();
        $MailSubject = 'Timesheet Rejection for '.$data1[0]['timesheet_date'];
        $email_message = PENDING_TIMESHEET_REJECTED;
        $MailTemplateContents = str_replace('EMP_NAME', $data2[0]['empName'], $email_message);
        $MailTemplateContents = str_replace('DATE', $data1[0]['timesheet_date'], $MailTemplateContents);
        $common = new Common();
        $Status = $common->sendmail($data2[0]['emailId'], $MailSubject, $MailTemplateContents);
        $this->session->set_flashdata('fail_flash_message', "Selected TimeSheet has been rejected successfully.");
       }

    }
}
