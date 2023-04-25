package com.example.sharedexample

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform