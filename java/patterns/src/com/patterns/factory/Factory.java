package com.patterns.factory;


class Point {

    private Double x, y;

    private Point(Double x, Double y) {
        this.x = x;
        this.y = y;
    }

    public static class Factory
    {

        public static Point newCarthesianPoint(Double x, Double y) {
            return new Point(x, y);
        }

        public static Point newPolarPoint(Double rho, Double theta) {
            return new Point(rho * Math.cos(theta), rho * Math.sin(theta));
        }

    }
}


class Demo
{
    public static void main(String[] args) {
        Point point = Point.Factory.newPolarPoint(2.0,3.0);
    }
}
