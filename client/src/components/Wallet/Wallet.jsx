import { useState } from "react";
import web3, { Web3 } from "web3";
import ABI from "./ABI.json";
import './Wallet.css';

const Wallet =({saveState})=>{
    const [connected,setConnected]=useState(true);
     const init = async()=>{
        try{
            const web3=new Web3(window.ethereum);
            await window.ethereum.request({method:'eth_requestAccounts'});
            const contract=new web3.eth.Contract(ABI,"0x61B666AB9f52415D768DEf21b8DD8CFF1106A5Ea");
            saveState({web3:web3,contract:contract});
            setConnected(false);
        }
        catch(error){
            alert("please install metamask");
        }
     }
      return<>
      <div className="header">
        <h3 id="Name">Ansh's Portfolio</h3>
     <button className="connectBTN" onClick={init} disabled={!connected}> {connected?"Connect metamask":"connected"}</button>
      </div>
      </>
}
export default Wallet;