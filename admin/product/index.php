<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Products</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" id="create_product" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Create New</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
				<colgroup>
					<col width="5%">	<!-- UID --> 
					<col width="5%">	<!-- Mã sản phẩm -->
					<col width="30%">	<!-- Tên sản phẩm -->
					<col width="5%">	<!-- Số lượng -->
					<col width="10%">	<!-- Giá -->
					<col width="10%">	<!-- Loại sản phẩm -->
					<col width="10%">	<!-- Thương hiệu -->
					<col width="10%">	<!-- Xuất xứ -->
					<col width="5%">	<!-- Hình ảnh -->
					<col width="10%">	<!-- Actions -->
				</colgroup>
				<thead>
					<tr>
						<th>Mã sản phẩm</th>
						<th>UID</th>
						<th>Tên sản phẩm</th>
						<th>Số lượng</th>
						
						<th>Giá</th>
						<th>Loại sản phẩm</th>
						<th>Thương hiệu</th>
						<th>Xuất xứ</th>
						<th>Hình ảnh</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$qry = $conn->query("SELECT * from sanpham");
						while($row = $qry->fetch_assoc()): {}
					?>
						<tr>
						 	<!-- <td class="text-center"><?php echo $i++; ?></td> -->
						 	<td><?php echo $row["MASP"] ?></td>
						 	<td><?php echo $row['UID'] ?></td>
						 	<td><?php echo $row['TenSP'] ?></td>
						 	<td><?php echo $row['SOLUONG'] ?></td>
						 	<td><?php echo $row['GIA'] ?></td>
						 	<td><?php echo $row['LOAISP'] ?></td>
						 	<td><?php echo $row['Thuonghieu'] ?></td>
						 	<td><?php echo $row['Xuatxu'] ?></td>
						 	<td><img src="<?php echo $row['Hinh'] ?>" alt="" style="width: 100px; height: 100px"></td>
						 	<td align="center">
						 		 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                   		Action
				                     <span class="sr-only">Toggle Dropdown</span>
				                   </button>
				                   <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['MASP'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
				                    	<div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['MASP'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                   </div>
						 	</td>
						 </tr> 
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#create_product').click(function(){
			uni_modal("<i class='fa fa-plus'></i> New Product","product/manage.php","small-large")
		})
		$('.edit_data').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Update Product","product/manage.php?id="+$(this).attr('data-id'),"mid-large")
		})
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this product permanently?","delete_product",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
		$('#uni_modal').on('shown.bs.modal', function() {
			$('.select2').select2({width:'resolve'})
			$('.summernote').summernote({
				height: 200,
				toolbar: [
					[ 'style', [ 'style' ] ],
					[ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
					[ 'fontname', [ 'fontname' ] ],
					[ 'fontsize', [ 'fontsize' ] ],
					[ 'color', [ 'color' ] ],
					[ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
					[ 'table', [ 'table' ] ],
					[ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
				]
			})
		})
	})
	function delete_product($MASP){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_product",
			method:"POST",
			data:{MASP: $MASP},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>