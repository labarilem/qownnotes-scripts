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
            var notesFolderPath = script.currentNoteFolderPath();
            script.log("[git-push-timer] pushing...");
            var success = script.startDetachedProcess(
                "git",
                ["push"],
                undefined,
                undefined,
                undefined,
                notesFolderPath,
            );
            if (success) {
                script.log("[git-push-timer] pushed");
            } else {
                script.log("[git-push-timer] couldn't push");
            }
        }
    }
}
