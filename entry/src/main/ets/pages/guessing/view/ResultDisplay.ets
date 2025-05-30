import { CheckResult, resultColor, resultLabel } from "../model/CheckResult";

@Component
export struct ResultDisplay {
  //在子组件中，可以通过 @Prop 声明 父子单向同步 的参数，
  // 这样父层级传入的数据变化时，可以自动通知更新当前组件：
  @Prop result: CheckResult = CheckResult.none;
  @Prop @Watch('onGuessCountChange') guessCount: number = 0;
  @State fontSize: number = 14;

  build() {
    Column() {
      Text(resultLabel(this.result))
        .fontSize(this.fontSize)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
    }
    .layoutWeight(1)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(resultColor(this.result))
  }

  onGuessCountChange(propName: string): void {
    this.fontSize = 14;
    this.startAnimation();
  }

  startAnimation(): void {
    let param: AnimateParam = { curve: Curve.EaseIn, duration: 500 };
    this.getUIContext()?.animateTo(param, () => this.onEvent());
  }

  onEvent(): void {
    this.fontSize = 42;
  }
}