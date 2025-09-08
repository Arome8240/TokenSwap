import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("FixedRateTokenSwapBuild", (m) => {
  const TokenSwap = m.contract("FixedRateTokenSwap");

  return { TokenSwap };
});
