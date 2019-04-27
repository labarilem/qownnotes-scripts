import QtQml 2.0
import QOwnNotesTypes 1.0

QtObject { 
    /**
     * This starts a timer that triggers every 30 seconds
     */
    property QtObject timer: Timer {
        interval: 30000
        repeat: true
        running: true
                
        onTriggered: {
            var notesFolderPath = script.toNativeDirSeparators(script.currentNoteFolderPath());
            var notesDrivePath = notesFolderPath.substr(0, 2);
            var changeDirCmd = "cd /d " + notesDrivePath + " && " + "cd " + notesFolderPath;
            var gitPushCmd = "git push"; 
            var cmd = changeDirCmd + " && " + gitPushCmd;
            script.log("[git-push-timer] pushing...");
            script.startDetachedProcess("cmd.exe", ["/C", cmd]);
            script.log("[git-push-timer] pushed");
        }
    }
}
