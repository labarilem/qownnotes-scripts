import QtQml 2.0
import QOwnNotesTypes 1.0

QtObject {    
     /**
     * Initializes the custom actions
     */
    function init() {
        // Create a menu entry "git push"
        script.registerCustomAction("gitPush", "git push");
    }

    /**
     * This function is invoked when a custom action is triggered
     * in the menu or via button
     * 
     * @param identifier string the identifier defined in registerCustomAction
     */
    function customActionInvoked(identifier) {
        switch (identifier) {
            // Perform a git push
            case "gitPush":
                var notesFolderPath = script.currentNoteFolderPath();
                script.log("[git-push-action] pushing...");
                script.startDetachedProcess(
                    "git",
                    ["push"],
                    undefined,
                    undefined,
                    undefined,
                    notesFolderPath,
                );
                script.log("[git-push-action] pushed");
                break;
        }
    }
}
