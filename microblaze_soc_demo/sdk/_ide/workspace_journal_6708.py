# 2025-10-15T18:27:46.214807800
import vitis

client = vitis.create_client()
client.set_workspace(path="sdk")

platform = client.get_component(name="blinky")
status = platform.build()

comp = client.get_component(name="mb_blink_app")
comp.build()

vitis.dispose()

vitis.dispose()

