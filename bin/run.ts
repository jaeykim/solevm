#!/usr/bin/env node

import {execute, executeWithPreImage, newDefaultPreImage, prettyPrintResults} from "../script/adapter";
import {BigNumber} from "bignumber.js";

(async () => {
    try {
        const result = await execute('600060005259600052608c80610067600051396000516000f06020527f486572652773207572206d6573736167652e000000000000000000000000000060205d60006000526020600060206000600060205160155a03f1506000515060206020515c60005500fe6000305c601157600160005d600060205d5b606c806100206000396000f300fe6000305c601157600160005d600060205d5b7f486572652773207572206d6573736167652e00000000000000000000000000006020335c14156060577f5468616e6b732c2062726f2e000000000000000000000000000000000000000060205d5b600060005260206000f300', '');
        prettyPrintResults(result);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
})();
