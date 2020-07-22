# Function: move the specified object to /tmp
# Syntax  : FakeRemove [file/fir]
# Date    : Wed 08 Apr 2020 CST

function FakeRemove(){
    for i in $*; do
        # Determine wheter the arguments are legal
        #-- If the arguments are legal
        if [ -e $i -a $i -a $i != '/' ]
        then
            mv $i /tmp

        #-- If the arguments are illegal
        else

            ## Determine the type of the illegal arguments
            ##-- If missing the arguments
            if [ -z $i ]
            then
                echo "Missing arguments"

            ##-- If the argument is /
            elif [ $i = '/' ]
            then
                echo "$i is rejected!"

            ##-- If the argument does not exist
            else
                echo "$i is not exists"
            fi
        fi
    done
}
alias fm='FakeRemove'
