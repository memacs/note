# java
## java命令行
经常遇到需要添加第三方jar文件的情况。在命令行状态下要加载外部的jar文件非常麻烦，很不好搞，在网上折腾了很久终于搞定了，在这里做个笔记：
    编译：javac -Djava.ext.dirs=./lib Test.java  
    运行：java -Djava.ext.dirs=./lib Test  
./lib是指存放第三方jar文件的目录。也可以写成绝对路径:/**/lib （试过了可以！）
Test.java指包含main函数的类。
