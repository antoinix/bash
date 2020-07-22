# Function: Clear Junks in the directory
# Synatx  : ClearJunks [target_dir] [-c/v] [keywords] [--ignore] [files]
# Date    : Wed 08 Apr 2020 CST

function ClearJunks(){
    # Determine if the dir exists
    #-- If the dir exists
    if [ -d $1 ]
    then

        ## Determine if there is the option '-v / -c'
        ##-- If there is the option '-v / -c'
        if [ $2 = '-v' -o $2 = '-c' ]
        then

            ### Determine if 'ignore' option exists and if syntax is legal
            ###-- '--ignore' exists and the syntax is legal
            if [[ "${*:3}" =~ '--ignore' && $3 != '--ignore' ]]
            then

                #### Get the index of '--ignore'
                index=4
                for j in ${*:4}; do
                    if [ $j = "--ignore" ]
                    then
                        break
                    else
                        let "index++"
                    fi
                done
                include_index=$(($index-1))
                ignore_index=$(($index+1))

                #### Get the ignored string
                ignore_string=''
                for k in ${*:$ignore_index}; do

                    ##### Determine if the ignored items exist
                    #####-- If they exist
                    if [ -f $k ]
                    then
                        absolute_path=`echo $k`
                        ignore_string=$ignore_string' '$absolute_path

                    #####-- If they does not exist
                    else
                        echo "The items '$k' DOES NOT exist!"
                        echo "Forced EXIT to protect files!"
                        return 0
                    fi
                done

                #### Process the unignored items
                for x in ${*:3:$include_index}; do
                    result_string=`find $1 -wholename $x`
                    for y in $result_string; do
                        if [[ ! "$ignore_string" =~ $y ]]
                        then
                            echo $y

                            ##### move the items to /tmp
                            if [ $2 = '-c' ]
                            then
                                mv $y /tmp
                            fi
                        fi
                    done
                done

            ###-- '--ignore' doesn't exist
            elif [[ ! "${*:3}" =~ '--ignore' ]]
            then
                for i in ${*:3}; do
                find $1 -wholename $i
                if [ $2 = '-c' ]
                then
                    find $1 -wholename $i | xargs rm
                fi
                done

            ###-- '--ignore' exists but the synatx is illegal
            else
                echo "Missing the items to be ignored!"
            fi

        ##-- If missing the option '-v / -c'
        else
            echo "Missing options: -v / -c"
        fi

    #-- If the dir doesn't exist
    else
        echo "The dir: $1 is missing!"
    fi
}
alias cj='ClearJunks'
