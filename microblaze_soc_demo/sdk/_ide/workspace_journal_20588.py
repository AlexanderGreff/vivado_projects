# 2025-10-17T13:19:57.639869500
import vitis

client = vitis.create_client()
client.set_workspace(path="sdk")

platform = client.get_component(name="blinky")
status = platform.build()

status = platform.build()

comp = client.get_component(name="mb_blink_app")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../mb_intro_top.xsa")

status = platform.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = platform.build()

status = comp.clean()

status = platform.build()

comp.build()

vitis.dispose()

