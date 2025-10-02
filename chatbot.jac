# A Simple AI Chatbot with memory using byllm

import byllm;

walker ChatBot {
    has history: str;

    can run() {
        # Initial setup
        self.history = "You are a helpful, friendly AI assistant. " + 
                  "Keep responses clear, concise, and engaging.\n\n";

        print("Welcome to Jac AI Chatbot!");
        print("Type 'exit' anytime to quit.\n");

        # Conversation loop
        while True {
            user_msg = input("You: ");

            if user_msg == "exit" {
                print("\nGoodbye! Thanks for chatting.");
                break;
            }

            # Append user message to conversation memory
            self.history += "User: " + user_msg + "\nAssistant:";

             try {
                # Get LLM response
                response = byllm.llm_call(prompt=self.history);
                print("Bot: " + response + "\n");
                self.history += " " + response + "\n";
            } except {
                print("Error: Could not reach the AI. Try again.\n");
            }
        }
    }
}
with entry{
    ChatBot();
}

