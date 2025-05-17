@Preview
@Component
export struct TestRelativeContainer {
  build() {
    RelativeContainer() {
      Row() {
        Text('row1')
      }
      .justifyContent(FlexAlign.End) // 主轴是控制内容的对齐方式
      .width(100)
      .height(100)
      .backgroundColor('#a3cf62')
      .alignRules(AlignRus)
      .id("row1")

      Row() {
        Text('row2')
      }
      .justifyContent(FlexAlign.Center)
      .width(100)
      .height(100)
      .backgroundColor('#00ae9d')
      .alignRules(AlignRue)
      .id("row2")

      Row() {
        Text('row3')
      }
      .justifyContent(FlexAlign.Center)
      .height(100)
      .backgroundColor('#0a59f7')
      .alignRules({
        //和 Android 的约束布局有点类似吧
        top: { anchor: "row1", align: VerticalAlign.Bottom },
        left: { anchor: "row1", align: HorizontalAlign.Start },
        right: { anchor: "row2", align: HorizontalAlign.Start }
      })
      .id("row3")

      Row() {
        Text('row4')
      }.justifyContent(FlexAlign.Center)
      .backgroundColor('#2ca9e0')
      .alignRules({
        top: { anchor: "row3", align: VerticalAlign.Bottom },
        left: { anchor: "row1", align: HorizontalAlign.Center },
        right: { anchor: "row2", align: HorizontalAlign.End },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom }
      })
      .id("row4")

    }.width("100%").height("100%")
    .margin(Mleft)
    .border(BWC)
  }
}

let RelConB: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': 'row1', 'align': VerticalAlign.Bottom },
  'left': { 'anchor': 'row1', 'align': HorizontalAlign.Start }
}

//RelativeContainer父组件为锚点，__container__代表父容器的ID。
let AlignRus: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  //每个规则必须指定 anchor（锚点）和 align（对齐方式）
  //anchor 可以是 '__container__' 或其他组件的 id
  //# RelativeContainer 对齐规则说明
  // 对齐规则的工作原理
  // 在 RelativeContainer 中，对齐规则遵循以下原则：
  // 1. 规则的键（如 'top'、'bottom'、'left'、'right'）表示当前组件的哪个边要进行对齐
  // 2. align 属性表示与锚点组件的哪个边对齐
  // 3. 对齐方向必须匹配：
  // 'top'/'bottom' 搭配 VerticalAlign
  // 'left'/'right' 搭配 HorizontalAlign
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
}
let AlignRue: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
}

// key -> value
let Mleft: Record<string, number> = { 'right': 12 }
let BWC: Record<string, number | string> = { 'width': 5, 'color': '#6699FF' }