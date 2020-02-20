import asyncio
import iterm2

async def main(connection):
    component = iterm2.StatusBarComponent(
        short_description="Mouse Mode",
        detailed_description="Indicates if mouse reporting is enabled",
        knobs=[],
        exemplar="[mouse on]",
        update_cadence=None,
        identifier="com.iterm2.example.mouse-mode")

    # This function gets called when the mouseReportingMode variable
    # changes.
    @iterm2.StatusBarRPC
    async def coro(
            knobs,
            reporting=iterm2.Reference("mouseReportingMode")):
        if reporting < 0:
            return " "
        else:
            return "🐭"

    # Register the component.
    await component.async_register(connection, coro)

iterm2.run_forever(main)
