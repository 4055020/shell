read -p "输入yes强制: " yes;

list() $yes
list(){
	case "$1" in
	;;
	-ssh_port)
		ssh_port=$2; shift 2
		[ ${ssh_port} -eq 22 >/dev/null 2>&1 -o ${ssh_port} -gt 1024 >/dev/null 2>&1 -a ${ssh_port} -lt 65535 >/dev/null 2>&1 ] || { echo "${CWARNING}ssh_port input error! Input range: 22,1025~65534${CEND}"; exit 1; }
	;;
	--)
		shift
	;;
	*)
    check_shell "$1"
		exit 1
	;;
	esac
	exit 0
}
