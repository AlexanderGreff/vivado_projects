# 2025-10-13T21:00:38.174532
import vitis

client = vitis.create_client()
client.set_workspace(path="sdk")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "blinky",hw_design = "$COMPONENT_LOCATION/../../mb_intro_top.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="blinky")
status = platform.build()

status = client.add_platform_repos(platform=["c:\Users\alexa\vivado_projects\microblaze_soc_demo\sdk\blinky"])

status = client.add_platform_repos(platform=["c:\Users\alexa\vivado_projects\microblaze_soc_demo\sdk\blinky\microblaze_0\standalone_microblaze_0\bsp"])

status = client.add_platform_repos(platform=["c:\Users\alexa\vivado_projects\microblaze_soc_demo\sdk\blinky\microblaze_0"])

status = platform.build()

comp = client.create_app_component(name="mb_blink_app",platform = "$COMPONENT_LOCATION/../blinky/export/blinky/blinky.xpfm",domain = "standalone_microblaze_0")

comp = client.get_component(name="mb_blink_app")
status = comp.import_files(from_loc="", files=["C:\Users\alexa\vivado_projects\lab6_1_provided_fa_24\lab6_1_provided\software\mb_blink.c"])

status = platform.build()

comp = client.get_component(name="mb_blink_app")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = platform.build()

status = comp.clean()

comp.build()

status = comp.clean()

status = comp.clean()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = comp.clean()

status = platform.build()

comp.build()

