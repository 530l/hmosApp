import { CheckResult } from "./CheckResult";
import inputMethod from '@ohos.inputMethod';

/**
 *  猜字游戏状态
 */
export class GuessingState {
  guessing: boolean = false; // 类型boolean  guessing 是否正在猜
  guessCount: number = 0; // 类型number，guessCount 记录猜的次数
  secret: number = 0; // 类型number  secret 随机数
  input: string = ''; // 类型string  input 输入的数字
  result: CheckResult = CheckResult.none; // 类型CheckResult  result 检查结果

  checkResult(): void {
    //  判断是否正在猜
    if (this.input === '' || !this.guessing) {
      return;
    }
    //  判断输入是否合法
    const guess: number = Number(this.input);
    if (Number.isNaN(guess)) {
      return;
    }
    //  输入的数字和随机数比较
    const diff = guess - this.secret;
    //  判断是否相等
    if (diff == 0) {
      this.result = CheckResult.equal
      this.guessing = false;
      this.input = ''
    }
    //  判断是否大于
    if (diff > 0) {
      this.result = CheckResult.bigger
    }
    //  判断是否小于
    if (diff < 0) {
      this.result = CheckResult.smaller
    }
    this.guessCount++;
    //  停止输入
    inputMethod.getController().stopInputSession();
  }

  //  开始
  start(): void {
    this.guessing = true;
    this.secret = Math.floor(Math.random() * 100);
    this.result = CheckResult.none;
    this.input = '';
    this.guessCount = 0;
  }
}