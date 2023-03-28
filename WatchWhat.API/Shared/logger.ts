import { Context } from "@azure/functions";

export class Logs {
  static shared = new Logs();
  private static context: Context;

  static init(context: Context) {
    Logs.context = context;
  }

  private constructor() {}

  error(...args: any[]): void {
    this.hasContext();
    this.log(args);
    throw args;
  }
  warn(...args: any[]): void {
    this.hasContext();
    this.log(args);
  }
  info(...args: any[]): void {
    this.hasContext();
    this.log(args);
  }
  verbose(...args: any[]): void {
    this.hasContext();
    this.log(args);
  }

  private log(...args: any[]): void {
    Logs.context.log(args);
  }

  private hasContext() {
    if (!Logs.context) {
      throw "Logger context is not configured.";
    }
  }
}