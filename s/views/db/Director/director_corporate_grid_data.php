
<table class="dynamicTable2 tableTools dt_width table table-striped overflow-x">
    <thead>
        <tr style="background-color:#c72a25; color:#FFF;">
            <th class="thead-th-padg" width="160px">Name of entity</th>
            <th class="thead-th-padg" width="160px">Represented by</th>
            <th class="thead-th-padg" width="160px">Registered in</th>
            <th class="thead-th-padg" width="160px" style="text-align:center;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($grid_data as $item) { 
        ?>
        <tr class="gradeX">
            <td><span class="td-text-area"><?php echo $item['entity_name'];?></span></td>
            <td><span class="td-text-area"><?php echo $item['represented_by'];?></span></td>
            <td><span class="td-text-area"><?php echo $item['registered_in'];?></span></td>
            <td style="width:100px !important; text-align:center;" class="">
                <a onclick="edit_director_crp_bar(<?php echo $item['director_corp_id'];?>);" href="#edit-corporate-modal-box" data-toggle="modal" class="btn-xs btn-warning" style="margin-left:5px;">Edit</a>
                <a onclick="delete_director_crp_bar(<?php echo $item['director_corp_id'];?>);" href="#delete-corporate-modal-box" data-toggle="modal" class="btn-xs btn-danger" style="margin-left:5px;">Delete</a>
            </td>
        </tr>
        <?php } ?>
    </tbody>
</table>