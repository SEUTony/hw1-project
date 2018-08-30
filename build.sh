#!/bin/sh

name=`echo $1 | cut -d \. -f 1`
ss=`echo $1 | cut -d \. -f 2`

if [ ss='c' ];
    then
        command `gcc $1 -o ${name}`
    elif [ ss='cpp' ]
    then
        command `g++ $1 -o ${name}`
fi

./${name}
rm ${name}


#!/bin/bash 
	path='/d/Disk/code_local2/jsb-link/frameworks/runtime-src/proj.android-studio/app/'
	content=$(cat ${path}version.properties)
	echo "��ȡ����:$content"
	#��ȡ�ļ���VERSION_CODE��Ӧ��value������versionCode����
	versionCode=`grep VERSION_CODE ${path}version.properties|cut -d'=' -f2`
	#��versionCode+1���õ��ۼӺ��addVersionCode
	addVersionCode=`expr $versionCode + 1`
	echo "versionCode====$versionCode"
	# ��addVersionCode�����ۼӸ�ֵ���ļ���VERSION_CODE
	sed -i "s#^VERSION_CODE=.*#VERSION_CODE=${addVersionCode}#g"  ${path}version.properties
	content=$(cat ${path}version.properties)
	addVersionCode=`grep VERSION_CODE ${path}version.properties|cut -d'=' -f2`
	echo "�滻֮��====$content"
	echo "addVersionCode====$addVersionCode"
	#�ж�versionCode�Ƿ��ۼӳɹ��� -gt��ʶ���ڷ���true
	if [ $addVersionCode -gt $versionCode ]
	then
	# ���apk
	#gradlew ��ӦĿ¼
	BUILD_TOOL_PATH='/d/Disk/code_local2/jsb-link/frameworks/runtime-src/proj.android-studio'
	echo "��ʼ���..."
	#cd $BUILD_TOOL_PATH && ./gradlew assembleinsectRelease
	 cd $BUILD_TOOL_PATH && ./gradlew assembleRelease
	openRootPath='D:\Disk\code_local2\jsb-link\frameworks\runtime-src\proj.android-studio\app'
	#�����ɴ򿪰����ڵ�Ŀ¼����Ȼ������������������·�����滻�����Ӧ��·������Ȼ�������в���ɹ�
	explorer $openRootPath'\build\outputs\apk\insect\release'
	else
	echo "error : versionCodeδ��1"
        fi