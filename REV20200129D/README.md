# AMDC REV20200129D

This folder contains the compiled design outputs for AMDC REV D (design frozen on Jan 29, 2020). This includes the schematics, images of the PCB layout, the bill of materials (BOM), and the files needed to order fully populated boards from Screaming Circuits.

## How do I order more REV D AMDCs?

All the files required for placing an order of REV D AMDCs reside in this folder. The following steps outline the ordering procedure with answers to the questions asked by Screaming Circuits. We will assume ordering 10 qty.

1. Go to [Screaming Circuits website](https://www.screamingcircuits.com/).
2. Start a new online quote.
3. Fill out `Assembly Quote` section

| Question             | Answer      |
|----------------------|-------------|
| Quantity             | 10          |
| Unique Part Count    | 64          |
| Total Placements     | 366         |
| Thru Hole Placements | 27          |
| BGA / QFN            | Yes         |
| Double Sided         | Yes, SMT    |
| RoHS                 | No          |
| Class III            | No          |
| ITAR                 | No          |

4. Fill out `PCB Fabrication Quote` section

| Question                | Answer      |
|-------------------------|-------------|
| Board Size (H x W)      | 6" x 6.75"  |
| Numer of Layers         | 6           |
| Number of Holes         | 1387        |
| Number of Slots/Cutouts | 0           |
| Surface Finish          | Tin Lead    |
| Silkscreen              | Both Sides  |
| Electrical Test         | Yes         |

5. Fill out `Parts Quote` section
    1. Upload the BOM from the `ScreamingCircuits/` folder.
    2. Wait for website to parse file... takes ~1 minute...
    3. Look for parts that they cannot source (out of stock, etc) -- this is usually fine, but make sure!
    3. Click `SAVE CHANGES`.

6. Select `Pricing` option and click `CHECK OUT`.
7. Name the project: "AMDC" and "REV20200129D" are logical.
8. Upload a ZIP file of the `ScreamingCircuits` folder for the "Project Files" section.
9. Fill out contact info, shipping info, and billing info.
10. Pay for order and wait for AMDCs to arrive!
