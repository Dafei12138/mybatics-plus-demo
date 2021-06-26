package com.mybatis.plus.gen.code;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * <p>
 * 代码生成器 ，参考源码测试用例
 * </p>
 * 具体参考https://gitee.com/baomidou/mybatis-plus<br>
 * /mybatis-plus-generator/src/test/java/com/baomidou/mybatisplus/test/generator/MysqlGenerator.java
 *
 * @author wuhongfei
 * @since 2016-12-01
 */
public class GeneratorCommon {
    /**
     * 表前缀，生成实体类的时候会去掉前缀
     */
    private String[] tablePrefixs = new String[]{"", "b_"};
    /**
     * 工程目录
     */
    private String projectDir = System.getProperty("user.dir") + File.separator + "";
    /**
     * 逻辑删除字段
     */
    private String logicDeleteFieldName = "IS_DELETED";
    /**
     * 自定义需要填充的字段，配合MetaObjectHandler使用，比如插入数据的时候，把入库时间填充
     */
    private List<TableFill> tableFillList = new ArrayList<>();
    /**
     * 需要生成的表
     */
    private String[] includeTables = {"gen_code"};

    /**
     * <p>
     * MySQL 生成演示
     * </p>
     */
    public void generator() {
        // 自定义需要填充的字段，配合MetaObjectHandler使用，比如插入数据的时候，把入库时间填充
//        tableFillList.add(new TableFill("GMT_CREATE", FieldFill.INSERT));
//        tableFillList.add(new TableFill("GMT_MODIFIED", FieldFill.INSERT_UPDATE));

        // 代码生成器
        AutoGenerator mpg = new AutoGenerator()
                // 全局配置 输出目录 是否覆盖文件 开启 activeRecord 模式 XML 二级缓存
                .setGlobalConfig(
                        new GlobalConfig().setOutputDir(projectDir + "/src/main/java").setAuthor("wuhongfei").setFileOverride(true)
                                .setActiveRecord(true).setEnableCache(false).setBaseResultMap(true).setBaseColumnList(true).setOpen(false)
                                .setEntityName("%s").setMapperName("%sMapper").setServiceName("I%sService").setServiceImplName("%sServiceImpl").setControllerName("%sController")
                )
                // 数据源配置
                .setDataSource(getDataSourceConfig())
                // 策略配置
                .setStrategy(getStrategyConfig())
                // 包配置 自定义包路径
                .setPackageInfo(new PackageConfig().setParent("com.mybatis.plus.system").setEntity("domain"))
                .setCfg(
                        // 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
                        new InjectionConfig() {
                            @Override
                            public void initMap() {
                            }
                        }.setFileOutConfigList(Collections.<FileOutConfig>singletonList(new FileOutConfig(
                                "/template/common/mapper.xml.vm") {
                            // 自定义输出文件目录
                            @Override
                            public String outputFile(TableInfo tableInfo) {
                                return projectDir + "/src/main/resources/mapper/" + tableInfo.getEntityName() + "Mapper.xml";
                            }
                        }))
                ).setTemplate(
                        // 自定义模板配置，模板可以参考源码 /mybatis-plus/src/main/resources/template 使用 copy
                        // 至您项目 src/main/resources/template 目录下，模板名称也可自定义如下配置：
                        new TemplateConfig()
                                .setEntity(null)
                                .setXml(null)
                                .setController(null)
                                .setMapper(null)
                                .setService(null)
                                .setServiceImpl(null)
                );
        // 执行生成
        mpg.execute();

        mpg = new AutoGenerator()
                .setGlobalConfig(
                        // 全局配置 输出目录 是否覆盖文件 开启 activeRecord 模式 XML 二级缓存
                        new GlobalConfig().setOutputDir(projectDir + "/src/main/java").setAuthor("wuhongfei").setFileOverride(true)
                                .setActiveRecord(false).setEnableCache(false).setBaseResultMap(true).setBaseColumnList(true).setOpen(false)
                                .setEntityName("%s").setDateType(DateType.ONLY_DATE)
                )
                // 数据源配置
                .setDataSource(getDataSourceConfig())
                // 策略配置
                .setStrategy(getStrategyConfig())
                // 包配置 自定义包路径
                .setPackageInfo(new PackageConfig().setParent("com.mybatis.plus.system")
                        .setEntity("domain"))
                .setTemplate(
                        new TemplateConfig()
                                .setEntity("template/common/domain.java.vm")
                                .setMapper("template/common/mapper.java.vm")
                                .setXml(null)
                                .setController("template/common/controller.java.vm")
                                .setService("template/common/service.java.vm")
                                .setServiceImpl("template/common/serviceImpl.java.vm")
                );
        // 执行生成
        mpg.execute();
    }

    /**
     * 策略配置
     *
     * @return StrategyConfig
     */
    private StrategyConfig getStrategyConfig() {
        return new StrategyConfig()
                // 表名前缀，生成代码忽略前缀
                .setTablePrefix(tablePrefixs)
                // 表名生成策略，这里是驼峰
                .setNaming(NamingStrategy.underline_to_camel)
                // 需要生成的表Include
                .setInclude(includeTables)
                // 排除生成的表
                // .setExclude(new String[]{"test"})
                // 自定义实体，公共字段
                // .setSuperEntityColumns(new String[]{})
//                .setTableFillList(tableFillList)
                // 逻辑删除字段
//                .setLogicDeleteFieldName(logicDeleteFieldName)
                // 自定义实体父类
                 .setSuperEntityClass("com.augurit.agcloud.bpm.front.domain.IdEntity")
                // 自定义 mapper 父类
                // .setSuperMapperClass("com.baomidou.demo.TestMapper")
                // 自定义 service 父类
//                 .setSuperServiceClass("com.augurit.erp.bpm.service.impl.BPMFlowServiceImpl")
                // 自定义 service 实现类父类
//                 .setSuperServiceImplClass("com.augurit.erp.bpm.service.IBPMFlowService")
                // 自定义 controller 父类
//                 .setSuperControllerClass("com.augurit.erp.bpm.controller.BpmFlowController")
                // 【实体】是否为构建者模型（默认 false）
//                .setEntityBuilderModel(true)
                // Boolean类型字段是否移除is前缀处理
//                .setEntityBooleanColumnRemoveIsPrefix(true)
                .setRestControllerStyle(true);
        // .setControllerMappingHyphenStyle(true)
    }

    /**
     * 数据源配置
     *
     * @return DataSourceConfig
     */
    private DataSourceConfig getDataSourceConfig() {
        return new DataSourceConfig()
                .setDbType(DbType.MYSQL).setTypeConvert(new MySqlTypeConvert())
                .setUrl("jdbc:mysql://localhost:3306/mybatis_plus_demo?characterEncoding=utf8&useSSL=false&allowMultiQueries=true&serverTimezone=GMT")
                .setUsername("root").setPassword("root").setDriverName("com.mysql.cj.jdbc.Driver");
    }

    public static void main(String[] args) {
        new GeneratorCommon().generator();
    }

}

