自动生成自签名HTTPS服务器，快速安装ipa
springboot 自签名生成HTTPS 服务器,快速安装ipa



# iOS 10.3
* iOS 10.3  以上系统 安装完证书之后要信任证书步骤如下 Settings > General > About (logically...) > Certificate Trust Settings > Enable Full Trust for Root Certificates



# 支持
* OS X
* 其他平台未测试

# 需要
Spring boot jd8 maven 

# 安装
```
运行 gen-ota-certificate.sh  + Ip  生成目标证书
```

# 用法
```
将生成的证书myCA.cer 和 server.jks替换到工程中 
将IPA包放到Static目录,将manifest.plist的路径替换自己的路径,将index.html中的href路径替换自己的路径
```

## 开启服务
```
启动springboot 项目 在Safari浏览器中 IOS 10.3以上系统安装完证书

# open https://ip:port/test on your iphone
```

### 关于`ipa`打包方法
ios Archive 配置好生成mainifest.plist替换自己的文件url处配置自己的路径

### 安装app
* 手机使用safari打开`https://ip:port/test`页面
* 第一次打开会弹出警告`无法验证服务器`，请点击`详细信息`按钮安装证书，按指示一直点击下一步和完成(**强烈推荐使用静态IP，避免每次重新安装证书**)
* 点击`ipa`链接在线安装`ipa`


# TODO

- [ ] 支持多语言
- [ ] 支持上传IPA



