Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A36B0213
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Mar 2023 09:52:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FA33CB839
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Mar 2023 09:52:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 512E33CB82D
 for <ltp@lists.linux.it>; Wed,  8 Mar 2023 09:52:34 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E7355204943
 for <ltp@lists.linux.it>; Wed,  8 Mar 2023 09:52:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7538C219AD;
 Wed,  8 Mar 2023 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678265551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1NR1QcdvIvKVOjM1p3uI5hSH5F+wL77ftzYq7uh6soY=;
 b=XCrBSgaYfsd3DlKltdg/2FMKYeB4WyuqvLyRuqJH4gMUuDdfjhFo2LWFijKCleCWYTEXA/
 aWSGCb3inV1p5IIf2X4pqZGtpQMCQfdB3nZAsC9IW25ItuxLuxreYxBrkwnzvQNQbLCOEb
 atWxcVmyVNG1VvJJzcMdTVObbcXL86I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678265551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1NR1QcdvIvKVOjM1p3uI5hSH5F+wL77ftzYq7uh6soY=;
 b=s5z8o8827G+WJj3tt3kyXQryYg9JkDh5S09uBQ2itgmgniuM78ET1OO5PB+X8LsUMwxiR5
 cbWbUcq2iyGUeoBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E0601348D;
 Wed,  8 Mar 2023 08:52:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Njr2DM9MCGTTJQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Wed, 08 Mar 2023 08:52:31 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Wed,  8 Mar 2023 09:50:23 +0100
Message-Id: <20230308085023.3607-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Remove execltp script from install
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Andrea Cervesato <andrea.cervesato@suse.com>

execltp is an old and unmaintained script that works as runltp.sh or
runltp-ng. We get rid of it in order to reduce complexity in the
executors' jungle.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .gitignore             |   1 -
 Makefile               |   1 -
 configure.ac           |   1 -
 execltp.in             | 474 -----------------------------------------
 include/mk/automake.mk |   3 +-
 5 files changed, 1 insertion(+), 479 deletions(-)
 delete mode 100755 execltp.in

diff --git a/.gitignore b/.gitignore
index fd66dac78..915d22104 100644
--- a/.gitignore
+++ b/.gitignore
@@ -33,7 +33,6 @@ autom4te.cache
 /m4/Makefile
 /m4/Makefile.in
 
-/execltp
 /ltp-devel.spec
 /README.ltp-devel
 /tags
diff --git a/Makefile b/Makefile
index cb80622d6..53f94d9f7 100644
--- a/Makefile
+++ b/Makefile
@@ -146,7 +146,6 @@ clean:: $(CLEAN_TARGETS)
 
 $(foreach tgt,$(MAKE_TARGETS) include-all lib-all $(filter-out clean_install_dir,$(CLEAN_TARGETS)) $(INSTALL_TARGETS) include-install lib-install,$(eval $(call target_to_dir_dep_mapping,$(tgt))))
 
-BINDIR_INSTALL_SCRIPTS	:= execltp
 SRCDIR_INSTALL_SCRIPTS	:= IDcheck.sh runltp ver_linux
 SRCDIR_INSTALL_READONLY	:= Version
 SRCDIR_INSTALL_TARGETS	:= $(SRCDIR_INSTALL_SCRIPTS) $(SRCDIR_INSTALL_READONLY)
diff --git a/configure.ac b/configure.ac
index c2b0f48e7..114468ae3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -10,7 +10,6 @@ AC_CONFIG_FILES([ \
     include/mk/features.mk \
     lib/ltp.pc \
     m4/Makefile \
-    execltp \
 ])
 
 AC_ARG_VAR(HOSTCC, [The C compiler on the host])
diff --git a/execltp.in b/execltp.in
deleted file mode 100755
index 4b647cd17..000000000
--- a/execltp.in
+++ /dev/null
@@ -1,474 +0,0 @@
-#!/usr/bin/env python3
-"""
-    An LTP [execution and] parsing wrapper.
-
-    Used as a second layer for ease-of-use with users as many developers
-    complain about complexity involved with trying to use LTP in my
-    organization -_-.
-
-    Copyright (C) 2009-2012, Ngie Cooper
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License along
-    with this program; if not, write to the Free Software Foundation, Inc.,
-    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-"""
-
-
-from optparse import OptionGroup, OptionParser
-import os
-import re
-import sys
-
-
-class ResultsParseException(Exception):
-    """ Extended class for parsing LTP results. """
-
-
-def parse_ltp_results(exec_log, output_log, verbose=0):
-    """Function for parsing LTP results.
-
-    1. The exec log is the log with the results in summary form.
-
-    And now a note from our sponsors about exec logs...
-
-    startup='Thu Oct  1 06:42:07 2009'
-    tag=abort01 stime=1254379327 dur=2 exit=exited stat=0 core=no cu=0 cs=16
-    tag=accept01 stime=1254379329 dur=0 exit=exited stat=0 core=no cu=1 cs=0
-    tag=access01 stime=1254379329 dur=0 exit=exited stat=0 core=no cu=0 cs=0
-    tag=access02 stime=1254379329 dur=0 exit=exited stat=0 core=no cu=0 cs=0
-    tag=access03 stime=1254379329 dur=1 exit=exited stat=0 core=no cu=0 cs=1
-
-    [...]
-
-    a. tag is the test tag name.
-    b. stime is the system time at the start of the exec.
-    c. dur is the total duration of the test.
-    d. exit tells you what the result was. Valid values are:
-       - exited
-       - signaled
-       - stopped
-       - unknown
-       See run_child in pan.c.
-    e. stat is the exit status.
-    f. core answers the question: `did I dump core?'.
-    g. cu is the cutime (cumulative user time).
-    h. cs is the cstime (cumulative system time).
-
-    2. The output log is the log with all of the terse results.
-    3. verbose tells us whether or not we need to include the passed results.
-    """
-
-    if not os.access(exec_log, os.R_OK):
-        raise ResultsParseException("Exec log - %s - specified doesn't exist"
-                                    % exec_log)
-    elif 1 < verbose and not os.access(output_log, os.R_OK):
-        # Need the output log for context to the end user.
-        raise ResultsParseException("Output log - %s - specified doesn't exist"
-                                    % output_log)
-
-    context = None
-
-    failed = []
-    passed = 0
-
-    if 2 <= verbose:
-        passed = []
-
-    target_vals = ('exited', '0', 'no')
-
-    fd = open(exec_log, 'r')
-
-    try:
-        content = fd.read()
-        matches = re.finditer('tag=(?P<tag>\w+).+exit=(?P<exit>\w+) '
-                              'stat=(?P<stat>\d+) core=(?P<core>\w+)', content)
-    finally:
-        content = None
-        fd.close()
-
-    if not matches:
-        raise ResultsParseException("No parseable results were found in the "
-                                    "exec log - `%s'." % exec_log)
-
-    for match in matches:
-
-        if ((match.group('exit'), match.group('stat'), match.group('core')) !=
-             target_vals):
-            failed.append(match.group('tag'))
-        elif 2 <= verbose:
-            passed.append(match.group('tag'))
-        else:
-            passed += 1
-
-    # Save memory on large files because lists can eat up a fair amount of
-    # memory.
-    matches = None
-
-    if 1 <= verbose:
-
-        context = {}
-
-        search_tags = failed[:]
-
-        if 2 <= verbose:
-            search_tags += passed
-
-        search_tags.sort()
-
-        fd = open(output_log, 'r')
-
-        try:
-
-            line_iterator = getattr(fd, 'xreadlines', getattr(fd, 'readlines'))
-
-            end_output = '<<<execution_status>>>'
-            output_start = '<<<test_output>>>'
-
-            tag_re = re.compile('tag=(\w+)')
-
-            grab_output = False
-
-            local_context = ''
-
-            search_tag = None
-
-            try:
-
-                while True:
-
-                    line = next(line_iterator)
-
-                    if line.startswith(end_output):
-
-                        if search_tag:
-                            context[search_tag] = local_context
-
-                        grab_output = False
-                        local_context = ''
-                        search_tag = None
-
-                    if not search_tag:
-
-                        while True:
-
-                            line = next(line_iterator)
-
-                            match = tag_re.match(line)
-
-                            if match and match.group(1) in search_tags:
-                                search_tag = match.group(1)
-                                break
-
-                    elif line.startswith(output_start):
-                        grab_output = True
-                    elif grab_output:
-                        local_context += line
-
-            except StopIteration:
-                pass
-
-            for k in list(context.keys()):
-                if k not in search_tags:
-                    raise ResultsParseException('Leftover token in search '
-                                                'keys: %s' % k)
-
-        except Exception as exc:
-            # XXX (garrcoop): change from Exception to soft error and print
-            # out warning with logging module.
-            raise ResultsParseException('Encountered exception reading output '
-                                        'for context: %s' % str(exc))
-        finally:
-            fd.close()
-
-    return failed, passed, context
-
-
-def determine_context(output_log, testsuite, test_set, context):
-    """Return a set of context values mapping test_set -> context."""
-
-    test_set_context = {}
-
-    for test in test_set:
-
-        if test in context:
-            test_context = context[test]
-            del context[test]
-        else:
-            test_context = ('Could not determine context for %s; please see '
-                            'output log - %s' % (test, output_log))
-
-        test_set_context['%s : %s' % (testsuite, test)] = test_context
-
-    return test_set_context
-
-
-def print_context(output_dest, header, testsuite_context):
-    """Print out testsuite_context to output_dest, heading it up with
-       header.
-    """
-
-    output_dest.write('\n'.join(['', '=' * 40, header, '-' * 40, '']))
-
-    for test, context in list(testsuite_context.items()):
-        output_dest.write('<output test="%s">\n%s\n</output>\n' %
-                          (test, context.strip()))
-
-
-def main():
-    """main"""
-
-    parser = OptionParser(prog=os.path.basename(sys.argv[0]),
-                          usage='usage: %prog [options] test ...',
-                          version='0.0.2')
-
-    ltpdir = os.getenv('LTPROOT', '@prefix@')
-
-    parser.add_option('-l', '--ltp-dir', dest='ltp_dir',
-                      default=ltpdir, help='LTP directory [default: %default]')
-    parser.add_option('-L', '--log-dir', dest='log_dir',
-                      default=None,
-                      help=('directory for [storing and] retrieving logs '
-                            '[default: %s/output]' % ltpdir),
-                      metavar='DIR')
-    parser.add_option('-p', '--postprocess-only', dest='postprocess_only',
-                      default=False, action='store_true',
-                      help=("Don't execute runltp; just postprocess logs "
-                            "[default: %default]."))
-    parser.add_option('-o', '--output-file', dest='output_file',
-                      default=None,
-                      help='File to output results')
-    parser.add_option('-r', '--runltp-opts', dest='runltp_opts',
-                      default='',
-                      help=('options to pass directly to runltp (will '
-                            'suppress -q).'))
-
-    group = OptionGroup(parser, 'Logging',
-                        'If --summary-mode is 0, then the summary output is '
-                        'suppressed. '
-                        'If --summary-mode is 1 [the default], then summary '
-                        'output will be displayed for test execution'
-                        'If --summary-mode is 2, then summary output will be '
-                        'provided on a per-test suite basis. If only '
-                        'one test suite is specified, this has the same net '
-                        "effect as `--summary-mode 1'"
-                        'If --verbose is specified once, prints out failed '
-                        'test information with additional context. '
-                        'If --verbose is specified twice, prints out the '
-                        'failed and passed test context, as well as the '
-                        'summary.')
-
-    parser.add_option('-s', '--summary-mode', dest='summary_mode', default=1,
-                      type='int',
-                      help='See Logging.')
-
-    parser.add_option('-v', '--verbose', dest='verbose', default=0,
-                      action='count',
-                      help=('Increases context verbosity from tests. See '
-                            'Verbosity for more details.'))
-    parser.add_option_group(group)
-
-    group = OptionGroup(parser, 'Copyright',
-                        '%(prog)s version %(version)s, Copyright (C) '
-                        '2009-2012, Ngie Cooper %(prog)s comes with '
-                        'ABSOLUTELY NO WARRANTY; '
-                        'This is free software, and you are welcome to '
-                        'redistribute it under certain conditions (See the '
-                        'license tort in %(file)s for more details).'
-                        % { 'file'    : os.path.abspath(__file__),
-                            'prog'    : parser.prog,
-                            'version' : parser.version })
-
-    parser.add_option_group(group)
-
-    opts, args = parser.parse_args()
-
-    # Remove -q from the opts string, as long as it's a standalone option.
-    runltp_opts = re.sub('^((?<!\S)+\-q\s+|\-q|\s+\-q(?!\S))$', '',
-                         opts.runltp_opts)
-
-    if not opts.log_dir:
-        opts.log_dir = os.path.join(opts.ltp_dir, 'output')
-
-    if not opts.summary_mode and not opts.verbose:
-        parser.error('You cannot suppress summary output and disable '
-                     'verbosity.')
-    elif opts.summary_mode not in list(range(3)):
-        parser.error('--summary-mode must be a value between 0 and 2.')
-
-    if len(args) == 0:
-        # Default to scenarios also used by runltp.
-        fd = open(os.path.join(ltpdir, 'scenario_groups/default'), 'r')
-        try:
-            args = [l.strip() for l in fd.readlines()]
-        finally:
-            fd.close()
-
-    if opts.output_file:
-
-        output_dir = os.path.dirname(opts.output_file)
-
-        if output_dir:
-            # Not cwd; let's check to make sure that the directory does or
-            # does not exist.
-
-            if not os.path.exists(output_dir):
-                # We need to make the directory.
-                os.makedirs(os.path.dirname(opts.output_file))
-            elif not os.path.isdir(os.path.abspath(output_dir)):
-                # Path exists, but isn't a file. Oops!
-                parser.error('Dirname for path specified - %s - is not valid'
-                             % output_dir)
-
-        else:
-            # Current path (cwd)
-            opts.output_file = os.path.join(os.getcwd(), opts.output_file)
-
-        output_dest = open(opts.output_file, 'w')
-
-    else:
-
-        output_dest = sys.stdout
-
-    try:
-
-        failed_context = {}
-        passed_context = {}
-
-        failed_count = 0
-        passed_count = 0
-
-        if opts.summary_mode == 2 and len(args) == 1:
-            opts.summary_mode = 1
-
-        for testsuite in args:
-
-            # Iterate over the provided test list
-
-            context = {}
-            exec_log = os.path.join(opts.log_dir, '%s-exec.log' % testsuite)
-            output_log = os.path.join(opts.log_dir, ('%s-output.log'
-                                                     % testsuite))
-
-            failed_subset = {}
-
-            runtest_file = os.path.join(opts.ltp_dir, 'runtest', testsuite)
-
-            if not opts.postprocess_only:
-
-                for log in [exec_log, output_log]:
-                    if os.path.isfile(log):
-                        os.remove(log)
-
-                if not os.access(runtest_file, os.R_OK):
-                    output_dest.write("%s doesn't exist; skipping "
-                                      "test\n" % runtest_file)
-                    continue
-
-                os.system(' '.join([os.path.join(opts.ltp_dir, 'runltp'),
-                                    runltp_opts, '-f', testsuite,
-                                    '-l', exec_log, '-o', output_log]))
-
-            try:
-
-                failed_subset, passed_css, context = \
-                    parse_ltp_results(exec_log, output_log,
-                                  verbose=opts.verbose)
-
-            except ResultsParseException as rpe:
-                output_dest.write('Error encountered when parsing results for '
-                                  'test - %s: %s\n' % (testsuite, str(rpe)))
-                continue
-
-            failed_count += len(failed_subset)
-
-            failed_subset_context = {}
-            passed_subset_context = {}
-
-            if opts.verbose:
-                failed_subset_context = determine_context(output_log,
-                                                          testsuite,
-                                                          failed_subset,
-                                                          context)
-            if type(passed_css) == list:
-
-                passed_count += len(passed_css)
-
-                if opts.verbose == 2:
-                    passed_subset_context = determine_context(output_log,
-                                                              testsuite,
-                                                              passed_css,
-                                                              context)
-
-            else:
-
-                passed_count += passed_css
-
-            if opts.summary_mode == 1:
-
-                failed_context.update(failed_subset_context)
-                passed_context.update(passed_subset_context)
-
-            else:
-
-                if 1 <= opts.verbose:
-                    # Print out failed testcases.
-                    print_context(output_dest,
-                                  'FAILED TESTCASES for %s' % testsuite,
-                                  failed_subset_context)
-
-                if opts.verbose == 2:
-                    # Print out passed testcases with context.
-                    print_context(output_dest,
-                                  'PASSED TESTCASES for %s' % testsuite,
-                                  passed_subset_context)
-
-                if opts.summary_mode == 2:
-                    output_dest.write("""
-========================================
-SUMMARY for: %s
-----------------------------------------
-PASS - %d
-FAIL - %d
-----------------------------------------
-""" % (testsuite, passed_count, len(failed_subset)))
-
-        if opts.summary_mode == 1:
-
-            # Print out overall results.
-
-            if 1 <= opts.verbose:
-                # Print out failed testcases with context.
-                print_context(output_dest, "FAILED TESTCASES", failed_context)
-
-            if opts.verbose == 2:
-                # Print out passed testcases with context.
-                print_context(output_dest, "PASSED TESTCASES", passed_context)
-
-            output_dest.write("""
-========================================
-SUMMARY for tests:
-%s
-----------------------------------------
-PASS - %d
-FAIL - %d
-----------------------------------------
-""" % (' '.join(args), passed_count, failed_count))
-
-    finally:
-
-        if output_dest != sys.stdout:
-
-            output_dest.close()
-
-if __name__ == '__main__':
-    main()
diff --git a/include/mk/automake.mk b/include/mk/automake.mk
index ee3b7f1b8..3ecdd3144 100644
--- a/include/mk/automake.mk
+++ b/include/mk/automake.mk
@@ -99,8 +99,7 @@ AUTOGENERATED_FILES	= \
 			include/mk/config.mk	\
 			include/mk/features.mk	\
 			lib/ltp.pc		\
-			m4/Makefile		\
-			execltp
+			m4/Makefile
 
 distclean:: %: clean ac-distclean
 	for d in $(AUTOCONFED_SUBDIRS); do \
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
