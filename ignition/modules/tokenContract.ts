import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenContractBuild", (m) => {
  const TokenSwap = m.contract("TokenContract");

  return { TokenSwap };
});
