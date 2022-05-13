# Python 中的包 Package

## 关于包的综述

- 如果挂着梯子就会出问题---每次安装包的时候都要关掉代理
- 安装的时候遇到无法写入等问题或者是什么什么逻辑，可以试试 `pip install --user \package-name` ，一般都会奏效



## Dash

- Dash是一个用于构建Web应用程序的高效Python框架。



## Matplotlib

- 强大的 python 作图工具



## Pandas





## pipenv

- 介绍：

    - 这是一个创建 python 环境的包，可以创建一个环境包含该项目运行所需要的 python 资源和环境，例如 解释器（interpreter）、运行所需要的包（package）等等。这个可能有点类似于 Docker ，将这一个项目做成一个在任何地方都可以运行的的、可广泛传播的项目。

    - pipenv 是 Pipfile 主要倡导者、requests 作者 Kenneth Reitz 写的一个命令行工具，主要包含了Pipfile、pip、click、requests和virtualenv，能够有效管理Python多个环境，各种第三方包及模块。

    - 它会自动为您的项目创建和管理一个virtualenv，并在安装/卸载包时从Pipfile中添加/删除包。它还生成非常重要的Pipfile.lock文件，用于生成确定性构建。

- pipenv 的主要特性：

    - pipenv 集成了 pip，virtualenv两者的功能，且完善了两者的一些缺陷。

    - 过去用 virtualenv 管理 requirements.txt 文件可能会有问题，Pipenv 使用 Pipfile和Pipfile.lock ，后者存放将包的依赖关系，查看依赖关系是十分方便。

    - 各个地方使用了哈希校验，无论安装还是卸载包都十分安全，且会自动公开安全漏洞。（检查命令：check ）

    - 通过加载  .env 文件简化开发工作流程。

    - 支持Python2 和 Python3，在各个平台的命令都是一样的。

- 安装：`pip install [--user] pipenv` 

- 基本使用：

    - 在需要创建环境的根目录打开 `cmd` 
    - `pipenv install` ：在项目的文件夹中安装虚拟环境
    - `pipenv install \package-name` ：在虚拟环境中安装包
    - `pipenv shell` ：启动虚拟环境
    - `exit` ：退出虚拟环境

- 其他的命令，语法：

    - `pipenv uninstall \package-name` ：卸载包
    - `pipenv graph` ：查看依赖关系
    - `pipenv --venv` ：查找虚拟环境的路径
    - `pipenv --py` ：查看解释器信息
    - `pipenv --where` ：查看项目位置
    - `pipenv --rm` ：删除环境

- pipenv 的命令解释：

- ```shell
    Usage: pipenv [OPTIONS] COMMAND [ARGS]...
    
    Options:
      --where                         Output project home information.
      --venv                          Output virtualenv information.
      --py                            Output Python interpreter information.
      --envs                          Output Environment Variable options.
      --rm                            Remove the virtualenv.
      --bare                          Minimal output.
      --man                           Display manpage.
      --support                       Output diagnostic information for use in
                                      GitHub issues.
      --site-packages / --no-site-packages
                                      Enable site-packages for the virtualenv.
                                      [env var: PIPENV_SITE_PACKAGES]
      --python TEXT                   Specify which version of Python virtualenv
                                      should use.
      --three / --two                 Use Python 3/2 when creating virtualenv.
      --clear                         Clears caches (pipenv, pip).  [env var:
                                      PIPENV_CLEAR]
      -v, --verbose                   Verbose mode.
      --pypi-mirror TEXT              Specify a PyPI mirror.
      --version                       Show the version and exit.
      -h, --help                      Show this message and exit.
    
    
    Usage Examples:
       Create a new project using Python 3.7, specifically:
       $ pipenv --python 3.7
    
       Remove project virtualenv (inferred from current directory):
       $ pipenv --rm
    
       Install all dependencies for a project (including dev):
       $ pipenv install --dev
    
       Create a lockfile containing pre-releases:
       $ pipenv lock --pre
    
       Show a graph of your installed dependencies:
       $ pipenv graph
    
       Check your installed dependencies for security vulnerabilities:
       $ pipenv check
    
       Install a local setup.py into your virtual environment/Pipfile:
       $ pipenv install -e .
    
       Use a lower-level pip command:
       $ pipenv run pip freeze
    
    Commands:
      check      Checks for PyUp Safety security vulnerabilities and against PEP 508 markers provided in Pipfile.
      clean      Uninstalls all packages not specified in Pipfile.lock.
      graph      Displays currently-installed dependency graph information.
      install    Installs provided packages and adds them to Pipfile, or (if no packages are given), installs all packages from Pipfile.
      lock       Generates Pipfile.lock.
      open       View a given module in your editor.
      run        Spawns a command installed into the virtualenv.
      scripts    Lists scripts in current environment config.
      shell      Spawns a shell within the virtualenv.
      sync       Installs all packages specified in Pipfile.lock.
      uninstall  Uninstalls a provided package and removes it from Pipfile.
      update     Runs lock, then sync.
    ```

- ```shell
    $ pipenv
    Usage: pipenv [OPTIONS] COMMAND [ARGS]...
     
    Options:
      --where          Output project home information.
      --venv           查看虚拟环境的路径。
      --py             Output Python interpreter information.
      --envs           Output Environment Variable options.
      --rm             删除虚拟环境。
      --bare           Minimal output.
      --completion     Output completion (to be eval'd).
      --man            Display manpage.
      --three / --two  Use Python 3/2 when creating virtualenv.
      --python TEXT    Specify which version of Python virtualenv should use.
      --site-packages  Enable site-packages for the virtualenv.
      --version        查看pipenv的版本信息。
      -h, --help       Show this message and exit.
     
    Commands:
      check      Checks for security vulnerabilities and against PEP 508 markers provided in Pipfile.
      clean      Uninstalls all packages not specified in Pipfile.lock.
      graph      查看包的依赖关系。
      install    安装虚拟环境或者包。
      lock       Generates Pipfile.lock.
      open       View a given module in your editor.
      run        Spawns a command installed into the virtualenv.
      shell      启动虚拟环境。
      sync       Installs all packages specified in Pipfile.lock.
      uninstall  卸载包。
    ```

- 一些说明：

    - 在执行 pipenv install 的时候会自动执行 pipfile 文件，安装其中的扩展包。

    - ```shell
        [[source]]
        name = "pypi"
        url = "https://pypi.org/simple"
        verify_ssl = true
         
        [dev-packages] # 生产环境用到的包文件
         
        [packages] # 包文件
        flask = "==1.0"
        flask-sqlalchemy = "==2.3.2"
        flask-wtf = "==0.14.2"
        cymysql = "==0.9.1"
        flask-cors = "==2.1.0"
        flask-httpauth = "==2.7.0"
        requests = "==2.18.4"
         
        [requires] # python 版本
        python_version = "3.6"
        ```

### pipenv 入门教程

1. pipenv 所解决的问题：

    1. *requirements.txt 依赖管理的局限*

        1. 使用 requirements.txt 管理依赖的时候可能会出现 *不确定构建 (the build isn’t deterministic)* 问题，举个栗子：

            如果程序中要使用 TensorFlow 库，那么我们应该在 requirements.txt 里面写上

            ```python
            # requirements.txt:
            TensorFlow 
            ...
            ```

        2. 由于没有指定版本，因此通过指令 `pip install -r requirements.txt` 安装依赖模块时，会默认安装最新版本的 TensorFlow ，如果新版本向后兼容，这完全不用care，但是如果不能向后兼容就会出现：代码无法在该环境运行，即测试环境和生产环境的同一份 requirement.txt，结果出来2份不同的环境。再考虑模块本身的依赖等问题，会发现越来越令人头大。而 Pipenv 使用的 Pipfile 和 Pipfile.lock 文件则可以比较好的解决这些问题。

    2. *多个项目依赖不同第三方库、包版本问题*

        1. 如应用程序A需要特定模块的 1.0 版本但应用程序B需要 2.0 版本，当我在 A 和 B 程序间切换时，需要不断检测–卸载–安装模块。这意味着只安装其中一个版本可能无法满足每个应用程序的要求，因此需要创建虚拟环境来将 A、B 程序所需的第三方包分隔开来，此时常用的 virtualenv、venv 均可以满足要求，Pipenv 也同样集成了该功能。

2. pipenv 的简单使用：

    1. 安装：

        ```python
        # pip 安装
        pip3 install pipenv  # 全局安装，如果只想在当前用户模式下安装，可添加参数：--user
        # 如需更新可使用
        pip3 install --user --upgrade pipenv
        ```

    2. 常用命令：

        ```python
        pipenv --two  # 使用当前系统中的Python2 创建环境
        pipenv --three  # 使用当前系统中的Python3 创建环境
        
        pipenv --python 3  # 指定使用Python3创建环境
        pipenv --python 3.6  # 指定使用Python3.6创建环境
        pipenv --python 2.7.14  # 指定使用Python2.7.14创建环境
        ```

        1. 注意：

            1）创建环境时应使用系统中已经安装的、能够在环境变量中搜索到的Python 版本，否则会报错。
            2）每次创建环境都会在当前目录下生成一个名为Pipfile文件，用来记录刚创建的环境信息，如果当前目录下之前存在该文件，会将其覆盖。
            3）在使用指定版本创建环境的时候，版本号与参数 --python 之间有个空格。

    3. 实操（ cmd ）

        ```shell
        D:\Selfdate\Python\project_blog_002>pipenv --python 3.10
        Creating a virtualenv for this project...
        Pipfile: D:\Selfdate\Python\project_blog_002\Pipfile
        Using C:/Python310/python.exe (3.10.1) to create virtualenv...
        [=   ] Creating virtual environment...created virtual environment CPython3.10.1.final.0-64 in 900ms
          creator CPython3Windows(dest=C:\Users\Lenovo\.virtualenvs\project_blog_002-eku_C4uf, clear=False, no_vcs_ignore=False, global=False)
          seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=C:\Users\Lenovo\AppData\Local\pypa\virtualenv)
            added seed packages: pip==22.0.4, setuptools==62.1.0, wheel==0.37.1
          activators BashActivator,BatchActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator
        
        Successfully created virtual environment!
        Virtualenv location: C:\Users\Lenovo\.virtualenvs\project_blog_002-eku_C4uf
        Creating a Pipfile for this project...
        ```

    4. Pipfile 的内容：

        ```shell
        [[source]]
        url = "https://pypi.org/simple"
        verify_ssl = true
        name = "pypi"
        
        [packages]
        
        [dev-packages]
        
        [requires]
        python_version = "3.10"
        ```

    5. 激活虚拟环境： `pipenv shell` 

        1. 环境经激活后，会发现命令提示符变了：（下图中的“project_blog_002-eku_C4uf”前缀，表示生成了名为“project_blog_002-eku_C4uf”的虚拟环境）

        2. <img src="https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/image-20220512172200778.png" alt="image-20220512172200778" style="zoom:80%;" />     

        3. 一些其他操作：

            ```python
            pipenv --where  # 显示目录信息
            pipenv --venv  # 显示虚拟环境信息
            pipenv --py  # 显示Python解释器信息
            ```

        4. <img src="https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/image-20220512172501180.png" alt="image-20220512172501180" style="zoom:80%;" />    返回结果，如图。

    6. 安装一些库、包使用：

        ```python
        pipenv install XXX  # 安装XXX模块并加入到Pipfile
        pipenv install XXX==1.11  # 安装固定版本的XXX模块并加入到Pipfile
        ```

        1. 安装 `jieba` 包，查看变化。

        2. ```shell
            [[source]]
            url = "https://pypi.org/simple"
            verify_ssl = true
            name = "pypi"
            
            [packages]
            jieba = "*"
            
            [dev-packages]
            
            [requires]
            python_version = "3.10"
            ```

        3. 在 package 那一栏多了一个 “jieba”。

    7. 查看目前安装的库及其依赖：`pipenv graph`  

        1. <img src="https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/image-20220512173239497.png" alt="image-20220512173239497" style="zoom:80%;" />  
        2. 这里是我们安装的两个包的依存关系。

    8. 检查安全漏洞： `pipenv check` 

        1. check 这个我属实没看懂，一直报错，我也不知道为什么
        2. Failed to establish a new connection: [Errno 11004] getaddrinfo failed
        3. PEP 508 ：Python 软件包的依赖性规范
        4. PEP 508 – Dependency specification for Python Software Packages

    9. 在环境中运行 `.py` 文件：

        1. `pipenv run python filename.py` 



## ploty

- Plotly 非常强大，但用它设置和创建图形都要花费大量时间，而且都不直观。

- Ploty 入门时有一些要注意的点：

    - 安装时要有 API 秘钥，还要注册，不是只用 pip 安装就可以；
    - Plotly 所绘制的数据和布局对象是独一无二的，但并不直观；
    - 图片布局对我来说没有用（40 行代码毫无意义！）

- 但它也有优点，而且设置中的所有缺点都有相应的解决方法：

    - 你可以在 Plotly 网站和 Python 环境中编辑图片；
    - 支持交互式图片和商业报表；
    - Plotly 与 Mapbox 合作，可以自定义地图；
    - 很有潜力绘制优秀图形。

- ````python
    ---examples---
    #plot 1 - barplot
    # **note** - the layout lines do nothing and trip no errors
    data = [go.Bar(x=team_ave_df.team,
                  y=team_ave_df.turnovers_per_mp)]
    
    layout = go.Layout(
    
        title=go.layout.Title(
            text='Turnovers per Minute by Team',
            xref='paper',
            x=0
        ),
    
        xaxis=go.layout.XAxis(
            title = go.layout.xaxis.Title(
                text='Team',
                font=dict(
                        family='Courier New, monospace',
                        size=18,
                        color='#7f7f7f'
                    )
            )
        ),
    
        yaxis=go.layout.YAxis(
            title = go.layout.yaxis.Title(
                text='Average Turnovers/Minute',
                font=dict(
                        family='Courier New, monospace',
                        size=18,
                        color='#7f7f7f'
                    )
            )
        ),
    
        autosize=True,
        hovermode='closest')
    
    py.iplot(figure_or_data=data, layout=layout, filename='jupyter-plot', sharing='public', fileopt='overwrite')
    
    
    
    #plot 2 - attempt at a scatterplot
    data = [go.Scatter(x=player_year.minutes_played,
                      y=player_year.salary,
                      marker=go.scatter.Marker(color='red',
                                              size=3))]
    
    layout = go.Layout(title="test",
                    xaxis=dict(title='why'),
                    yaxis=dict(title='plotly'))
    
    py.iplot(figure_or_data=data, layout=layout, filename='jupyter-plot2', sharing='public')
    
    [Image: image.png]
    ````

- 



## turtle

- 安装：

    - 这个本身是给 python2 用的，而且官网的版本才到 0.0.2 也就是 2009 年最后更新

    - 安装的话直接 `pip install turtle` 能直接安装成功就好。不行的话，如下操作

    - 先从官网下载好 文件 （.whl）然后解压出来

    - 更改 “setup.py” 文件的第四十行为 `except(ValueError, ve):` ，也就是多加了一个括号

    - ```shell
        // 报错信息
        × python setup.py egg_info did not run successfully.
          │ exit code: 1
          ╰─> [7 lines of output]
              Traceback (most recent call last):
                File "<string>", line 2, in <module>
                File "<pip-setuptools-caller>", line 34, in <module>
                File "C:\Users\Lenovo\AppData\Local\Temp\pip-install-gh8j0dki\turtle_467fc87de7094e789a14a632bb487032\setup.py", line 40
                  except ValueError, ve:
                         ^^^^^^^^^^^^^^
              SyntaxError: multiple exception types must be parenthesized
              [end of output]
        
          note: This error originates from a subprocess, and is likely not a problem with pip.
        error: metadata-generation-failed
        ```

    - 仔细看的话，大致是可以理解的

    - 更改后直接执行 `pip install turtle文件所在文件路径/turtle-0.0.2` .

    - pip 从本地文件夹安装 ，直接`pip install -e /path/to/your/setup.py` .

    - 如果还有问题的话那就是版本的问题：

        - 原来的文件中好像没有 version 属性，解决办法，直接告诉他版本号就好了
        - ![image-20220512115619613](https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/image-20220512115619613.png)  原内容
        - ![image-20220512115722617](https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/image-20220512115722617.png)  更改为这样
        - 然后再运行 `pip install turtle文件所在文件路径/turtle-0.0.2` 即可。



### turtle 介绍

- turtle 库：
    - 1969年诞生
    - Python语言的 标准库 之一
    - 入门级的图形绘制函数库
    - （进阶的话估计就是 ploty 了）
- turtle 绘图原理：
    - turtle 海龟走过的轨迹绘制成了图形
- [官方文档](https://docs.python.org/3/library/turtle.html)



### turtle 体系构建原理

#### turtle 绘图窗体布局

- <img src="https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/20190813115627644.png" alt="在这里插入图片描述" style="zoom: 67%;" />   
- 最小单位是 像素 ，左上角是 （0 ，0）
- startx 与 starty ：绘图窗体出现在屏幕的哪里，后两个参数可选，默认正中心 。

#### 绝对坐标

- <img src="https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/20190813115704385.png" alt="在这里插入图片描述" style="zoom:67%;" />    
- 绝对坐标：就是标准的`xOy`坐标系，上`y`右`x`，中央点是（0，0）。

#### turtle 坐标

- <img src="https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/20190813115721664.png" alt="在这里插入图片描述" style="zoom:67%;" />   
- standard 模式下（默认）：头朝的方向就是前方：如当龟头朝右时，右侧就为前方。
- 开始默认头朝右。

#### turtle 角度坐标体系

- 角度坐标体系：就是数学上的坐标轴角度，绕x轴逆时针角度从0°到360°
- ![在这里插入图片描述](https://gitee.com/lidonggui/typoranotes_or_pictures/raw/master/pictures/2019081311585794.png)   
- `turtle.setheading(angle) `别名`turtle.seth(angle)` ：只改变方向不行进。如`turtle.seth(90)` ：海龟的朝向为90度。
- *注意*：与当前海龟头的朝向没有关系，90度就一定向上
- `turtle.left(angle)` 与`turtle.right(angle)` ：在海龟当前头的方向上再向左/右转多少度。

### Turtle 函数详解

#### <span id='hanshuzonglan'>函数纵览</span>

- 海龟动作
    - 移动和绘制
        - [`forward()` | `fd()` 前进](#forward)
        - [`backward()` | `bk()` | `back()` 后退](#backward)
        - [`right()` | `rt()` 右转](#right)
        - [`left()` | `lt()` 左转](#left)
        - [`goto()` | `setpos()` | `setposition()` 前往 / 定位](#goto)
        - [`setx()` 设置 x 坐标](#setx)
        - [`sety()` 设置 y 坐标](#sety)
        - [`setheading()` | `seth()` 设置朝向](#setheading)
        - [`home()` 返回原点](#home)
        - [`circle()` 画圆](#circle)
        - [`dot()` 画点](#dot)
        - [`stamp()` 印章](#stamp)
        - [`clearstamp()` 清除印章](clearstamp)
        - [`clearstamps()` 清除多个印章](clearstamps)
        - [`undo()` 撤销](#undo)
        - [`speed()` 速度](#speed)
    - 获取海龟状态
        - [`position()` | `pos()` 位置](#position)
        - [`towards` 目标方向](#towards)
        - [`xcor()` x 坐标](#xcor)
        - [`ycor()` y 坐标](#ycor)
        - [`heading()` 朝向](#towards)
        - [`distance()` 距离](#distance)
    - 设置与量度单位
        - [`degrees()` 角度](#degrees)
        - [`radians()` 弧度](#radians)
- 画笔控制
    - 绘图状态
        - [`pendown()` | `pd()` | `down()` 画笔落下](#pendown)
        - [`penup()` | `pu()` | `up()` 画笔抬起](#penup)
        - [`pensize()` | `width()` 画笔粗细](#pensize)
        - [`pen()` 画笔](#pen)
        - [`isdown()` 是否落下](#isdown)
    - 颜色控制
        - [`color()` 颜色](#color)
        - [`pencolor()` 画笔颜色](#pencolor)
        - [`fillcolor()` 填充颜色](#fillcolor)
    - 填充
        - [`filling()` 是否填充](#filling)
        - [`begin_fill()` 开始填充](#begin_fill)
        - [`end_fill()` 结束填充](#end_fill)
    - 更多绘图控制
        - [`reset()` 重置](#reset) （注意这里的是在 turtle 系列，screen 系列里也有一个）
        - [`clear()` 清空](#clear)
        - [`write()` 书写](#write)
- 海龟状态
    - 可见性
        - [`showturtle()` | `st()` 显示海龟](#showturtle)
        - [`hideturtle()` | `ht()` 隐藏海龟](#hideturtle)
        - [`isvisible()` 是否可见](#isvisible)
    - 外观
        - [`shape()` 形状](#shape)
        - [`resizemode()` 大小调整模式](#resizemode)
        - [`shapesize()` | `turtlesize()` 形状大小](#shapesize)
        - [`shearfactor()` 剪切因子](#shearfactor)
        - [`settiltangle()` 设置倾角](#settiltangle)
        - [`tiltangle()` 倾角](#tiltangle)
        - [`tilt()` 倾斜](#tilt)
        - [`shapetransform` 变形](#shapetransform)
        - [`get_shapepoly` 获取形状多边形](#get_shapepoly)
- 使用事件
    - [`onclick()` 当鼠标点击](#onclick)
    - [`onrelease()` 当鼠标释放](#onrelease)
    - [`ondrag()` 当鼠标拖动](#ondrag)
- 特殊的海龟方法
    - [`begin_poly()` 开始记录多边形](#begin_poly)
    - [`end_poly()` 结束记录多边形](#end_poly)
    - [`get_poly()` 获取多边形](#get_poly)
    - [`clone()` 克隆](#clone)
    - [`getturtle()` | `getpen()` 获取海龟画笔](#getturtle)
    - [`getscreen()` 获取屏幕](#getscreen)
    - [`setundobuffer()` 设置撤销缓冲区](#setundobuffer)
    - [`undobufferentries()` 撤销缓冲区条目](#undobufferentries)
- TurtleScreen / Screen 的方法
    - 窗口控制
        - [`bgcolor()` 背景颜色](#bgcolor)
        - [`bgpic()` 背景图片](#bgpic)
        - [`clear()` | `clearscreen()` 清屏](#clear)
        - [`reset()` | `resetscreen()` 重置](#reset)
        - [`screensize()` 屏幕大小](#screensize)
        - [`setworldcoordinates` 设置世界坐标系](#set)
    - 动画控制
        - [`delay()` 延迟](#delay)
        - [`tracer()` 追踪](#tracer)
        - [`update()` 更新](#update)
    - 使用屏幕事件
        - [`listen()` 监听](#listen)
        - [`onkey()` | `onkeyrelease()` 当键盘按下并释放](#onkey)
        - [`onkeypress()` 当键盘按下](#onkeypress)
        - [`onscreenclick()` 当点击屏幕时](#onscreenclick)
        - [`ontimer()` 当达到定时](#ontimer)
        - [`mainloop()` | `done()` 主循环](#mainloop)
    - 设置与特殊方法
        - [`mode()` 模式](#mode)
        - [`colormode()` 颜色模式](#colormode)
        - [`getcanvas()` 获取画布](#getcanvas)
        - [`getshapes()` 获取形状](#getshapes)
        - [`register_shape()` | `addshape()` 添加形状](#register_shape)
        - [`turtles()` 所有海龟](#turtles)
        - [`window_height()` 窗口高度](#window_height)
        - [`window_width()` 窗口宽度](#window_width)
    - 输入方法
        - [`textinput()` 文本输入](#textinput)
        - [`numinput()` 数字输入](#numinput)
    - Screen 专有方法
        - [`bye()` 退出](#bye)
        - [`exitonclick()` 当点击时退出](#exitonclick)
        - [`title()` 标题](#title)

#### About turtle

移动和绘制——[Click Back To 纵览](#hanshuzonglan) 

- <span id='forward'>*forward( )*</span> + <span id='backward'>*backward( )*</span>
- <span id='right'>*right( )*</span> + <span id='left'>*left( )*</span>
- <span id='goto'>*goto( )*</span>
- <span id='setx'>*setx( )*</span> + <span id='sety'>*sety( )*</span>
- <span id='setheading'>*setheading( )*</span>
- <span id='home'>*home( )*</span>
- <span id='circle'>*circle( )*</span>
- <span id='dot'>*dot( )*</span>
- <span id='stamp'>*stamp( )*</span>
- <span id='clearstamp'>*clearstamp( )*</span> + <span id='clearstamps'>*clearstamps( )*</span>
- <span id='undo'>*undo( )*</span>
- <span id='speed'>*speed( )*</span>

获取海龟状态——[Click Back To 纵览](#hanshuzonglan) 

- <span id='position'>*position( )*</span>
- <span id='towards'>*towards( )*</span>
- <span id='xcor'>*xcor( )*</span> + <span id='ycor'>*ycor( )*</span>
- <span id='heading'>*heading( )*</span>
- <span id='distance'>*distance( )*</span>

设置与量度单位——[Click Back To 纵览](#hanshuzonglan) 

- <span id='degrees'>*degrees*</span>
- <span id='radians'>*radians*</span>

绘图状态——[Click Back To 纵览](#hanshuzonglan) 

- <span id='pendown'>*pendown( )*</span> + <span id='penup'>*penup( )*</span>
- <span id='pensize'>*pensize( )*</span>
- <span id='pen'>*pen( )*</span>
- <span id='isdown'>*isdown( )*</span>

颜色控制——[Click Back To 纵览](#hanshuzonglan) 

- <span id='color'>*color( )*</span>
- <span id='pencolor'>*pencolor( )*</span>
- <span id='fillcolor'>*fillcolor( )*</span>

填充——[Click Back To 纵览](#hanshuzonglan) 

- <span id='filling'>*filling( )*</span>
- <span id='begin_fill'>*begin_fill( )*</span>
- <span id='end_fill'>*end_fill( )*</span>

更多绘图控制——[Click Back To 纵览](#hanshuzonglan) 

- <span id='reset'>*reset( )*</span> （注意这里的是在 turtle 系列，screen 系列里也有一个）
- <span id='clear'>*clear( )*</span>
- <span id='write'>*write( )*</span>

海龟可见性——[Click Back To 纵览](#hanshuzonglan) 

- <span id='showturtle'>*showturtle( )*</span> + <span id='hideturtle'>*hideturtle( )*</span>
- <span id='isvisible'>*isvisible( )*</span>

海龟外观——[Click Back To 纵览](#hanshuzonglan) 

- <span id='shape'>*shape( )*</span>
- <span id='resizemode'>*resizemode( )*</span>
- <span id='shapesize'>*reshapesize( )*</span>
- <span id='shearfactor'>*shearfactor( )*</span>
- <span id='settiltangle'>*settiltangle( )*</span>
- <span id='tiltangle'>*tiltangle( )*</span>
- <span id='tilt'>*tilt( )*</span>
- <span id='shapetransform'>*shapetransform( )*</span>
- <span id='get_shapepoly'>*get_shapepoly( )*</span>

海龟使用事件 ——[Click Back To 纵览](#hanshuzonglan) 

- <span id='onclick'>*onclick( )*</span>
- <span id='onrelease'>*onrelease( )*</span>
- <span id='ondrag'>*ondrag( )*</span>

特殊的海龟方法——[Click Back To 纵览](#hanshuzonglan) 

- <span id='begin_poly'>*begin_poly( )*</span>
- <span id='end_poly'>*end_poly( )*</span>
- <span id='get_poly'>*get_poly( )*</span>
- <span id='clone'>*clone( )*</span>
- <span id='getturtle'>*getturtle( )*</span>
- <span id='getscreen'>*getscreen( )*</span>
- <span id='setundobuffer'>*setundobuffer( )*</span>
- <span id='undobufferentries'>*undobufferentries( )*</span>



#### TurtleScreen / Screen的方法

窗口控制——[Click Back To 纵览](#hanshuzonglan) 

- <span id='bgcolor'>*bgcolor( )*</span>
- <span id='bgpic'>*bgpic( )*</span>
- <span id='clear'>*clear( )*</span>
- <span id='reset'>*reset( )*</span>
- <span id='screensize'>*screensize( )*</span>
- <span id='setworldcoordinates'>*setworldcoordinates( )*</span>

 

动画控制——[Click Back To 纵览](#hanshuzonglan) 

- <span id='delay'>*delay( )*</span>
- <span id='tracer'>*tracer( )*</span>
- <span id='update'>*update( )*</span>



使用屏幕事件——[Click Back To 纵览](#hanshuzonglan) 

- <span id='listen'>*listen( )*</span>
- <span id='onkey'>*onkey( )*</span>
- <span id='onkeypress'>*onkeypress( )*</span>
- <span id='ontimer'>*ontimer( )*</span>
- <span id='mainloop'>*mainloop( )*</span>



设置与特殊方法——[Click Back To 纵览](#hanshuzonglan) 

- <span id='mode'>*mode( )*</span>
- <span id='colormode'>*colormode( )*</span>
- <span id='getcanvas'>*getcanvas( )*</span>
- <span id='getshape'>*getshape( )*</span>
- <span id='register_shape'>*register_shape( )*</span>
- <span id='turtles'>*turtles( )*</span>
- <span id='window_height'>*window_height( )*</span> + <span id='window_width'>*window_width( )*</span>



输入方法——[Click Back To 纵览](#hanshuzonglan) 

- <span id='textinput'>*textinput( )*</span>
- <span id='numinput'>*numinput( )*</span>



Screen 专有方法——[Click Back To 纵览](#hanshuzonglan) 

- <span id='bye'>*bye( )*</span>
- <span id='exitonclick'>*exitonclick( )*</span>
- <span id='setup'>*setup( )*</span>
- <span id='title'>*title( )*</span>



### Turtle 总结

- [test](#test)



## venv

- 介绍：

    - > -- 官网：--
        >
        > Python applications will often use packages and modules that don’t come as part of the standard library. Applications will sometimes need a specific version of a library, because the application may require that a particular bug has been fixed or the application may be written using an obsolete version of the library’s interface.
        >
        > This means it may not be possible for one Python installation to meet the requirements of every application. If application A needs version 1.0 of a particular module but application B needs version 2.0, then the requirements are in conflict and installing either version 1.0 or 2.0 will leave one application unable to run.
        >
        > The solution for this problem is to create a `virtual environment` ,  a self-contained directory tree that contains a Python installation for a particular version of Python, plus a number of additional packages.
        >
        > Different applications can then use different virtual environments. To resolve the earlier example of conflicting requirements, application A can have its own virtual environment with version 1.0 installed while application B has another virtual environment with version 2.0. If application B requires a library be upgraded to version 3.0, this will not affect application A’s environment.
        >
        > 
        >
        > -- Translate --
        >
        > Python应用程序通常会使用不在标准库内的软件包和模块。应用程序有时需要特定版本的库，因为应用程序可能需要修复特定的错误，或者可以使用库的过时版本的接口编写应用程序。
        >
        > 这意味着一个Python安装可能无法满足每个应用程序的要求。如果应用程序A需要特定模块的1.0版本但应用程序B需要2.0版本，则需求存在冲突，安装版本1.0或2.0将导致某一个应用程序无法运行。
        >
        > 这个问题的解决方案是创建一个 `virtual environment`，一个目录树，其中安装有特定Python版本，以及许多其他包。
        >
        > 然后，不同的应用将可以使用不同的虚拟环境。 要解决先前需求相冲突的例子，应用程序 A 可以拥有自己的 安装了 1.0 版本的虚拟环境，而应用程序 B 则拥有安装了 2.0 版本的另一个虚拟环境。 如果应用程序 B 要求将某个库升级到 3.0 版本，也不会影响应用程序 A 的环境。

    - Python 从3.3 版本开始，自带了一个虚拟环境 `venv`，在 [PEP-405](https://legacy.python.org/dev/peps/pep-0405/) 中可以看到它的详细介绍。它的很多操作都和 virtualenv 类似，但是两者运行机制不同。因为是从 3.3 版本开始自带的，这个工具也仅仅支持 python 3.3 和以后版本。所以，要在 python2 上使用虚拟环境，依然要利用 virtualenv 。

    - 这个是把此环境下需要的包都下载到环境里， virtualenv 是有一个文件，把需要的信息写在里边，别人用的时候可以照着信息走。

- 安装：

    - Windows：
    - 自 python3.3 以后的版本都是 python 自带的，不需要额外下载。
    - Linux：
    - sudo apt-get install python3-venv  # 如有不同版本的Python3,可指定具体版本venv：python3.5-venv

- 简单使用：

    - Windows：
        - 创建：
            - python3 -m venv tutorial-env
        - 这将创建 `tutorial-env` 目录，如果它不存在的话，并在其中创建包含 Python 解释器副本和各种支持文件的目录。
        - 这样的话，`tutorial-env` 所在的文件夹就是一个环境了。
        - 虚拟环境的常用目录位置是 `.venv`。 这个名称通常会令该目录在你的终端中保持隐藏，从而避免需要对所在目录进行额外解释的一般名称。 它还能防止与某些工具所支持的 `.env` 环境变量定义文件发生冲突。
        - 激活：
            - 类似于 virtualenv ：`tutorial-env\Scripts\activate.bat` 
        - 退出：
            - 类似于 virtualenv ：`deactivate` .
    - Linux：
        - 创建：
            - python3 -m venv myenv
        - 激活：
            - `source tutorial-env/bin/activate` 
    - 进到环境里就可以直接用 `pip` 直接管理包了。

- 指令解释：

    - ```shell
        C:\Users\Lenovo>python3 -m venv
        usage: venv [-h] [--system-site-packages] [--symlinks | --copies] [--clear] [--upgrade] [--without-pip]
                    [--prompt PROMPT] [--upgrade-deps]
                    ENV_DIR [ENV_DIR ...]
        venv: error: the following arguments are required: ENV_DIR
        ```



## virtualenv

> --virtualenv的优点--
>
> 1. 使得不同Python应用的开发环境相互独
> 2. 开发环境升级不影响其他应用的开发环境，也不会影响全局的环境（默认开发环境是全局开发环境）,因为虚拟环境是将全局环境进行私有的复制，当我在虚拟环境进行 `pip install` 时，只会安装到选择的虚拟环境中。
> 3. 它可以防止系统中出现包管理混乱和版本的冲突

- 介绍：

    - virtualenv为应用提供了隔离的Python运行环境，解决了不同应用间多版本的冲突问题。

    - virtualenv是如何创建“独立”的Python运行环境的呢？原理很简单，就是把系统Python复制一份到virtualenv的环境，用命令`source venv/bin/activate`进入一个virtualenv环境时，virtualenv会修改相关环境变量，让命令`python`和`pip`均指向当前的virtualenv环境。

    - 官方介绍：A tool for creating isolated `virtual` python environments.

    - > -- info to Virtualenv from PyPI --
        >
        > - `virtualenv` is a tool to create isolated Python environments. Since Python `3.3`, a subset of it has been integrated into the standard library under the [venv module](https://docs.python.org/3/library/venv.html). The `venv` module does not offer all features of this library, to name just a few more prominent : 
        >     - is slower (by not having the `app-data` seed method),
        >     - is not as extendable,
        >     - cannot create virtual environments for arbitrarily installed python versions (and automatically discover these),
        >     - is not upgrade-able via [pip](https://pip.pypa.io/en/stable/installing/),
        >     - does not have as rich programmatic API (describe virtual environments without creating them).

- 安装： `pip install virtualenv` .

- *virtualenv* 的简单使用：

    - 首先创建虚拟环境目录（文件夹）
        - `mkdir myproject`   // 这个就是创建目录的命令
        - `cd myproject`  //这个就是进入目录的命令
    - 创建虚拟环境：
        - `virtualenv --no-site-packages myenv`  // myenv 可以替换，这里指的是新建环境的名称
            - 1）参数：`--no-site-packages` （可省略） 其意义在于不复制已经安装到系统Python环境中的所有第三方包从而得到一个“纯净”的运行环境。
            - 2） 此时当前目录下会生成一个名为：“myenv” 的目录，该目录中存放刚生成的虚拟环境文件
    - 激活激活虚拟环境：
        -  Windows ：
        - myenv\Scripts\activate.bat
        -  Linux ：
        - source myenv/bin/activate
    - **注：** 以上命令执行完后会发现命令提示符变了，有个(myenv)前缀，表示当前环境是一个名为“myenv”的Python环境，此时可以在该环境中按照我们熟悉的方式安装库、运行程序等。
    - 其他的就和平时的 python 的使用是一样的， pip ，python \filename
    - 退出 当前虚拟环境：
    -  `deactivate` .

- virtualenv  的命令解释：

    - ````shell
        usage: virtualenv [--version] [--with-traceback] [-v | -q] [--read-only-app-data] [--app-data APP_DATA] [--reset-app-data] [--upgrade-embed-wheels] [--discovery {builtin}] [-p py] [--try-first-with py_exe]
                          [--creator {builtin,cpython3-win,venv}] [--seeder {app-data,pip}] [--no-seed] [--activators comma_sep_list] [--clear] [--no-vcs-ignore] [--system-site-packages] [--copies] [--no-download | --download]
                          [--extra-search-dir d [d ...]] [--pip version] [--setuptools version] [--wheel version] [--no-pip] [--no-setuptools] [--no-wheel] [--no-periodic-update] [--symlink-app-data] [--prompt prompt] [-h]
                          dest
        ````

    - 其中 ：`dest` 是目的地的意思，是 *destination* 的缩写 。





# 项目学习

## 词云

