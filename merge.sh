#!/bin/bash
if [[ $1 && $2 && $1!=$2 ]];
    then
        git add .
        read -p '请输入提交信息' reason
        git commit -m reason
        echo "################## git pull $1  ########################"
        git pull origin $1;
        echo "################## git push $1 ########################"
        git push origin $1
        echo "################## git checkout $2 ########################"
        git pull origin $2;
        echo "################## git merge $2 ########################"
        git merge $1;
        echo "################## git push $2 ########################"
        git push origin $2;
    else 
    read -p '请输入要合并的目标分支'  branch1;
    read -p '请输入要合并的原分支'  branch2;
    echo $branch1;
    echo $branch2;
        if [[ $branch1 = $branch2 ]];
        then echo '请不要输入两个相同的目标分支';
        else
          echo "################## 开始 git fetch 开始 @@@@@@########################"
          git add .
          read -p '请输入提交信息' reason
          git commit -m reason;
          git fetch;
          echo "################## 结束 git fetch 结束 #####################"
          all_branchs=`git branch -a`;
          echo  $all_branchs
        fi
fi
