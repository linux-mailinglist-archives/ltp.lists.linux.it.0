Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144472127FE
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 17:36:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AEA93C2A6E
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 17:36:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0AD243C185E
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 17:36:02 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 812BD1A017C1
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 17:36:01 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id ED1CD20B7188;
 Thu,  2 Jul 2020 08:35:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ED1CD20B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1593704160;
 bh=03nbl+iFuiB7QIrlhRdMYrQud8qhaYwTynrsYxwma/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qXoXlQljiBWPNe30nyeaD4fomcfmOhdZSDlbl3kJIcuhV+AkPPERgC7kORja6phMw
 xbHGrAE4NkIfaiVi9gVri+3dMz3w5FJyASR59iJBhOMavxFYs27ymLyd121HYN3GNJ
 1vX9yDFaEB+VGMKk7RKXoX0668mNvUax23jsqEw0=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com,
	pvorel@suse.cz,
	ltp@lists.linux.it
Date: Thu,  2 Jul 2020 11:35:45 -0400
Message-Id: <20200702153545.3126-3-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702153545.3126-1-t-josne@linux.microsoft.com>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] IMA: Verify IMA buffer passing through the kexec
 barrier
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a testcase that verifies that kexec correctly passes
the IMA buffer through the soft reboot.

This test must be run standalone, since it runs kexec.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 testcases/kexec/README.md     |  4 ++++
 testcases/kexec/ima_buffer.sh | 42 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100755 testcases/kexec/ima_buffer.sh

diff --git a/testcases/kexec/README.md b/testcases/kexec/README.md
index 42988cd7b..f4018387e 100644
--- a/testcases/kexec/README.md
+++ b/testcases/kexec/README.md
@@ -24,3 +24,7 @@ Running
 - kexec cmdline measurement
     1. `IMAGE=<path to kernel image> testcases/kexec/cmdline.sh start`
     2. Runtime logs will be emitted in `testcases/kexec/kexec_cmdline.log`.
+
+- kexec ima buffer passing
+    1. `IMAGE=<path to kernel image> testcases/kexec/ima_buffer.sh start`
+    2. Runtime logs will be emitted in `testcases/kexec/kexec_ima_buffer.log`.
diff --git a/testcases/kexec/ima_buffer.sh b/testcases/kexec/ima_buffer.sh
new file mode 100755
index 000000000..3ce661236
--- /dev/null
+++ b/testcases/kexec/ima_buffer.sh
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+ASCII_MEASUREMENTS="/sys/kernel/security/integrity/ima/ascii_runtime_measurements"
+SCRIPT_DIR="$(dirname $(realpath $0))"
+IMAGE=$(realpath "${IMAGE:-$SCRIPT_DIR/Image}")
+LOG_FILE="$SCRIPT_DIR/kexec_ima_buffer.log"
+
+. $SCRIPT_DIR/utils.sh
+
+must_be_root
+on_correct_machine
+
+case $1 in
+    start)
+        # Start the state machine
+        cp $ASCII_MEASUREMENTS /etc/saved-ima-buffer
+
+        install 1
+        if ! kexec -s $IMAGE --reuse-cmdline; then
+            echo "kexec failed: $?" >> $LOG_FILE
+        fi
+        ;;
+    1)
+        update-rc.d resume-after-kexec remove
+        rm /etc/init.d/resume-after-kexec
+
+        n_lines=$(wc -l /etc/saved-ima-buffer | cut -d' ' -f1)
+        if cat $ASCII_MEASUREMENTS | \
+            head -n $n_lines | \
+            cmp -s - /etc/saved-ima-buffer
+        then
+            echo "test succeeded" > $LOG_FILE
+        else
+            echo "test failed" > $LOG_FILE
+        fi
+
+        rm /etc/saved-ima-buffer
+        ;;
+    *)
+        echo "You must run '$0 start' to begin the test"
+        ;;
+esac
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
