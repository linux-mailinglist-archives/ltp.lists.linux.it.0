Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73072B16
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:07:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A7EE3C1CFA
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:07:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 12BC23C0138
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:07:19 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 193C71A013C9
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:07:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 21E812F8BDA
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 09:07:14 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CE3619C70
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 09:07:13 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jul 2019 11:07:10 +0200
Message-Id: <6db4a928733290dca3b2e4b4a27f1cb69d805401.1563959090.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 24 Jul 2019 09:07:14 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syslog: fix sporadic failures due to rate-limitting
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Some distros (Fedora30) do not have rsyslog installed by default.
Also some test environments generate a lot of messages before they
start syslogs tests.

This creates a problem if rsyslog is using imjournal, because by default
rate-limitting is enabled. If there is a big backlog of messages
prior to running syslog tests, some messages from tests may be dropped.

Easy way to reproduce is to stop rsyslog, delete imjournal.state,
run kmsg01 test couple times and then run some syslog test:
  Jul 23 15:05:13 ... begin to drop messages due to rate-limiting
  Jul 23 15:05:21 ... 47006 messages lost due to rate-limiting
Messages make it to systemd journal, but not to log configured in rsyslog.

This patch adds Ratelimit.Interval="0" and IgnorePreviousMessages="on"
to config for imjournal:
  https://www.rsyslog.com/doc/v8-stable/configuration/modules/imjournal.html

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/syslog/syslog-lib.sh | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/syscalls/syslog/syslog-lib.sh b/testcases/kernel/syscalls/syslog/syslog-lib.sh
index 31266f93e729..eed501d9b3ad 100755
--- a/testcases/kernel/syscalls/syslog/syslog-lib.sh
+++ b/testcases/kernel/syscalls/syslog/syslog-lib.sh
@@ -75,19 +75,19 @@ setup()
 		#   $ModLoad imjournal
 		#   module(load="imjournal"...)
 		# in rsyslog config, and using those settings.
-		if grep -qri '^[^#].*load.*imjournal' /etc/rsyslog.conf /etc/rsyslog.d/ ; then
-			systemd_journal=$(grep -Ehoi "^[^#].*(imjournal|workdirectory).*" -r /etc/rsyslog.conf /etc/rsyslog.d/)
-			RSYSLOG_CONFIG=$(cat <<EOF
-$systemd_journal
-EOF
-)
+		if grep -qri '^[^#]*modload.*imjournal' /etc/rsyslog.conf /etc/rsyslog.d/; then
+			RSYSLOG_CONFIG=$(grep -Ehoi "^[^#].*(imjournal|workdirectory).*" -r /etc/rsyslog.conf /etc/rsyslog.d/;
+				echo '$imjournalRatelimitInterval 0'; \
+				echo '$ImjournalIgnorePreviousMessages on';)
+		elif grep -qri '^[^#]*module.*load="imjournal"' /etc/rsyslog.conf /etc/rsyslog.d/; then
+			RSYSLOG_CONFIG=$(grep -Ehoi "^[^#].*workdirectory.*" -r /etc/rsyslog.conf /etc/rsyslog.d/; \
+				echo 'module(load="imjournal"'; \
+				echo '       StateFile="imjournal.state"'; \
+				echo '       Ratelimit.Interval="0"'; \
+				echo '       IgnorePreviousMessages="on")')
 		else
-			log_socket=$(grep -ho "^\$SystemLogSocketName .*" -r /etc/rsyslog.conf /etc/rsyslog.d/ | head -1)
-			RSYSLOG_CONFIG=$(cat <<EOF
-\$ModLoad imuxsock.so
-$log_socket
-EOF
-)
+			RSYSLOG_CONFIG=$(echo '$ModLoad imuxsock.so'; \
+				grep -ho "^\$SystemLogSocketName .*" -r /etc/rsyslog.conf /etc/rsyslog.d/ | head -1)
 		fi
 	else
 		tst_resm TCONF "Couldn't find syslogd, syslog-ng or rsyslogd"
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
