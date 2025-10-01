import "./App.css";

function App() {
  return (
    <>
      <h1 className="flex justify-between items-center h-16 px-2.5 text-center text-2xl bg-amber-300 font-bold">
        <div className="cursor-pointer hover:scale-150 transition-all scroll-smooth w-10 h-10 bg-[url('https://cdn-icons-png.flaticon.com/512/5277/5277459.png')] bg-cover bg-center"></div>
        <div className="flex gap-6 items-center">
          <div className="cursor-pointer hover:scale-150 transition-all scroll-smooth hover:underline">
            Home
          </div>
          <div className="cursor-pointer hover:scale-150 transition-all scroll-smooth hover:underline">
            Product
          </div>
          <div className="cursor-pointer hover:scale-150 transition-all scroll-smooth hover:underline">
            Help
          </div>
          <div className="cursor-pointer hover:scale-150 transition-all scroll-smooth hover:underline">
            About
          </div>
        </div>
        <div className="cursor-pointer hover:scale-150 transition-all scroll-smooth">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
          >
            <path
              fill="currentColor"
              fill-rule="evenodd"
              d="M1.9.25A1.65 1.65 0 0 0 .25 1.9v7.2a1.65 1.65 0 0 0 1.65 1.65h7.2a1.65 1.65 0 0 0 1.65-1.65V1.9A1.65 1.65 0 0 0 9.1.25zm0 13A1.65 1.65 0 0 0 .25 14.9v7.2a1.65 1.65 0 0 0 1.65 1.65h7.2a1.65 1.65 0 0 0 1.65-1.65v-7.2a1.65 1.65 0 0 0-1.65-1.65zm10.347-11a.75.75 0 0 1 .75-.75h10a.75.75 0 0 1 0 1.5h-10a.75.75 0 0 1-.75-.75m.75 2.5a.75.75 0 0 0 0 1.5h10a.75.75 0 0 0 0-1.5zm-.75 4a.75.75 0 0 1 .75-.75h10a.75.75 0 0 1 0 1.5h-10a.75.75 0 0 1-.75-.75m.75 5.75a.75.75 0 0 0 0 1.5h10a.75.75 0 0 0 0-1.5zm-.75 4a.75.75 0 0 1 .75-.75h10a.75.75 0 0 1 0 1.5h-10a.75.75 0 0 1-.75-.75m.75 2.5a.75.75 0 0 0 0 1.5h10a.75.75 0 0 0 0-1.5z"
              clip-rule="evenodd"
            />
          </svg>
        </div>
      </h1>
    </>
  );
}

export default App;
