source $(dirname "$0")/config.sh
cd $ProjectDir
#下面代码切记勿动，不然佛祖不会保佑你

echo "-------------------------------------------------\n\n"
echo "                   _ooOoo_"
echo "                  o8888888o"
echo "                  88\" . \"88"
echo "                  (| -_- |)"
echo "                  O\  =  /O "
echo "               ____/\`---'\____"
echo "             .'   \|     |/  \`."
echo "            /   \|||  :  |||/   \ "
echo "           /  _||||| -:- |||||-  \ "
echo "           |   | \ \  -  / / |   | "
echo "           | \_|  ''\---/''  |   |"
echo "           \  .-\__  \`-\`  ___/-. /"
echo "         ___\`. .'  /--.--\  \`. . __ "
echo "      .\"\" '<  \`.___\_<|>_/___.'  >'\"\". "
echo "     | | :  \ - \`.;\`\ _ /\`;.\`/ - \` : | |"
echo "     \  \ \`-.   \_ __\ /__ _/   .-\` /  /"
echo "======\`-.____\`-.___\_____/___.-\`____.-'======"
echo "                   \`=---='"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "
echo "           佛祖保佑       永无BUG \n"
echo "   佛曰:    
        写字楼里写字间，写字间里程序员；    
        程序人员写程序，又拿程序换酒钱。   
        酒醒只在网上坐，酒醉还来网下眠；    
        酒醉酒醒日复日，网上网下年复年。    
        但愿老死电脑间，不愿鞠躬老板前；    
        奔驰宝马贵者趣，公交自行程序员。    
        别人笑我忒疯癫，我笑自己命太贱；    
        不见满街漂亮妹，哪个归得程序员？
"
echo "-------------------------------------------------"

# 上传小米市场
echo "\n\n\n----------------\nPush To XiaoMi Market?\n1.Yes\n2.No\n----------------\n"
if [ ! -d "$OutPutFile" ]; then
   mkdir "$OutPutFile"
fi
read pushxiaomi
while [  $pushxiaomi != 1 -a $pushxiaomi != 2  ]
do
   echo "Input wrong number Please try agin"
   read pushxiaomi
done

if [ $pushxiaomi = 1 ]; then   
   echo "\n---------------------------\nGenerate Apk Please Wait\n---------------------------\n"	
   gradle assembleXiaoMiRelease
   if [  -f "$XiaoMi" ]; then
      cp $XiaoMi $OutPutFile
      java -jar $XiaoMiPushTool $XiaoMiUserName $XiaoMiPrivateKey $Package $AppName $XiaoMi   	  
   fi
fi

echo "\n\n----------------\nBuild Product Release?\n1.Yes\n2.No\n----------------\n"
read buildProductRelease
while [  $buildProductRelease != 1 -a $buildProductRelease != 2  ]
do
   echo "Input wrong number Please try agin"
   read buildProductRelease
done

if [ $buildProductRelease = 1 ]; then   

	echo "\n---------------------------\nGenerate Apk Please Wait\n---------------------------\n"
    gradle assemble${BuildTypeProduct}Release
	gradle assemble${BuildTypeTest}Debug

    echo "\n\n----------------\nUpload Fir?\n1.Yes\n2.No\n----------------\n"
	read uploadfir
	while [  $uploadfir != 1 -a $uploadfir != 2  ]
	do
	   echo "Input wrong number Please try agin"
	   read uploadfir
	done

	if [ $uploadfir = 1 ]; then  
	   echo "Fir Login" 
	   fir login ${FirToken}
	   if [  -f "$Product" ]; then
	    fir publish $Product
	   fi

	   if [  -f "$DogFood" ]; then
	    fir publish $DogFood
	   fi
	fi

	if [  -f "$Product" ]; then
	 cp $Product $OutPutFile
	fi

	if [  -f "$DogFood" ]; then
	 cp $DogFood $OutPutFile
	fi
	open $OutPutFile
fi


echo "\n-------------------\n       Finish!\n-------------------\n"
