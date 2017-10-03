import subprocess

GMAIL_FOLDER_MAP = {
    "archive": "[Gmail]/All Mail",
    "drafts":  "[Gmail]/Drafts",
    "sent":    "[Gmail]/Sent Mail",
    "trash":   "[Gmail]/Trash",
}

INVERSE_GMAIL_FOLDER_MAP = {v:k for k,v in GMAIL_FOLDER_MAP.items()}

INCLUDED_GMAIL_FOLDERS = ["INBOX"] + GMAIL_FOLDER_MAP.values()

FASTMAIL_FOLDER_MAP = {
    "archive": "Archive",
    "drafts":  "Drafts",
    "sent":    "Sent",
    "trash":   "Trash",
}

INVERSE_FASTMAIL_FOLDER_MAP = {v:k for k,v in FASTMAIL_FOLDER_MAP.items()}

INCLUDED_FASTMAIL_FOLDERS = ["INBOX"] + FASTMAIL_FOLDER_MAP.values()

def local_folder_to_gmail_folder(folder):
    return GMAIL_FOLDER_MAP.get(folder, folder)

def gmail_folder_to_local_folder(folder):
    return INVERSE_GMAIL_FOLDER_MAP.get(folder, folder)

def should_include_gmail_folder(folder):
    return folder in INCLUDED_GMAIL_FOLDERS

def local_folder_to_fastmail_folder(folder):
    return FASTMAIL_FOLDER_MAP.get(folder, folder)

def fastmail_folder_to_local_folder(folder):
    return INVERSE_FASTMAIL_FOLDER_MAP.get(folder, folder)

def should_include_fastmail_folder(folder):
    return folder in INCLUDED_FASTMAIL_FOLDERS

def find_password(name):
    try:
        output = subprocess.check_output(["pass", name])
        return output.split("\n")[0]
    except subprocess.CalledProcessError:
        return None
