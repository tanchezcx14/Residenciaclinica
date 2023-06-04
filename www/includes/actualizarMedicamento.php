<?php
	include('../conexion.php');
	$con=conectar();

	$idMedicamento = $_POST['idMedicamento'];
	$Ingrediente = $_POST['Ingrediente'];
	$marca = $_POST['marca'];
	$lote = $_POST['lote'];
	$Controlado = $_POST['Controlado'];
	$dosis = $_POST['dosis'];
	$ubicacion = $_POST['ubicacion'];
	$notas = $_POST['notas'];
	$presentacion = $_POST['presentacion'];
	$unidades = $_POST['unidades'];
	$via = $_POST['via'];
	$caducidad = $_POST['caducidad'];
	$idUsuario=$_POST['idUsuario'];

	/*
	medicamentos (
		idMedicamento -> idMedicamento
		activoprincipalMedicamento -> Ingrediente
		controlMedicamento -> Controlado
		dosis -> dosis
		idPresentacion -> presentacion
		idDosis -> via
	)

	clinicatienemedicamento (
		marca -> marca
		loteMedicamento -> lote
		cantidadMedicamento -> unidades
		fechadecaducidadMedicamento -> caducidad
		idClinica,
		idMedicamento,
	)
	*/
	$cad="";
	$selectMed = "select * from medicamentos where idMedicamento='$idMedicamento'"; 
	$queryMed = mysqli_query($con, $selectMed);
	$rowMed = mysqli_fetch_assoc($queryMed);
    if($rowMed['activoprincipalMedicamento']!= $Ingrediente){
        $cad.="<tr><td><strong>In. Activo</strong></td><td>".$rowMed['activoprincipalMedicamento']."</td><td>".$Ingrediente."</td></tr>";
    }
    if($rowMed['controlMedicamento']!= $Controlado){
        if($rowMed['controlMedicamento']==1){
            $control1 = "Si";
        }else{
            $control1 = "No";
        }
        if($Controlado==1){
            $control2 = "Si";
        }else{
            $control2 = "No";
        }
        $cad.="<tr><td><strong>Controlado</strong></td><td>".$control1."</td><td>".$control2."</td></tr>";
    }
    if($rowMed['dosis']!= $dosis){
        $cad.="<tr><td><strong>Dosis</strong></td><td>".$rowMed['dosis']."</td><td>".$dosis."</td></tr>";
    }
    if($rowMed['ubicacion']!= $ubicacion){
        $cad.="<tr><td><strong>Ubicacion</strong></td><td>".$rowMed['ubicacion']."</td><td>".$ubicacion."</td></tr>";
    }
    if($rowMed['notas']!= $notas){
        $cad.="<tr><td><strong>Notas</strong></td><td>".$rowMed['notas']."</td><td>".$notas."</td></tr>";
    }
    if($rowMed['idPresentacion']!= $presentacion){
        if($rowMed['idPresentacion']==1){
            $pres1 = "Tableta";
        }else if($rowMed['idPresentacion']==2){
            $pres1 = "Capsula";
        }else if($rowMed['idPresentacion']==3){
            $pres1 = "Supositorio";
        }else if($rowMed['idPresentacion']==4){
            $pres1 = "Pomada";
        }else if($rowMed['idPresentacion']==5){
            $pres1 = "Crema";
        }else if($rowMed['idPresentacion']==6){
            $pres1 = "Jarabe";
        }
        
        if($presentacion==1){
            $pres2 = "Tableta";
        }else if($presentacion==2){
            $pres2 = "Capsula";
        }else if($presentacion==3){
            $pres2 = "Supositorio";
        }else if($presentacion==4){
            $pres2 = "Pomada";
        }else if($presentacion==5){
            $pres2 = "Crema";
        }else if($presentacion==6){
            $pres2 = "Jarabe";
        }
        $cad.="<tr><td><strong>Presentacion</strong></td><td>".$pres1."</td><td>".$pres2."</td></tr>";
    }
    if($rowMed['idDosis']!= $via){
        if($rowMed['idDosis']==1){
            $via1 = "Oral";
        }else if($rowMed['idDosis']==2){
            $via1 = "Inyectada";
        }else if($rowMed['idDosis']==3){
            $via1 = "Intravenosa";
        }
        
        if($via==1){
            $via2 = "Oral";
        }else if($via==2){
            $via2 = "Inyectada";
        }else if($via==3){
            $via2 = "Intravenosa";
        }
        $cad.="<tr><td><strong>Via de Administracion</strong></td><td>".$via1."</td><td>".$via2."</td></tr>";
    }

	$sqlMedicamento = "UPDATE medicamentos SET
	idMedicamento = '$idMedicamento',
	activoprincipalMedicamento = '$Ingrediente',
	controlMedicamento = '$Controlado',
	dosis = '$dosis',
	ubicacion = '$ubicacion',
	notas = '$notas',
	idPresentacion = '$presentacion',
	idDosis = '$via'
	WHERE idMedicamento='$idMedicamento'"; 

    $queryMedicamento = mysqli_query($con, $sqlMedicamento);

    $cad2="";
	$selectCli = "select * from clinicatienemedicamento where idMedicamento='$idMedicamento'"; 
	$queryCli = mysqli_query($con, $selectCli);
	$rowCli = mysqli_fetch_assoc($queryCli);
	if($rowCli['marca']!= $marca){
	    $cad2.="<tr><td><strong>Marca</strong></td><td>".$rowCli['marca']."</td><td>".$marca."</td></tr>";
	}
	if($rowCli['loteMedicamento']!= $lote){
	    $cad2.="<tr><td><strong>Lote</strong></td><td>".$rowCli['loteMedicamento']."</td><td>".$lote."</td></tr>";
	}
	if($rowCli['cantidadMedicamento']!= $unidades){
	    $cad2.="<tr><td><strong>Unidades</strong></td><td>".$rowCli['cantidadMedicamento']."</td><td>".$unidades."</td></tr>";
	}
	if($rowCli['fechadecaducidadMedicamento']!= $caducidad){
	    $cad2.="<tr><td><strong>Fecha</strong></td><td>".$rowCli['fechadecaducidadMedicamento']."</td><td".$caducidad."</td></tr>";
	}
	date_default_timezone_set("America/Tijuana");
    $cad2.="<tr><td class=\'fechr\' colspan=\'3\'>Ultima Modificacion: ".date('d-m-Y')." a las ".date("h:i:sa")."</td></tr>";
    // echo $sql_hist;
    $sqlClinica = "UPDATE clinicatienemedicamento SET
	marca = '$marca',
	loteMedicamento = '$lote',
	cantidadMedicamento = '$unidades',
	fechadecaducidadMedicamento = '$caducidad'
	WHERE idMedicamento = '$idMedicamento'
	AND idUsuario='$idUsuario'";

	$queryClinica = mysqli_query($con, $sqlClinica);
    
    

	$sql_hist = "INSERT INTO historial VALUES(
		DEFAULT,
		$idMedicamento,
		'$Ingrediente',
		'$marca',
		'$lote',
		'$Controlado',
		'$dosis',
		'$presentacion',
		'$unidades',
		'$caducidad',
		'$via',
		'$idUsuario',
		CURRENT_TIMESTAMP(),
		(
				SELECT
					CONCAT(
						'Medicamento '
						, m.activoprincipalMedicamento
						, ' id(', m.idMedicamento, ') actualizado por '
						, u.nombreUsuario, ' (', u.correo, ').<br><strong>Valores Modificados</strong><br><table class=\'tmodif\'><tr><th>Campo</th><th>Anterior</th><th>Actual</th></tr>$cad.$cad2</table>'
					) AS MSG
				FROM
					usuarios u
					LEFT JOIN medicamentos m
						ON m.idMedicamento = $idMedicamento
				WHERE u.idUsuario = '$idUsuario'
			)
	)";
	mysqli_query($con, $sql_hist);


	if($queryClinica&&$queryMedicamento){
		Header("Location: ../vistas/inicio.php?update=successfully");
	}
?>
