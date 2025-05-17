@Component
export struct MyAppBar {
  private title: string | Resource = '';
  private color?: ResourceColor;
  //获取存储在全局的对象
  @StorageProp('topRectHeight')
  topRectHeight: number = 0;

  @Builder
  leadingBuilder() { //start
  }

  @Builder
  tailingBuilder() { //end
    Shape().width(28)
  }

  @Builder
  titleBuilder() { //center
    Text(this.title)
      .fontSize($r('app.float.app_bar_title_size')).fontWeight(FontWeight.Bold)
      .fontColor($r('sys.color.black'))
  }

  @BuilderParam leading: () => void = this.leadingBuilder;
  @BuilderParam tailing: () => void = this.tailingBuilder;
  @BuilderParam titleSlot: () => void = this.titleBuilder;

  build() {
    Stack() {
      Row() {
        this.leading()
        this.titleSlot()
        this.tailing()
      }
      .backgroundColor(this.color)
      .width('100%')
      .height(56)
      .padding({ left: 8, right: 8, })
      .justifyContent(FlexAlign.SpaceBetween) //主轴对齐
    }.padding({ top: px2vp(this.topRectHeight) })

    //底部区域的避让，可以让整体距离底部指定高度
  }
}