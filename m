Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B133AECB
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 10:29:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4182E3C6461
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 10:29:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EBABD3C088E
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 10:29:02 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 32D03600651
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 10:29:02 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.4.45])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 319B6A164A;
 Mon, 15 Mar 2021 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1615800540; bh=ZuQbYvKEl3tjj6cKP84PRTG0NywxJKymajnI3Ru7PAY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=rR9hxlTnwAHiw+v9zfYWvXBeHIIH/eNoMtOAfvk4fdLubDa1+M/UJ/X7fwfdMMW6P
 /wZjMpEspU6taoR9ayiZCccd9CKETMy847UaIE873QGK1O7YPFzd5ugDsm10DqActM
 dklbR5cfMEWkytgH8myLMIo9G/mtr+154TmABwy8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Mon, 15 Mar 2021 10:28:44 +0100
Message-Id: <20210315092844.991073-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315092844.991073-1-lkml@jv-coder.de>
References: <20210315092844.991073-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] pec: Fix multiple event test
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
 testcases/kernel/connectors/pec/cn_pec.sh     | 98 ++++++++++++++++---
 .../kernel/connectors/pec/event_generator.c   | 54 +++++-----
 2 files changed, 113 insertions(+), 39 deletions(-)

diff --git a/testcases/kernel/connectors/pec/cn_pec.sh b/testcases/kernel/connectors/pec/cn_pec.sh
index 98abd50fc..b46ce533f 100755
--- a/testcases/kernel/connectors/pec/cn_pec.sh
+++ b/testcases/kernel/connectors/pec/cn_pec.sh
@@ -9,16 +9,48 @@
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
+free_fd()
+{
+	# Find a free file handle
+	local found
+	for fd in $(seq 200); do
+    	rco="$(true 2>/dev/null >&${fd}; echo $?)"
+    	rci="$(true 2>/dev/null <&${fd}; echo $?)"
+    	[[ "${rco}${rci}" = "11" ]] && found=${fd} && break
+	done
+	echo $found
+}
+
 setup()
 {	
 	if ! grep -q cn_proc /proc/net/connector; then
@@ -32,35 +64,75 @@ setup()
 test()
 {
 	local event=$2
+
+	tst_res TINFO "Testing $2 event (nevents=$num_events)"
+
 	pec_listener >lis_$event.log 2>lis_$event.err &
-	pid=$!
+	lis_pid=$!
 	# Wait for pec_listener to start listening
 	tst_sleep 100ms
 
 	# Run with absolute path, so the generator can exec itself
 	generator="$(command -v event_generator)"
-	"$generator" -n $NUM_EVENTS -e $event >gen_$event.log 2>gen_$event.err
+	"$generator" -n $num_events -e $event >gen_$event.log 2>gen_$event.err
 	gen_rc=$?
 
-	# Sleep until pec_listener has seen and handled all of the generated events
-	tst_sleep 100ms
-	kill -s SIGINT $pid 2> /dev/null
-	wait $pid
+	kill -s SIGINT $lis_pid 2> /dev/null
+	wait $lis_pid
 	lis_rc=$?
 
 	if [ $gen_rc -ne 0 -o ! -s gen_$event.log ]; then
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
+		while read -r <&${fd_act} act; do
+			if [ "$exp" = "$act" ]; then
+				found=1
+				break
+			fi
+		done
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
+		cat lis_$event.log
 	fi
 }
 
diff --git a/testcases/kernel/connectors/pec/event_generator.c b/testcases/kernel/connectors/pec/event_generator.c
index 77c6c0515..2b1f64f87 100644
--- a/testcases/kernel/connectors/pec/event_generator.c
+++ b/testcases/kernel/connectors/pec/event_generator.c
@@ -94,16 +94,8 @@ static void gen_exec(void)
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
@@ -111,16 +103,10 @@ static inline void gen_fork(void)
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
@@ -129,7 +115,7 @@ static inline void gen_exit(void)
 static inline void gen_uid(void)
 {
 	SAFE_SETUID(ltp_uid);
-	printf("uid pid: %d euid: %d\n", getpid(), ltp_uid);
+	printf("uid pid: %d euid: %d ruid: %d\n", getpid(), ltp_uid, ltp_uid);
 }
 
 /*
@@ -138,7 +124,7 @@ static inline void gen_uid(void)
 static inline void gen_gid(void)
 {
 	SAFE_SETGID(ltp_gid);
-	printf("gid pid: %d egid: %d\n", getpid(), ltp_gid);
+	printf("gid pid: %d egid: %d rgid: %u\n", getpid(), ltp_gid, ltp_gid);
 }
 
 /*
@@ -211,8 +197,6 @@ int main(int argc, char **argv)
 	ltp_uid = ent->pw_uid;
 	ltp_gid = ent->pw_gid;
 
-	signal(SIGCHLD, SIG_IGN);
-
 	/* special processing for gen_exec, see comments above gen_exec() */
 	if (gen_event == gen_exec) {
 		exec_argv = argv;
@@ -224,8 +208,26 @@ int main(int argc, char **argv)
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
