# Function: create symbolic links for multiple files at the same time
# Syntax  : SymbolicLink -n [new_dir] [-d [source_dir] [keywords]]/[-f [source_file]]
# Date    : Wed 08 Apr 2020 CST

function SymbolicLink(){
    # Determine if the first argument is legal
    #-- If the first argument is legal
    if [[ $1 = '-n' && -d $2 ]]
    then

        ## Determine if the second argument exists
        ##-- If the second argument exists
        if [[ $3 = '-d' || $3 = '-f' ]]
        then

            ### Classify by the option
            ###-- If the second option is '-d'
            if [ $3 = '-d' ]
            then
                #### Determine if the source dir is legal
                ####-- If the source dir is legal
                if [ -d $4 ]
                then
                    ##### Determine if the keywords exist
                    #####-- If the keywords exist
                    if [ $5 ]
                    then
                        for j in ${*:5}; do
                            files=`find $4 -name $j`

                            for k in $files; do
                                absolute_path=`echo $k`
                                file_name=${absolute_path##*/}
                                ###### Determine whether the link exists
                                ######-- If the link does not exist
                                if [ ! -f $2'/'$file_name ]
                                then
                                    ln -s $absolute_path $2'/'$file_name

                                ######-- If the link exists
                                else
                                    echo "Failed: $2'/'$file_name already exists"
                                fi
                            done
                        done
                    #####-- missing the keyswords
                    else
                        echo "Keywords are missing"
                    fi

                ####-- If the source argument is illgal
                else
                    echo "The dir: '$4' is missing!"
                fi

            ###-- If the second option is '-f'
            else

                #### Determine if the files exist
                ####-- If the files exist
                if [ $4 ]
                then
                    for i in ${*:4}; do
                        ##### Determine whether the source files exist
                        #####-- If the source files exist
                        if [ -f $i ]
                        then
                            absolute_path=`echo $i`
                            file_name=${absolute_path##*/}
                            ###### Determine whether the link exists
                            ######-- If the link does not exist
                            if [ ! -f $2'/'$file_name ]
                            then
                                ln -s $absolute_path $2'/'$file_name

                            ######-- If the link exists
                            else
                                echo "Failed: $2'/'$file_name already exists"
                            fi

                        #####-- If the source file is missing
                        else
                            echo "The file '$i' is missing"
                        fi
                    done

                ####-- If the files is missing
                else
                    echo "No file behind '-f'"
                fi
            fi

        ##-- If the second arguemnt is missing
        else
            echo "Missing argument: -d / -f"
        fi

    #-- If the dir is illegal
    elif [[ $1 = '-n' && ! -d $2 ]]
    then
        if [ $2 ]
        then
            echo "The dir: '$2' is missing!"
        else
            echo "Missing the new directory!"
        fi

    #-- If the option '-n' is missing
    else
        echo "The option '-n' is missing!"
    fi
}
alias sl='SymbolicLink'
