# AI Chatbot with memory using byllm

import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Get AI response based on conversation history"""
def get_response(history: str) -> str by llm();

walker ChatBot {
    has history: str = "";
    
    can start with `root entry;
}

with entry:__main__ {
    root spawn ChatBot();
}

impl ChatBot.start {
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

        # Appending user message to conversation memory
        self.history += "User: " + user_msg + "\nAssistant:";

        # Get LLM response
        response = get_response(self.history);
        print("Bot: " + response + "\n");
        self.history += " " + response + "\n";
    }
}