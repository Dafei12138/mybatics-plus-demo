# 代码生成器使用说明
### 使用方法
* 在数据库中创建数据表 
* 使用Generator类，在includeTables字符串数组设置数据表表名
* 如果创建希望对应的类名不要数据表名的前缀，则在tablePrefixs字符串数组加入该前缀如“erp_”
* 在类中两处setAuthor配置自己的名字用作生成代码的作者注释
* 在类中两处setPackageInfo配置代码所在的包路径
* 在getDataSourceConfig中配置数据库信息
* 运行main方法，观察输出结果查看代码
* 注意，生成的mapper.xml的 insert方法里，字段和属性列表最后都多了一个逗号，需要去掉
## 已有模板
* GeneratorCommon是普通的增删查改类，对应template下的common模板
* MySqlTypeConvert是数据库字段类型和domain对应的属性类型匹配 