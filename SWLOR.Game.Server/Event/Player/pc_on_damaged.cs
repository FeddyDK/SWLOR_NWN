﻿using SWLOR.Game.Server.Event.Player;
using SWLOR.Game.Server.Messaging;

// ReSharper disable once CheckNamespace
namespace NWN.Scripts
{
#pragma warning disable IDE1006 // Naming Styles
    public class pc_on_damaged
#pragma warning restore IDE1006 // Naming Styles
    {
        // ReSharper disable once UnusedMember.Local
        public static void Main()
        {
            MessageHub.Instance.Publish(new OnPlayerDamaged());
        }
    }
}