# A Simple AI Chatbot with memory using byllm

import byllm;

walker ChatBot {
    has history;

    can run() {
        # Initial setup
        history = "You are a helpful, friendly AI assistant. " + 
                  "Keep responses clear, concise, and engaging.\n\n";

        print("Welcome to Jac AI Chatbot!");
        print("Type 'exit' anytime to quit.\n");

        # Conversation loop
        while true {
            input("You: ") -> let user_msg;

            if user_msg == "exit" {
                print("\nGoodbye! Thanks for chatting.");
                break;
            }

            # Append user message to conversation memory
            history += "User: " + user_msg + "\nAssistant:";

            try {
                # Get LLM response
                llm_call(prompt=history) -> let response;
                print("Bot: " + response + "\n");
                history += " " + response + "\n";
            }
            except {
                print("Error: Could not reach the AI. Try again.\n");
            }
        }
    }
}

ChatBot();
