fun sumdifference(a: List<Int>): Int {
    var delta = 0
    for (x in a) {
        if (x >= 10) {
            var digitsum = 0
            var xa = x
            while (xa > 0) {
                digitsum += xa % 10
                xa = xa / 10
            }
            delta += x - digitsum
        }
    }
    return delta
}

fun main() {

    if (sumdifference(listOf(1, 23, 4, 5)) == 18) {
        print("Pass")
    } else {
        print("Fail")
    }
    print(" ")
    if (sumdifference(listOf(1, 2, 3, 4, 5)) == 0) {
        print("Pass")
    } else {
        print("Fail")
    }
    print(" ")
    if (sumdifference(listOf(1, 2, 34)) == 27) {
        print("Pass")
    } else {
        print("Fail")
    }
    println("")

}
