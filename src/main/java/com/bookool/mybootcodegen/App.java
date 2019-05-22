package com.bookool.mybootcodegen;

import com.bookool.mybootcodegen.gen.CodeFactory;

/**
 * 启动
 *
 * @author Tommy
 */
public class App {

    public static void main(String[] args) {
        System.out.println("Hello world!");
        new CodeFactory().gen(args);
        System.out.println("The end!");
    }

}
