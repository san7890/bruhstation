import sys
import re

# Usage: tools/bootstrap/python -m dm_annotator [filename]
# If filename is not provided, stdin is checked instead

def red(text):
    return "\033[31m" + str(text) + "\033[0m"

def green(text):
    return "\033[32m" + str(text) + "\033[0m"

def yellow(text):
    return "\033[33m" + str(text) + "\033[0m"

def annotate(raw_output):
    # Remove ANSI escape codes
    raw_output = re.sub(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]', '', raw_output)

    print("::group::OpenDream Output")
    print(raw_output)
    print("::endgroup::")

    annotation_regex = r'((?P<type>Error|Warning) (?P<errorcode>OD(?P<errornumber>\d{4})) at (?P<location>(?P<filename>.+):(?P<line>\d+):(?P<column>\d+)|<internal>): (?P<message>.+))'
    has_issues = False

    print("OpenDream Code Annotations:")
    for annotation in re.finditer(annotation_regex, raw_output):
        if annotation['errornumber'] == "0000" and annotation['message'] == "Unimplemented proc & var warnings are currently suppressed":
            continue # snowflake case, we do need to care about this and it does print in the raw_output earlier but it's a nothingburger to actually annotate and it happens every run for the time being

        error_string = f"{annotation['errorcode']}: {annotation['message']}"
        print(f"::{annotation['type']} file={annotation['filename']},line={annotation['line']},col={annotation['column']}::{error_string}")
        has_issues = True

    if not has_issues:
        print(green("No OpenDream issues found"))

annotate(sys.stdin.read())
