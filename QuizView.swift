import SwiftUI
import PlaygroundSupport

struct QuizView: View {
    let questions: [
        (image: "Bureau", audio: "Bureau.m4a", answer: "Bureau"),
        (image: "Souliers", audio: "Souliers.m4a", answer: "Souliers"),
        (image: "Ordinateur", audio: "Ordinateur.m4a", answer: "Ordinateur"),
        (image: "Stylo", audio: "Stylo.m4a", answer: "Stylo"),
        (image: "Coupe", audio: "Coupe.m4a", answer: "Coupe")
    ]

    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var isCorrect = false

    var body: some View {
        VStack {
            Image(questions[currentQuestionIndex].image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .padding()

            TextField("Type your answer", text: Binding<String>(
                get: { self.userAnswer },
                set: { self.userAnswer = $0 }
            ))
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Submit Answer") {
                checkAnswer()
            }
            .padding()
            .background(isCorrect ? Color.green : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Text(isCorrect ? "Correct!" : "Incorrect. Try again.")
                .foregroundColor(isCorrect ? .green : .red)
                .padding()

            Button("Next Question") {
                nextQuestion()
            }
            .padding()
        }
        .padding()
    }

    func checkAnswer() {
        let correctAnswer = questions[currentQuestionIndex].answer.lowercased()
        isCorrect = userAnswer.lowercased() == correctAnswer
    }

    func nextQuestion() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.count
        userAnswer = ""
        isCorrect = false
    }
}
