import React, { useState } from 'react';

function Chatbot() {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');

  const handleSend = () => {
    if (input.trim()) {
      setMessages([...messages, { user: true, text: input }]);
      // Simulate API response
      setTimeout(() => {
        setMessages((prev) => [...prev, { user: false, text: "Response from Chatbot" }]);
      }, 1000);
      setInput('');
    }
  };

  return (
    <div className="bg-gray-100 p-6 rounded-lg shadow-md max-w-md mx-auto">
      <h1 className="text-xl font-bold mb-4">Secure Payment Chatbot</h1>
      <div className="h-64 overflow-y-scroll bg-white p-4 rounded-lg">
        {messages.map((msg, index) => (
          <div
            key={index}
            className={`mb-2 ${msg.user ? 'text-right' : 'text-left'} text-sm`}
          >
            <span
              className={`inline-block px-3 py-2 rounded-lg ${
                msg.user ? 'bg-blue-500 text-white' : 'bg-gray-200 text-black'
              }`}
            >
              {msg.text}
            </span>
          </div>
        ))}
      </div>
      <div className="mt-4 flex">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          className="flex-1 border border-gray-300 p-2 rounded-l-lg"
        />
        <button
          onClick={handleSend}
          className="bg-blue-500 text-white px-4 py-2 rounded-r-lg"
        >
          Send
        </button>
      </div>
    </div>
  );
}

export default Chatbot;
