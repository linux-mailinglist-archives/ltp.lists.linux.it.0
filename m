Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A96EFC3A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 12:20:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B51103C22BE
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 12:20:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 43EBD3C0428
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 12:20:22 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B2BE1A011F1
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 12:20:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D0D0B4F3
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 11:20:20 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>,
	ltp@lists.linux.it
Date: Tue,  5 Nov 2019 12:20:00 +0100
Message-Id: <20191105112000.20633-1-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1] cgroup_fj_stress: Avoid killall
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

We discovered problems that killall didn't catched all processes. With
this patch, we collect the pids manually and kill them one after the
other.

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh
index 698aa4979..27ea7634a 100755
--- a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh
+++ b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_stress.sh
@@ -74,6 +74,7 @@ setup
 export TMPFILE=./tmp_tasks.$$
 
 count=0
+collected_pids=""
 
 build_subgroups()
 {
@@ -107,6 +108,7 @@ attach_task()
     if [ -z "$ppid" ]; then
         cgroup_fj_proc&
         pid=$!
+        collected_pids="$collected_pids $pid"
     else
         pid="$ppid"
     fi
@@ -148,9 +150,10 @@ case $attach_operation in
 "each" )
     tst_resm TINFO "Attaching task to each subgroup"
     attach_task "$start_path" 0
-    ROD killall -9 "cgroup_fj_proc"
-    # Wait for attached tasks to terminate
-    wait
+    for pid in $collected_pids; do
+        ROD kill -9 "$pid"
+        wait "$pid"
+    done
     ;;
 *  )
     ;;
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
