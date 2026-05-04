
<style>
.has-text-centered {
    text-align: center !important;
    pad
}

p {
    margin-top: 5px !important;
    margin-bottom: 1rem !important;
}
</style>

<?php
	 use app\controllers\FuncionesController; 
	 $Cinst = new FuncionesController();  

    
	require('fpdf/fpdf.php');

	
?>

<div class="container">

    

	<h2>Alquiler</h2>

	<div class="row mb-3">
		<div class="col-md-3">
			<label>Fecha inicio</label>
			<input type="date" id="fecha_inicio" class="form-control">
		</div>
		<div class="col-md-3">
			<label>Fecha fin</label>
			<input type="date" id="fecha_fin" class="form-control">
		</div>
		<div class="col-md-3 d-flex align-items-end">
			<button class="btn btn-success" onclick="filtrarFechas()">🔍 Filtrar</button>
		</div>
	</div>

	<button class="btn btn-primary mb-2" onclick="nuevoAlquiler()">➕ Nuevo Alquiler</button>
	

	<table class="table table-bordered table-striped">
		  <thead>
		    <tr><th>ID</th><th>Cliente</th><th>Dirección</th><th>Teléfono</th><th>Fecha evento</th><th>Fecha</th><th>Monto</th><th>Adelanto</th><th>Observaciones</th></tr>
		  </thead>
		  <tbody>
			  <?php

			   		//$consulta_datos="SELECT * FROM alquiler WHERE fechaevento::date >= CURRENT_DATE;"; 

					

					$condiciones = [];

					if (!empty($_GET['fecha_inicio'])) {
						$fecha_inicio = $_GET['fecha_inicio'];
						$condiciones[] = "a.fechaevento::date >= '$fecha_inicio'";
					}

					if (!empty($_GET['fecha_fin'])) {
						$fecha_fin = $_GET['fecha_fin'];
						$condiciones[] = "a.fechaevento::date <= '$fecha_fin'";
					}

					// Si no hay filtros, comportamiento por defecto
					if (empty($condiciones)) {
						$condiciones[] = "a.fechaevento::date >= CURRENT_DATE";
					}

					$where = "WHERE " . implode(" AND ", $condiciones);

					//$consulta_datos = "SELECT * FROM alquiler a $where ORDER BY fechaevento ASC;";

					$consulta_datos = "SELECT a.idalquiler, a.cliente, a.direccion, a.telefono, a.fechaevento, a.fecha, 
						a.adelanto, a.observaciones, a.fecharegistro,
						SUM(d.cantidad * d.precio) AS monto
					FROM alquiler a
					INNER JOIN dalquiler d
						ON a.idalquiler = d.idalquiler
					$where 
					GROUP BY a.idalquiler, a.cliente, a.direccion, a.telefono, a.fechaevento, a.fecha, 
						a.adelanto, a.observaciones, a.fecharegistro
					ORDER BY a.fechaevento ASC;";
                    $datos = $Cinst->Ejecutar($consulta_datos); 					
					 while($row=$datos->fetch()){

						echo "<tr>
							<td width='50'>{$row['idalquiler']}</td>
							<td width='200'>{$row['cliente']}</td>
							<td width='200'>{$row['direccion']}</td>
							<td width='20'>{$row['telefono']}</td>
							<td width='100'>" . date('d/m/Y', strtotime($row['fechaevento'])) . "</td>
							<td width='100'>" . date('d/m/Y', strtotime($row['fecha'])) . "</td>
							<td width='100'>" ."C$ ". number_format($row['monto'], 2, '.', ',') . "</td>
        					<td width='100'>" ."C$ ". number_format($row['adelanto'], 2, '.', ',') . "</td>
							<td width='200'>{$row['observaciones']}</td>
							<td>
								<button class='btn btn-sm btn-warning' onclick=\"editarAlquiler({$row['idalquiler']},'{$row['cliente']}','{$row['direccion']}','{$row['telefono']}','{$row['fechaevento']}','{$row['fecha']}','{$row['monto']}','{$row['adelanto']}','{$row['observaciones']}')\">✏️ Editar</button>
								<button class='btn btn-sm btn-info' onclick=\"verAlquiler({$row['idalquiler']})\">📋 Detalles</button>
								<button class='btn btn-sm btn-info' onclick=\"window.open('app/views/content/imp_alquiler-view.php?idalquiler='+{$row['idalquiler']}, '_blank')\">📋 Imprimir</button>
							</td>
						</tr>";

					}
				?>
		</tbody>

	</table>

	<!-- Grilla de Alquileres -->
	<div id="detalleAlquiler" class="mt-5"></div>
	<!-- Modal Alquiler -->
	<div class="modal" tabindex="-1" id="modalAlquiler">
		<div class="modal-dialog">
			<form id="formAlquiler" class="modal-content">
				<div class="modal-header"><h5 class="modal-title">Alquiler</h5></div>
				<div class="modal-body">
					<input type="hidden" name="idalquiler" id="idalquiler">			
					<div class="mb-2">
						<label>Cliente</label>
						<input type="text" name="cliente" id="cliente" class="form-control" required>
					</div>
					<div class="mb-2">
						<label>Dirección</label>
						<input type="text" name="direccion" id="direccion" class="form-control" required>
					</div>
					<div class="mb-2">
						<label>Teléfono</label>
						<input type="tel" name="telefono" id="telefono" class="form-control" placeholder="8373-2842" maxlength="9" required>
					</div>
					<div class="mb-2">
						<label>Fecha Evento</label>
						<input type="date" name="fechaevento" id="fechaevento" class="form-control" required>
					</div>
					<div class="mb-2">
						<label>Fecha</label>
						<input type="date" name="fecha" id="fecha" class="form-control" readonly>
					</div>
					<div class="mb-2">
						<label>Monto</label>					
						<input type="text" name = "monto" id="monto" placeholder="0.00"  required>				
					</div>
					<div class="mb-2">
						<label>Adelanto</label>
						<input type="text" name = "adelanto" id="adelanto" placeholder="0.00"  required>								
					</div>
					<div class="mb-2">
						<label>Observaciones</label>
						<input type="text" name="observaciones" id="observaciones" class="form-control">
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">Guardar</button>					
					<button type="button" class="btn btn-secondary" onclick="modalAlquiler.hide()">Cancelar</button>

				</div>
			</form>
		</div>
	</div>


	

	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->
	 <link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>

	<script>

			const APP_URLx = "<?php echo APP_URL; ?>";
			let modalAlquiler = new bootstrap.Modal(document.getElementById('modalAlquiler'));

		

			function nuevoAlquiler() {
			$("#idalquiler").val();
			$("#cliente").val();	
			$("#direccion").val();	
			$("#telefono").val();	
			$("#fechaevento").val();	
			$("#fecha").val();	
			$("#monto").val();	
			$("#adelanto").val();	
			$("#observaciones").val();	
			modalAlquiler.show();
			}

			function editarAlquiler(idalquiler,cliente,direccion,telefono,fechaevento,fecha,monto,adelanto,observaciones ) {
			$("#idalquiler").val(idalquiler);
			$("#cliente").val(cliente);	
			$("#direccion").val(direccion);	
			$("#telefono").val(telefono);	
			$("#fechaevento").val(fechaevento);	
			$("#fecha").val(fecha);	
			$("#monto").val(monto);	
			$("#adelanto").val(adelanto);	
			$("#observaciones").val(observaciones);	
			modalAlquiler.show();
			}


			$("#formAlquiler").submit(function(e){
				e.preventDefault();

				$.post(APP_URLx + "app/views/content/Alquiler_save.php", 
					$(this).serialize(), 
					function(data){   // 👈 Aquí sí recibe 'data'
						if (data.success) {
							alert(data.message); 
							location.reload();
						} else {
							alert(data.message);
						}
					}, 
					"json" // 👈 Esto indica que esperas una respuesta JSON
				);
			});

			
			function verAlquiler(idalquiler){
				$("#detalleAlquiler").load(APP_URLx + "app/views/content/dalquiler-view.php?idalquiler="+idalquiler);
			}

		

			// Función para formatear a moneda
			function formatearMoneda(input) {
				input.addEventListener('input', (e) => {
					let value = e.target.value;

					// Eliminar cualquier caracter que no sea número
					value = value.replace(/\D/g, '');

					// Convertir a número y dividir entre 100 para centavos
					value = (Number(value) / 100).toFixed(2);

					// Formatear a moneda
					e.target.value = new Intl.NumberFormat('es-NI', {
						style: 'currency',
						currency: 'NIO'
					}).format(value);
				});
			}

			// Seleccionamos los inputs
			const montoInput = document.getElementById('monto');
			const adelantoInput = document.getElementById('adelanto');

			// Aplicamos la función a ambos
			formatearMoneda(montoInput);
			formatearMoneda(adelantoInput);			


			const telefonoInput = document.getElementById('telefono');

			telefonoInput.addEventListener('input', (e) => {
				let value = e.target.value;

				// Eliminar todo lo que no sea número
				value = value.replace(/\D/g, '');

				// Limitar a 8 dígitos
				value = value.slice(0, 8);

				// Formatear como 8373-2842
				if (value.length > 4) {
					value = value.slice(0, 4) + '-' + value.slice(4);
				}

				e.target.value = value;
			});
			
			const fechaInput = document.getElementById('fecha');

			// Obtener fecha actual
			const hoy = new Date();

			// Formatear como YYYY-MM-DD
			const yyyy = hoy.getFullYear();
			const mm = String(hoy.getMonth() + 1).padStart(2, '0'); // Enero es 0
			const dd = String(hoy.getDate()).padStart(2, '0');

			fechaInput.value = `${yyyy}-${mm}-${dd}`;


			function filtrarFechas() {
				let inicio = document.getElementById('fecha_inicio').value;
				let fin = document.getElementById('fecha_fin').value;

				// if (!inicio || !fin) {
				// 	alert("Seleccione ambas fechas");
				// 	return;
				// }
				
				window.location.href = "index.php?views=Alquiler&fecha_inicio=" + inicio + "&fecha_fin=" + fin;
				
			}



  </script>

</div>



