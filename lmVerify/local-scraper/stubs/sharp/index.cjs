const sharp = function() {
  return {
    metadata: async () => ({ width: 1000, height: 1000, channels: 3 }),
    rotate: () => ({
      raw: () => ({
        toBuffer: async () => ({ data: Buffer.alloc(0), info: { width: 0, height: 0, channels: 3 } })
      })
    })
  };
};
sharp.default = sharp;
module.exports = sharp;
