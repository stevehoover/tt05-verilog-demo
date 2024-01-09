![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Makerchip Projects

### What is Makerchip

Makerchip is an online IDE for digital circuit design. This repository is forked from the Tiny Tapeout repository to add support for Makerchip-based projects coded in Verilog or TL-Verilog. To preview the environment ctrl-click to open the [starting template](https://www.makerchip.com/sandbox?code_url=https:%2F%2Fraw.githubusercontent.com%2Fstevehoover%2Ftt05-verilog-demo%2Fmain%2Fsrc%2Ftt_um_template.tlv#) or a [calculator circuit example](                     https://www.makerchip.com/sandbox?code_url=https:%2F%2Fraw.githubusercontent.com%2Fstevehoover%2Ftt05-verilog-demo%2Fmain%2Fsrc%2Ftt_um_calculator.tlv#) in Makerchip.

![tt_template_makerchip](https://github.com/stevehoover/tt05-verilog-demo/assets/11302288/37f65ea1-6898-41ac-a5b1-c9afb7b824f1)

### Setup

To set up your project:

  - Create your top-level TL-Verilog source file as a copy of [src/tt_um_template.tlv](src/tt_um_template.tlv), named `src/tt_um_<your-GitHub-ID>_<your-project>`. 
  - In this new file, rename your module to match this file name using the settings at the top of the file.
  - Update the module instantiation in `tb.v` (or create your own test bench file).
  - In [src/Makefile](src/Makefile), list your source files in the `source_files` variable.
  - Edit the [info.yaml](info.yaml) as described in its comments, including updating the list of source files and top module name.

### Build Flow

Any `.tlv` file will be compiled to a single `.v` file by running `make` in the `src/` directory.
Both the `.tlv` file and its generated `.v` will be committed to the repository. Continuous integration (CI) testing triggered by pushing
to GitHub treats the Verilog file as the source. It does not (currently) automatically compile from the TL-Verilog source. So be sure to
run `make` before committing changes.

In case of build errors, note that the `Makefile` uses the cocotb Makefile which messes with the Python environment and can break the SandPiper(TM) command that compiles the `.tlv` code. If you encounter Python environment errors, look for the SandPiper command in the `make` output, and run it manually. Then run `make` (as a pre-check for testing via GitHub).

GitHub is used to build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/). Enable GitHub actions, as below. Then, with your configuration updated and your (TL-)Verilog code tested, push your changes to GitHub.

## How to enable the GitHub actions to build the ASIC files

Please see the instructions for:

- [Enabling GitHub Actions](https://tinytapeout.com/faq/#when-i-commit-my-change-the-gds-action-isnt-running)
- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://discord.gg/rPK2nSjxy8)

## What next?

- Submit your design to the next shuttle [on the website](https://tinytapeout.com/#submit-your-design). The closing date is **November 4th**.
- Edit this [README](README.md) and explain your design, how it works, and how to test it.
- Share your GDS on your social network of choice, tagging it #tinytapeout and linking Matt's profile:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [matt-venn](https://www.linkedin.com/in/matt-venn/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - Twitter [#tinytapeout](https://twitter.com/hashtag/tinytapeout?src=hashtag_click) [@matthewvenn](https://twitter.com/matthewvenn)
