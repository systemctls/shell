#! /bin/bash
# 根据模板创建文件夹
val=$(<$1)
vale=$(<$2)
file=$1
#!/bin/sh
echo "-------批量创建文件夹---$(date +%Y年%m月%d日' '%T)----------"
dataFile=$1
dataDir=$2

function is_empty_dir(){ 
  if ! test -s $1; then
      echo "配置文件为空"
      return
  fi 
}

function is_txt_file(){
  if echo "$1" | grep -q -E '\.txt$'
    then
      echo "配置文件格式校验通过"
    else
      echo "！配置文件格式错误，请使用.txt格式的配置文件。"
      return
  fi
}

# 判断文件格式  
is_txt_file $dataFile
# 文件不能为空
is_empty_dir $dataFile

echo "执行创建操作..."

# ##判断目录是否为空，为空则删除

# if [ "`ls -A ${BAK}`" = "" ];
# then 
#         echo "${BAK} is empty"
# else
#         echo "${BAK} is not empty"
# fi
# echo "----------$(date +%Y年%m月%d日' '%T)测试(test.sh)----------"


# cat $file | sed 'N;s/\n//g'>$file
# cat $file | 's/\ //g'>$file
# sed 's/^\s*//;s/\s*$//' $file>$file
arr_name=($val)
read_name=($vale)
for i in "${!arr_name[@]}";
  do
  # echo ${arr_name[$i]} ${read_name[$i]}
   mkdir -p "${arr_name[$i]}"
   if [ $2 ]
      then
        touch "${arr_name[$i]}"/README.md
        echo "###  ${arr_name[$i]}" $'\n' $'\n' ">" ${read_name[$i]} > ${arr_name[$i]}/README.md
    fi
  done

echo "执行成功"

