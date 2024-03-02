def comment_diff_files(file_a, file_b):
    with open(file_a, 'r') as a_file, open(file_b, 'r') as b_file:
        lines_a = a_file.readlines()
        lines_b = b_file.readlines()

    for i in range(len(lines_a)):
        if lines_a[i].strip() and lines_a[i][0] != '#' and lines_a[i] not in lines_b:
            lines_a[i] = '# ' + lines_a[i]

    with open("output", 'w') as a_file:
        a_file.writelines(lines_a)
    
    for i in range(len(lines_b)):
        if lines_b[i] and lines_b[i] not in lines_a:
            continue
        else:
            lines_b[i] = '# ' + lines_b[i]

    with open("missing", 'w') as b_file:
        b_file.writelines(lines_b)
    
if __name__ == "__main__":
    file_a_path = 'good.text'
    file_b_path = 'proprietary-files.txt'

    comment_diff_files(file_a_path, file_b_path)


# https://github.com/gudang-dump/redmi_rosemary_dump/blob/rosemary-user-12-SP1A.210812.016-V13.0.5.0.SFFTWXM-release-keys-random-text-30373344211991/proprietary-files.txt
# compare with what they REMOVED