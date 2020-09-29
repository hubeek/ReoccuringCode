package com.patterns.builder;


class HtmlBuilderFluent {
    private String rootName;
    private HtmlElement root = new HtmlElement();

    public HtmlBuilderFluent(String rootName) {
        this.rootName = rootName;
        root.name = rootName;
    }

    public HtmlBuilderFluent addChild(String childName, String ChildText) {
        HtmlElement e = new HtmlElement(childName, ChildText);
        root.elements.add(e);
        return this;
    }

    public void clear() {
        root = new HtmlElement();
        root.name = rootName;
    }

    @Override
    public String toString() {
        return root.toString();
    }
}

public class FluentBuilder {

    public static void main(String[] args) {


        HtmlBuilderFluent builder = new HtmlBuilderFluent("ul");
        builder
                .addChild("li", "hello")
                .addChild("li", "world");
        System.out.println(builder);

    }
}
