usage() {
 echo "Usage: $0 [OPTIONS]"
 echo "Options:"
 echo "--help                                Display this help message"
 echo "--version                             Display version"
 echo "cpu getinfo                           Display cpuinfo"
 echo "memory getinfo                        Display memory info"
 echo "user list                             Display users"
 echo "user list --sudo-only                 Display sudo users"
 echo "user create <username>                create a new user"
 echo "file getinfo <filename>               Display file info"
 echo "file getinfo [Options] <filename>     Display file info with flags"
 
}
if  [ -n "$1" ] && [ "$1" == "cpu" ] || [ "$1" == "memory" ]; then
    echo "getinfo identified";
    if  [ -n "$2" ] && [ "$2" == "getinfo" ] && [ "$1" == "cpu" ]; then
    echo -n "executing lscpu";
    lscpu;
    elif  [ -n "$2" ] && [ "$2" == "getinfo" ] && [ "$1" == "memory" ]; then
    echo -n "executing free";
    free;
    fi
elif  [ -n "$1" ] && [ "$1" == "--version" ] || [ "$1" == "--help" ]; then
    if [ "$1" == "--version" ]; then
    echo "Version:  v0.1.0";
    elif [ "$1" == "--help" ]; then
     usage
    fi
elif  [ -n "$1" ] && [ "$1" == "user" ]; then
    if  [ -n "$2" ] && [ "$2" == "create" ]; then
    echo "Creating a new user with $3"
    sudo adduser $3 
    # $ internsctl user create <username>
    elif [ -n "$2" ] && [ "$2" == "list" ] && [ -n "$3" ] && [ "$3" == "--sudo-only" ]; then
    echo "Displaying sudo users:"
    # echo "$(awk -F: '$3 >= 1000 && $3 <= 65534' /etc/passwd)"
    getent group sudo
    elif  [ -n "$2" ] && [ "$2" == "list" ]; then
    echo "$(cat /etc/passwd)"
    fi
elif  [ -n "$1" ] && [ "$1" == "file" ]; then
     if [ -n "$2" ] && [ "$2" == "getinfo" ] && [ -n "$3" ]; then
      case $3 in

       -s | --size)
        if [ -n "$4" ]; then
        echo "Size(B):    $(stat -c "%s" $4)"
        fi
        exit 0
        ;;
      --permissions| -p )
        if [ -n "$4" ]; then
         echo "Permission:		$(stat -c "%A" $4)"
        fi
        exit 0
        ;;
      --owner| -o)
        if [ -n "$4" ]; then
         echo "Owner:		$(stat -c "%U" $4)"
        fi
        exit 0
        ;;
     --last-modified |-m)
        if [ -n "$4" ]; then
        echo "Modify:		$(stat -c "%y" $4)"
        fi
        exit 0
        ;;
      *)
       if [ -n "$3" ]; then
         echo "File info for $3"
         echo "File:		$3"
    	   echo "Access:		$(stat -c "%A" $3)"
    	   echo "Size(B):    $(stat -c "%s" $3)"
    	   echo "Owner:		$(stat -c "%U" $3)"
         echo "Modify:		$(stat -c "%y" $3)"
        fi
        exit 0
        ;;
    esac
    fi
fi



