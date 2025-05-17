import { MenuMeta, MyBottomAppBar } from "../components /MyBottomAppBar";
import { CounterPage } from "./counter/CounterPage";
import { GuessingPage } from "./guessing/view/GuessingPage";
import { TestRelativeContainer } from "./relativeContainer/TestRelativeContainer";


export const kTabs: MenuMeta[] = [
  {
    title: '计数器',
    icon: $r('app.media.bar_counter'),
  },
  {
    title: '猜数字',
    icon: $r('app.media.bar_guess'),
  },
  {
    title: '电子木鱼',
    icon: $r('app.media.bar_muyu'),
  },
  {
    title: '画板',
    icon: $r('app.media.bar_painter'),
  },
]

@Entry
@Component
struct Index {
  //获取 sp 的值 是底部导航栏的高度
  @StorageProp('bottomRectHeight')
  bottomRectHeight: number = 0;
  //1. 数据共享机制
  // @Provide 用于在父组件中声明可以被子组件共享的数据
  // 子组件可以通过 @Consume 装饰器来访问这些共享数据
  // 实现了跨层级的数据传递，无需通过属性层层传递
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()
  //2. 状态管理机制
  @State currentIndex: number = 0;

  @Builder
  tabview() {
    Tabs({ index: this.currentIndex }) {
      TabContent() {
        CounterPage()
      }

      TabContent() {
        GuessingPage()
      }

      TabContent() {
        TestRelativeContainer()
      }

      //
      // TabContent() {
      //   Painter()
      // }
    }.layoutWeight(1)
    .barHeight(0)
    .scrollable(false)
  }

  build() {
    Navigation(this.pageStack) {
      Column() {
        this.tabview()
        MyBottomAppBar({
          data: kTabs,
          activeIndex: this.currentIndex,
          onSelected: (index) => this.onPageChange(index)
        })
      }
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
    .padding({ bottom: px2vp(this.bottomRectHeight) })
  }

  onPageChange(index: number): void {
    this.currentIndex = index;
  }
}