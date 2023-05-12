
clear
################################ LES FONCTIONS ############################
getTotalRecords()
{
    total=`cat $dbfile | wc -l`
	echo "Total records :"$total	
}		
viewAllRecords()
{
	total=`cat $dbfile | wc -l`
	echo "Total records :"$total
	if [ $total -gt 0 ]
	then
		i=1
		while [ $i -le $total ]
		do
		echo "===================================="
			echo -e "\t Patient - "$i
			echo "===================================="
			record=`cat $dbfile | head -$i | tail -1`
			code_pat=`echo $record | cut -d "|" -f1`
			nom_pat=`echo $record | cut -d "|" -f2`
			postnom_pat=`echo $record | cut -d "|" -f3`
			sexe_pat=`echo $record | cut -d "|" -f4`
			adresse_pat=`echo $record | cut -d "|" -f5`
			telephone_pat=`echo $record | cut -d "|" -f6`
			email_pat=`echo $record | cut -d "|" -f7`
			origine_pat=`echo $record | cut -d "|" -f8`
			poids_pat=`echo $record | cut -d "|" -f9`
			profession_pat=`echo $record | cut -d "|" -f10`
			datenais_pat=`echo $record | cut -d "|" -f11`
			echo "Code Patient :" $code_pat
			echo "Nom Patient :" $nom_pat
			echo "Postnom Patient :" $postnom_pat
			echo "Sexe Patient :" $sexe_pat
			echo "adresse Patient :" $adresse_pat
			echo "téléphone Patient :" $telephone_pat
			echo "e-mail Patient :" $email_pat
			echo "Origine Patient :" $origine_pat
			echo "Poids Patient :" $poids_pat
			echo "Profession Patient :" $profession_pat
			echo "Date naissance Patient :" $datenais_pat			

			i=$(( $i + 1 ))			
		done
 else echo "c'est vide"
	fi
}
addRecord()
{
		echo "===================================="
		echo "=	  ENTRER INFORMATION  PATIENT   ="	
		echo "===================================="		
		while [[ ! $code_pat =~ ^[0-9]{8}+$ ]]; do
		    echo -n "Entrer code patient :"
		    read code_pat
		    echo -n "$code_pat|" >> $dbfile
		    
		done
		while [[ ! $nom_pat =~ ^[A-Za-z[:blank:]]+$ ]]; do
		    echo -n "Entrer nom patient :"
		    read -r nom_pat
	            echo -n "$nom_pat|" >> $dbfile
		done
		while [[ ! $postnom_pat =~ ^[A-Za-z[:blank:]]+$ ]]; do
		    echo -n "Entrer Postnom patient :"
		    read -r postnom_pat
	            echo -n "$postnom_pat|" >> $dbfile
		done	
		select sexe_pat in male female
		do
		case $sexe_pat in
		male)
			echo "$sexe_pat Selected"
			echo -n "$sexe_pat|" >> $dbfile
			break;
			;;
		female)
			echo "$sexe_pat Selected"
			echo -n "$sexe_pat|" >> $dbfile				
			break;		
			;;
		esac
		done
		while [[ ! $adresse_pat =~ ^[A-Za-z[:blank:]]+$ ]]; do
		    echo -n "Entrer Adresse patient :"
		    read -r adresse_pat
		    echo -n "$adresse_pat|" >> $dbfile
		done
		while [[ ! $telephone_pat =~ ^[0-9]{8}+$ ]]; do
		    echo -n "Entrer téléphone patient :"
		    read telephone_pat
		    echo -n "$telephone_pat|" >> $dbfile
		done
		while [[ ! $email_pat =~ ^[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:].]{2,4}$ ]]; do
		    echo -n "Entrer email patient :"
		    read -r email_pat
		    echo -n "$email_pat|" >> $dbfile
		done
		while [[ ! $origine_pat =~ ^[A-Za-z[:blank:]]+$ ]]; do
		    echo -n "Entrer Origine patient :"
		    read -r origine_pat
		    echo -n "$origine_pat|" >> $dbfile
		done		
		poids_pat=351
		while [[  $poids_pat -gt 350  ]] || [[ $poids_pat -le 0 ]]
		 do
		    echo -n "Entrer Poids patient(KG) :"
		    read -r poids_pat
		    echo -n "$poids_pat KG|" >> $dbfile
		done
		while [[ ! $profession_pat =~ ^[A-Za-z[:blank:]]+$ ]]; do
		    echo -n "Entrer profession patient :"
		    read -r profession_pat
		    echo -n "$profession_pat|" >> $dbfile
		done
		datenais_pat=2019
		while [[  $datenais_pat -gt 2018  ]] || [[ $datenais_pat -lt 1920 ]]
		 do
		    echo -n "Entrer Date naissance patient :"
		    read -r datenais_pat
		    echo  "$datenais_pat|" >> $dbfile
		done
		#record="$code_pat|$nom_pat|$postnom_pat|$sexe_pat|$adresse_pat|$telephone_pat|$email_pat|$origine_pat|$poids_pat|$profession_pat|$datenais_pat"
		#echo $record >> $dbfile
		echo "Employee information added successfully."
}
getEmployeeInformation()
{
		echo "===================================="
		echo "	   FIND PATIENT INFORMATION"	
		echo "===================================="
		echo -n "ENTRER CODE PATIENT  :"
		read no
		total=`cat $dbfile | grep -cwi $no`
		if [ $total -gt 0 ]
		then
			record=`cat $dbfile | grep -wi $no`
			code_pat=`echo $record | cut -d "|" -f1`
			nom_pat=`echo $record | cut -d "|" -f2`
			postnom_pat=`echo $record | cut -d "|" -f3`
			sexe_pat=`echo $record | cut -d "|" -f4`
			adresse_pat=`echo $record | cut -d "|" -f5`
			telephone_pat=`echo $record | cut -d "|" -f6`
			email_pat=`echo $record | cut -d "|" -f7`
			origine_pat=`echo $record | cut -d "|" -f8`
			poids_pat=`echo $record | cut -d "|" -f9`
			profession_pat=`echo $record | cut -d "|" -f10`
			datenais_pat=`echo $record | cut -d "|" -f11`
			echo "Code Patient :" $code_pat
			echo "Nom Patient :" $nom_pat
			echo "Postnom Patient :" $postnom_pat
			echo "Sexe Patient :" $sexe_pat
			echo "adresse Patient :" $adresse_pat
			echo "téléphone Patient :" $telephone_pat
			echo "e-mail Patient :" $email_pat
			echo "Origine Patient :" $origine_pat
			echo "Poids Patient :" $poids_pat
			echo "Profession Patient :" $profession_pat
			echo "Date naissance Patient :" $datenais_pat
		elif [ $total -eq 0 ]
		then
			echo "Il n' ya pas"
		fi
}
deleteEmployee()
{
		echo "===================================="
		echo "	   DELETE PATIENT INFORMATION"	
		echo "===================================="

		while [[ ! $no =~ ^[0-9]{8}+$ ]]; do
		    echo -n "Entrer code patient :"
		    read no
		done

		if grep -q $no data 
		then 		    
		    grep -v $no data > data1
		    mv data1 data
		    echo " Patient supprimé"
		else
		    echo "code n'existe pas" 
		fi
				

		
}
modifyRecord()
{
	echo "===================================="
	echo "	   MODIFY PATIENT INFORMATION"	
	echo "===================================="
	while [[ ! $no =~ ^[0-9]{8}+$ ]]; do
	    echo -n "Entrer code patient :"
	    read no
	done
	total=`cat $dbfile | grep -cwi $no`
	if [ $total -gt 0 ]
	then
		record=`cat $dbfile | grep -wi $no`
		echo "================================================="
		echo "	   ENTER EMPLOYEE INFORMATION FOR ID : $no"	
		echo "================================================="
		echo -n "Enter employee name :"		
		read name
		echo -n "Enter employee address :"	
		read add
		echo -n "Enter employee age :"	
		read age
		echo -n "Enter employee gender :"	
		read gen
		echo -n "Enter employee designation :"	
		read desc
		echo -n "Enter employee salary :"	
		read sal	
		updatedrecord="$no|$name|$add|$age|$gen|$desc|$sal"
		#updates=$(`cat $dbfile` | sed s/$record/$updatedrecord/g)
		totalrecords=`cat $dbfile | wc -l`
		i=1
		while [ $i -le $totalrecords ]
		do
			record=`cat $dbfile | head -$i | tail -1`
			findrecord=`echo $record | grep -wci $no`
			if [ $findrecord -eq 0 ]
			then
				echo "$record" >> "tempdata"
			else
				echo "$updatedrecord" >> "tempdata"				
			fi
			i=`expr $i + 1`			
		done
		mv "tempdata" "data"
		echo "Record updated successfully"
	else
		echo "Record with this id not found"
	fi			
}
############################ END OF FUNCTION DECLARATIONS #########################
dbfile="data"
 
echo "===== AVAILABLE CHOICES ====="
echo "1 - All records display"
echo "2 - Add record"
echo "3 - View record"
echo "4 - Delete record"
echo "5 - Modify record"
echo "6 - Count total records"
echo "E - Exit"
echo "=============================="
echo -n "Enter your choice :"
read choice
case $choice in
"1")
viewAllRecords
;;
"2")
addRecord
;;
"3")
getEmployeeInformation
;;
"4")
deleteEmployee	
;;
"5")
modifyRecord
;;
"6")
getTotalRecords
;;
[eE])
	exit
;;
*)
	echo "Invalid choice"
;;
esac
