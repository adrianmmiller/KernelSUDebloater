MODDIR=${0%/*}


# log file
LogFile="/storage/emulated/0/KernelSUDebloat.txt"

# clear log file if its exists
echo "" > $LogFile

#set tweak file
DebloatFile="/storage/emulated/0/Download/SystemlessDebloater.cfg"

#ui_print "$DebloatFile"

while read Line; do
    #skip blank lines
    [ -z "${Line}" ] || [ "${Line:0:1}" = "#" ] && continue
    #ui_print "App: $Line" | tee -a $LogFile 
    AppPath=$(find /system /system_ext /product /data /vendor /india /my_bigball -not -path "*product/etc/preferred-apps*" -name "$Line" -maxdepth 4 -print 2> /dev/null | head -1)
		case "$AppPath" in
    "")            
	    ui_print "" | tee -a $LogFile  
        ui_print "App: $Line not installed/found" | tee -a $LogFile
		ui_print "" | tee -a $LogFile  
        ;;       
    *)           
	    ui_print ""
        ui_print "==========================================" | tee -a $LogFile    	
        ui_print "App: $Line installed/found" | tee -a $LogFile 
		ui_print "Path: $AppPath" | tee -a $LogFile 
		CreateDir=$(mkdir -p "$MODPATH$AppPath")
		ui_print "mkdir -p $MODPATH$AppPath"
		if [ ! -d $CreateDir ] ; then
			ui_print "Dummy folder creation FAILED" | tee -a $LogFile  
			ui_print "App: $Line NOT debloated" | tee -a $LogFile  
		else
			ui_print "Dummy folder created OK" | tee -a $LogFile  
			CreateOverlay=$(setfattr -n trusted.overlay.opaque -v y "$MODPATH$AppPath")		
            if [ ! "$CreateOverlay" -eq "0" ]; then
                ui_print "Attribute setting FAILED" | tee -a $LogFile  
            else
               ui_print "Attribute set OK" | tee -a $LogFile  
            fi
		fi
		ui_print "==========================================" | tee -a $LogFile 
		ui_print "" | tee -a $LogFile  
        ;;    
    esac
done < "$DebloatFile"