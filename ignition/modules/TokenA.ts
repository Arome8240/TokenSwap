import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenABuild", (m) => {
  const TokenSwap = m.contract("TokenA");

  return { TokenSwap };
});
