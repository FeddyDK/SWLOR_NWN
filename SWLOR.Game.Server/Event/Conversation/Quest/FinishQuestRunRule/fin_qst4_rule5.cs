using SWLOR.Game.Server.Event.Conversation.Quest.FinishQuest;

// ReSharper disable once CheckNamespace
namespace NWN.Scripts
{
#pragma warning disable IDE1006 // Naming Styles
    public class fin_qst4_rule5
#pragma warning restore IDE1006 // Naming Styles
    {
        public static int Main()
        {
            return QuestComplete.Check(4, 5) ? 1 : 0;
        }
    }
}
