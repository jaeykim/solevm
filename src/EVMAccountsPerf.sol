pragma experimental "v0.5.0";
pragma experimental ABIEncoderV2;
pragma solidity ^0.4.22;

import {EVMAccounts} from "./EVMAccounts.slb";

contract EVMAccountsPerf {

    using EVMAccounts for EVMAccounts.Accounts;

    uint constant internal WORD_SIZE = 32;

    function perfAccountGetFirst() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        gas = gasleft();
        accs.get(1);
        gas -= gasleft();
    }

    function perfAccountGetSecond() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        accs.get(1);
        gas = gasleft();
        accs.get(2);
        gas -= gasleft();
    }

    function perfAccountGetTenth() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        for (uint i = 1; i < 10; i++) {
            accs.get(address(i));
        }
        gas = gasleft();
        accs.get(10);
        gas -= gasleft();
    }

    function perfAccountCopyOne() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        accs.get(1);
        gas = gasleft();
        accs.copy();
        gas -= gasleft();
    }

    function perfAccountCopyTwo() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        accs.get(1);
        accs.get(2);
        gas = gasleft();
        accs.copy();
        gas -= gasleft();
    }

    function perfAccountCopyTen() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        for (uint i = 1; i <= 10; i++) {
            accs.get(address(i));
        }
        gas = gasleft();
        accs.copy();
        gas -= gasleft();
    }

    function perfAccountToArrayZero() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        gas = gasleft();
        accs.toArray();
        gas -= gasleft();
    }

    function perfAccountToArrayOne() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        accs.get(1);
        gas = gasleft();
        accs.toArray();
        gas -= gasleft();
    }

    function perfAccountToArrayTwo() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        accs.get(1);
        accs.get(2);
        gas = gasleft();
        accs.toArray();
        gas -= gasleft();
    }

    function perfAccountToArrayTen() public payable returns (uint gas) {
        EVMAccounts.Accounts memory accs;
        for (uint i = 1; i <= 10; i++) {
            accs.get(address(i));
        }
        gas = gasleft();
        accs.toArray();
        gas -= gasleft();
    }

}
