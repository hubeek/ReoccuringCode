package com.patterns.flyweight;

import com.google.common.base.Function;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class User
{
    private String fullName;

    public User(String fullName) {
        this.fullName = fullName;
    }
}

class User2
{
    public static List<String> getStrings() {
        return strings;
    }

    static List<String> strings = new ArrayList<>();
    private int[] names;

    public User2(String fullName)
    {
        Function<String, Integer> getOrAdd = (String s) -> {
            int idx = strings.indexOf(s);
            if (idx != -1) return idx;
            else {
                strings.add(s);
                return strings.size() - 1;
            }
        };

        names = Arrays.stream(fullName.split(" "))
                .mapToInt(s -> getOrAdd.apply(s)).toArray();
    }

    public String getFullName()
    {
        return Arrays.stream(names).mapToObj(i -> strings.get(i))
                .collect(Collectors.joining(","));
    }

    @Override
    public String toString() {
        return "User2{" + " fullname: " + this.getFullName() +
                ",  names: " + Arrays.toString(names) +
                '}';
    }
}

class UsersDemo
{
    public static void main(String[] args) {
        User2 user = new User2("John Smith");
        User2 user4 = new User2("Smith John");
        User2 user1 = new User2("Jane Smith");
        User2 user2 = new User2("Jane Ruby");
        User2 user3 = new User2("Jane John");
        System.out.println(user);
        System.out.println(user1);
        System.out.println(user2);
        System.out.println(user3);
        System.out.println(user4);
        System.out.println(user4.getStrings());
        // have "Smith" in common
    }
}
