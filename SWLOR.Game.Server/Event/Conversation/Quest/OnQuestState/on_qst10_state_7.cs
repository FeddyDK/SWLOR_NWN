using SWLOR.Game.Server.Event.Conversation.Quest.OnQuestState;

// ReSharper disable once CheckNamespace
namespace NWN.Scripts
{
#pragma warning disable IDE1006 // Naming Styles
    public class on_qst10_state_7
#pragma warning restore IDE1006 // Naming Styles
    {
        public static int Main()
        {
            return QuestCheckState.Check(10, 7) ? 1 : 0;
        }
    }
}
