using SWLOR.Game.Server;
using SWLOR.Game.Server.Event.Conversation.Quest.FinishQuest;
using static NWN._;

// ReSharper disable once CheckNamespace
namespace NWN.Scripts
{
#pragma warning disable IDE1006 // Naming Styles
    public class fin_qst3_rule6
#pragma warning restore IDE1006 // Naming Styles
    {
        public static int Main()
        {
            return QuestComplete.Check(3, 6) ? TRUE : FALSE;
        }
    }
}
