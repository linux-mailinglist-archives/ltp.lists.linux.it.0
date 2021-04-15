Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6236053D
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 11:06:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 856773C7026
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 11:06:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 178053C1B10
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 11:05:56 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 41C171A006FE
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 11:05:56 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 5559B9F650;
 Thu, 15 Apr 2021 09:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1618477554; bh=urGpT/vbD5jxK4IS4f411e4cyc3yaki3m5FX8Ds0CzI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=BsRPuwyEpALCqmP/1UbWvknEDL9rkpEHkALKPC9CM6w3yKphQ/IPMKHVd9AamuchA
 JgAvkq3J9i7H0toehFhb8vgmWbjeEHJrt/3LfT24EJhazLREcRMoXwW3LAOwCETFmX
 QHThn+X1w8IEE8Y5EKulx4x+QwrM5TW/9jgTMmqw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz
Date: Thu, 15 Apr 2021 11:05:42 +0200
Message-Id: <20210415090542.960158-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] pec: Fix multiple event test
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The test case for NUM_EVENTS != 1 was not correct at all.
Now the test looks for each event recorded by the generator
in the correct order in the listener's log.

Additionally the test is parameterized, to the the number of generated events
and the default is now set to 10.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/kernel/connectors/pec/cn_pec.sh     | 100 +++++++++++++++---
 .../kernel/connectors/pec/event_generator.c   |  54 +++++-----
 2 files changed, 116 insertions(+), 38 deletions(-)

diff --git a/testcases/kernel/connectors/pec/cn_pec.sh b/testcases/kernel/connectors/pec/cn_pec.sh
index 4ab84b4fa..0acb7271d 100755
--- a/testcases/kernel/connectors/pec/cn_pec.sh
+++ b/testcases/kernel/connectors/pec/cn_pec.sh
@@ -9,16 +9,52 @@
 # Process event connector is a netlink connector that reports process events
 # to userspace. It sends events such as fork, exec, id change and exit.
 
+TST_OPTS="n:"
 TST_SETUP=setup
 TST_TESTFUNC=test
+TST_PARSE_ARGS=parse_args
+TST_USAGE=usage
 TST_NEEDS_ROOT=1
 TST_NEEDS_TMPDIR=1
 TST_TEST_DATA="fork exec exit uid gid"
 
-NUM_EVENTS=1
-
 . tst_test.sh
 
+num_events=10
+
+usage()
+{
+	cat << EOF
+usage: $0 [-n <nevents>]
+
+OPTIONS
+-n      The number of evetns to generate per test (default 10)
+EOF
+}
+
+parse_args()
+{
+	case $1 in
+	n) num_events=$2;;
+	esac
+}
+
+# Find a free file handle
+free_fd()
+{
+	local fd
+
+	for fd in $(seq 200); do
+		# Sapwn a new sh, because redirecting to a non existing file handle
+		# will trigger a syntax error.
+		/bin/sh -c ": 2>/dev/null >&$fd || : 2>/dev/null <&$fd" 2>/dev/null
+		if [ $? -eq 2 ]; then
+			echo $fd
+			return
+		fi
+	done
+}
+
 setup()
 {
 	if ! grep -q cn_proc /proc/net/connector; then
@@ -31,7 +67,9 @@ setup()
 test()
 {
 	local event=$2
-	local expected_events lis_rc pid
+	local expected_events lis_rc pid fd_act failed act_nevents exp act
+
+	tst_res TINFO "Testing $2 event (nevents=$num_events)"
 
 	pec_listener >lis_$event.log 2>lis_$event.err &
 	pid=$!
@@ -39,28 +77,66 @@ test()
 	tst_sleep 100ms
 
 	# generator must be in PATH
-	ROD event_generator -n $NUM_EVENTS -e $event \>gen_$event.log 2\>gen_$event.err
+	ROD event_generator -n $num_events -e $event \>gen_$event.log 2\>gen_$event.err
 
-	# sleep until pec_listener has seen and handled all of the generated events
-	tst_sleep 100ms
 	kill -s INT $pid 2> /dev/null
 	wait $pid
 	lis_rc=$?
 
 	if [ ! -s gen_$event.log ]; then
-		tst_brk TBROK "failed to generate process events"
+		tst_brk TBROK "failed to generate process events: $(cat gen_$event.err)"
 	fi
 
 	if [ $lis_rc -ne 0 ]; then
 		tst_brk TBROK "failed to execute the listener: $(cat lis_$event.err)"
 	fi
 
-	expected_events="$(cat gen_$event.log)"
-	if grep -q "$expected_events" lis_$event.log; then
-		tst_res TPASS "$event detected by listener"
+	# The listener writes the same messages as the generator, but it can
+	# also see more events (e.g. for testing exit, a fork is generated).
+	# So: The events generated by the generator have to be in the same order
+	# as the events printed by the listener, but my interleaved with other
+	# messages. To correctly compare them, we have to open both logs
+	# and iterate over both of them at the same time, skipping messages
+	# in the listener log, that are not of interest.
+	# Because some messages may be multiple times in the listener log,
+	# we have to open it only once!
+	# This however does not check, if the listener sees more messages,
+	# than expected.
+
+	fd_act=$(free_fd)
+	[ -z "$fd_act" ] && tst_brk TBROK "No free filehandle found"
+	eval "exec ${fd_act}<lis_$event.log"
+
+	failed=0
+	act_nevents=0
+	while read -r exp; do
+		local found=0
+		act_nevents=$((act_nevents + 1))
+		while read -r act; do
+			if [ "$exp" = "$act" ]; then
+				found=1
+				break
+			fi
+		done <&${fd_act}
+		if [ $found -ne 1 ]; then
+			failed=1
+			tst_res TFAIL "Event was not detected by the event listener: $exp"
+			break
+		fi
+	done <gen_$event.log
+
+	eval "exec ${fd_act}<&-"
+
+	if [ $failed -eq 0 ]; then
+		if [ $act_nevents -ne $num_events ]; then
+			tst_res TBROK "Expected $num_events, but $act_nevents generated"
+		else
+			tst_res TPASS "All events detected"
+		fi
 	else
-		tst_res TFAIL "$event not detected by listener"
-	fi
+		# TFAIL message is already printed in the loop above
+		cat lis_$event.log
+ 	fi
 }
 
 tst_run
diff --git a/testcases/kernel/connectors/pec/event_generator.c b/testcases/kernel/connectors/pec/event_generator.c
index 0a90b91c4..62e341268 100644
--- a/testcases/kernel/connectors/pec/event_generator.c
+++ b/testcases/kernel/connectors/pec/event_generator.c
@@ -93,16 +93,8 @@ static void gen_exec(void)
  */
 static inline void gen_fork(void)
 {
-	pid_t pid;
-	int status;
-
-	pid = SAFE_FORK();
-	if (pid == 0) {
-		printf("fork parent: %d, child: %d\n", getppid(), getpid());
-		exit(0);
-	} else {		/* Parent should wait for the child */
-		wait(&status);
-	}
+	/* The actual fork is already done in main */
+	printf("fork parent: %d, child: %d\n", getppid(), getpid());
 }
 
 /**
@@ -110,16 +102,10 @@ static inline void gen_fork(void)
  */
 static inline void gen_exit(void)
 {
-	pid_t pid;
-	int status;
-
-	pid = SAFE_FORK();
-	if (pid == 0) {
-		printf("exit pid: %d exit_code: %d\n", getpid(), 0);
-		exit(0);
-	} else {
-		wait(&status);
-	}
+	/* exit_signal will always be SIGCHLD, if the process terminates cleanly */
+	printf("exit pid: %d exit_code: %d exit_signal: %d\n",
+	       getpid(), 0, SIGCHLD);
+	/* exit is called by main already */
 }
 
 /*
@@ -128,7 +114,7 @@ static inline void gen_exit(void)
 static inline void gen_uid(void)
 {
 	SAFE_SETUID(ltp_uid);
-	printf("uid pid: %d euid: %d\n", getpid(), ltp_uid);
+	printf("uid pid: %d euid: %d ruid: %d\n", getpid(), ltp_uid, ltp_uid);
 }
 
 /*
@@ -137,7 +123,7 @@ static inline void gen_uid(void)
 static inline void gen_gid(void)
 {
 	SAFE_SETGID(ltp_gid);
-	printf("gid pid: %d egid: %d\n", getpid(), ltp_gid);
+	printf("gid pid: %d egid: %d rgid: %u\n", getpid(), ltp_gid, ltp_gid);
 }
 
 /*
@@ -210,8 +196,6 @@ int main(int argc, char **argv)
 	ltp_uid = ent->pw_uid;
 	ltp_gid = ent->pw_gid;
 
-	signal(SIGCHLD, SIG_IGN);
-
 	/* special processing for gen_exec, see comments above gen_exec() */
 	if (gen_event == gen_exec) {
 		exec_argv = argv;
@@ -223,8 +207,26 @@ int main(int argc, char **argv)
 	}
 
 	/* other events */
-	for (i = 0; i < nr_event; i++)
-		gen_event();
+	for (i = 0; i < nr_event; i++) {
+		pid_t pid;
+		int status;
+
+		pid = SAFE_FORK();
+		if (pid == 0) {
+			gen_event();
+			exit(0);
+		} else {
+			if (pid != SAFE_WAITPID(pid, &status, 0)) {
+				fprintf(stderr,
+				        "Child process did not terminate as expected\n");
+				return 1;
+			}
+			if (WEXITSTATUS(status) != 0) {
+				fprintf(stderr, "Child process did not terminate with 0\n");
+				return 1;
+			}
+		}
+	}
 
 	return 0;
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
