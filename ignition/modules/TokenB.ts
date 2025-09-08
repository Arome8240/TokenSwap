import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenBBuild", (m) => {
  const TokenSwap = m.contract("TokenB");

  return { TokenSwap };
});
