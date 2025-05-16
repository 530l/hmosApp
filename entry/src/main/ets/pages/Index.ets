@Entry
@Component
@Preview
struct Index {
  //组件内部可以通过 @State 声明可变状态量
  @State message: string = '鸿蒙纪元试试';
  @State counter: number = 0;

  build() {
    Stack() {
      //
      Column() {
        // Text('计数器')
        //   .fontSize(28)
        //   .fontWeight(FontWeight.Bold)
        //   .margin({ top: 20, left: 20 })


        //在 AppBar 构造时，可以通过 leading 参数，让外界构建具体内容，
        // 插入到 AppBar 结构的内部。通过这种方式，我们就可以封装一些通用的结构，便于复用：
        AppBar({ title: '计数器', leading: this.leading, tailing: this.tailing });
        Column() {
          Text('～～～下面是你点击按钮的次数:')
            .fontSize(18)
          Text(this.counter.toString())
            .fontSize(36)
            .fontColor('#2e3032')
            .margin({ top: 10 })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center) //主轴对齐
      }
      .alignItems(HorizontalAlign.Start) //交叉轴对齐
      .width('100%')
      .height('100%')

      //
      Text(this.message)
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ right: 20, bottom: 166 })

      //
      //stateEffect 为 true 时，点击可以有颜色加深的反馈效果。
      Button({ type: ButtonType.Circle, stateEffect: true }) {
        SymbolGlyph($r('sys.symbol.plus'))
          .fontSize(24)
          .fontColor([Color.White])
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })
          .onClick(() => {
            this.message = '点击了' + this.counter + '次';
            this.counter++;
          })
      }.width(56).height(56)
      .margin({ right: 20, bottom: 20 })
      .backgroundColor('#317bd4')

    }.alignContent(Alignment.Bottom)

  }

  //@Builder - 自定义组件模板
  @Builder
  leading() {
    SymbolGlyph($r('sys.symbol.access_card'))
      .fontSize(24).fontColor([Color.White])
      .fontWeight(FontWeight.Bold)
  }

  @Builder
  tailing() {
    SymbolGlyph($r('sys.symbol.card_package'))
      .fontSize(24).fontColor([Color.White])
      .fontWeight(FontWeight.Bold)
  }
}

// 你做了个空白相框(@BuilderParam)
// 别人可以把自己拍的照片(@Builder)放进去
// 相框只负责边框，照片内容别人决定
@Component
struct AppBar {
  title: string = '';

  @Builder
  leadingBuilder() {
  }

  //@Builder - 自定义组件模板
  @Builder
  tailingBuilder() {

  }

  //@BuilderParam - 组件插槽
  @BuilderParam leading: () => void = this.leadingBuilder;
  @BuilderParam tailing: () => void = this.tailingBuilder;

  build() {
    Row() {
      this.leading()
      Text(this.title)
        .fontSize(20).fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.white'))
      this.tailing()
    }
    .backgroundColor('#317bd4')
    .width('100%')
    .height(56)
    .padding({ left: 20, right: 20 })
    .justifyContent(FlexAlign.SpaceBetween) //主轴对齐
  }
}



