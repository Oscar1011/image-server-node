# 使用说明
复制一份 config/config.js，修改后映射到容器路径/data/config/config.js

    module.exports = {
      dbUrl: "127.0.0.1",   //数据库ip。建议修改为主机ip地址，docker通过此地址是是无法访问到数据库的
      db: "admin",      //数据库名称
      dbUser: "imageserver",  //数据库用户名称
      dbPassword: "imageserver",  //数据库密码
      jwtSecret: 'imageserversecret',
      jwtExpires: '30 days',
      whiteLists: [],    //白名单
      keeptime: 3 //缓存文件的保存时间 单位分钟 Minutes
    };

docker composer.xml配置

    version: "3.8"
    services:
      image-server-node:
        image: oscar1011/image_server_node
        container_name: imageservernode
        network_mode: "bridge"
        ports:
          - "3000:3000"
        volumes:
          - /volume/data/config/config.js:/data/config/config.js
        depends_on:
          - mongodb-myapp
      mongodb-myapp:
         image: mongo:4.4.6
         container_name: mongodb-imageservernode
         volumes:
            -  /volume3/docker/imageserver/mongo:/data/db
         ports:
            - "27017:27017"

mongodb docker容器启动完成后，使用

    docker exec -it mongodb-imageservernode mongo admin

进入容器内部，执行

    db.createUser({ user:'username',pwd:'password',roles:[ { role:'userAdminAnyDatabase', db: 'admin'},"readWriteAnyDatabase"]});

上面的命令中， ‘username’与‘password’对应config.js中的

    dbUser: "imageserver",
    dbPassword: "imageserver"

请确保两者一致。


### 基于 https://github.com/bookyo/image-server-node 制作的docker容器，接口使用说明参见原项目，不再赘述
