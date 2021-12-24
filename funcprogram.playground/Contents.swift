let words = """
Largely due to her sex appeal, Mai has become one of the most popular, recognizable and celebrated female characters of the fighting game genre, especially in Japan, China, and some other East Asian countries, often being compared to Capcom's Chun-Li. She has also become SNK's primary sex symbol and mascot character featured in many merchandise products and representing the company in many crossover and spin-off titles, in addition to licensed appearances in numerous games by other companies, as well as becoming a trendy subject of cosplay and modeling.
"""
let non_words = ["i","am","is","are","on","in","the","and","or","of","a"]

func wordFreq(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    for word in wordList {
        let lowercasedword = word.lowercased()
        if !non_words.contains(lowercasedword) {
            if let count = wordDict[lowercasedword] {
                wordDict[lowercasedword] = count + 1
            } else {
                wordDict[lowercasedword] = 1
            }
        }
    }
    return wordDict
}
print(wordFreq(words: words))

//函数式编程版本
func wordFreq2(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    wordList.map {$0.lowercased()}.filter{!non_words.contains($0)}.forEach{wordDict[$0]=(wordDict[$0] ?? 0)+1}
    return wordDict
}
print(wordFreq2(words: words))
