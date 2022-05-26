
ftp -i -n <<EOF
    open files.000webhost.com
    user "sihati-test" "12pass12"
    $@
ls
cd test
mput *.pdf


EOF
