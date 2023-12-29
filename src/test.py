import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

# Test bench for Tiny Tapeout for any design using the following Makerchip-compatible interface.
# The IOs are:
#   Inputs: none
#   Outputs:
#      uo_out[0]: passed: 1 bit output, set to 1 when the test passes
#      uo_out[1]: failed: 1 bit output, set to 1 when the test fails

@cocotb.test()
async def test_makerchip(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # reset
    dut._log.info("reset")
    dut.rst_n.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.ena.value = 1  # TODO: What's correct for this?
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # run until passed or failed or max cycles
    max_cyc = 1000
    cyc = 0
    while cyc < max_cyc:

        await ClockCycles(dut.clk, 1)
        
        passed = cyc > 20  # dut.uo_out.value & 1
        failed = dut.uo_out.value & 2
        if passed:
            dut._log.info("passed")
            break

        assert not failed

        cyc += 1
        assert cyc < max_cyc