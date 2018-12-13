# YSSwiftTransitionDemo

### 使用方法
```
YSTransitionManager.instance.presentTargetVC(target: navi, animate: true, reve: false) {
      // end operation
    }
```

### 优点 
1. 调用情景不受限制 - 使用单例管理跳转，使得可以在项目中的任何位置调用跳转，包括model, VC, View等等
2. 提供多个API，包括对手势的处理，跳转和dismiss更方便

