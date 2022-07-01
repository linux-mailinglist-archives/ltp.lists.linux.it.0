Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B8563BD2
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Jul 2022 23:38:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D77C3C9A57
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Jul 2022 23:38:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18FC13C1D12
 for <ltp@lists.linux.it>; Fri,  1 Jul 2022 23:38:03 +0200 (CEST)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6CD736007A6
 for <ltp@lists.linux.it>; Fri,  1 Jul 2022 23:38:03 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-317765eb7ccso27788307b3.13
 for <ltp@lists.linux.it>; Fri, 01 Jul 2022 14:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1nysJa4g5+mw2Jx1vbrbk3d8erJUfbWG8NJLrFOhw9U=;
 b=gckztCmqBr8NQNtnCwplqOIBZxTonodoY09BJ55OQe28fMtOyAbBY7ZtUB5+WLTiSl
 1PaqhjAQfwwPTKgGokgQQHniQOHmatVFqoTSgUsJFMqqG76SejbA3puNywrRbB+tkhhr
 zhKzbS5u1ynf77lZureuPQR3GdhUUw8bV0cficnAvhMd/9WB/wLQUFIRYE5imbsIERB4
 1Xuej783aZehsIfXQlBlrroeZeJlUeg6wAa8tfdC+UPgd29TaK6G6oPkmPsxCqHsuAaW
 eCxl46arFidygxOIMO1/L4E6ndco2/5LZet6x9n2wU6xIxVnBSB4OE/LEXyCdoNLBAvE
 tWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1nysJa4g5+mw2Jx1vbrbk3d8erJUfbWG8NJLrFOhw9U=;
 b=0T6M5lfQ3W3YjAE7zQw31T9uyDY57ARJGgmtlt6Atk/7IdAA7jj42MabLLpOTdohJz
 neB+YgCjS7T5zrFJ9dBF5iMvrUSd45yCig3cagPUvEToYMu3ScPZDSelDX2QPpyTSM9z
 aErTuF1GboHtu1oesfFKE8w/s7F8dznFqeG31emEsTsY8YHtFdt0JRqsYn65PXwtewd8
 z3Th1+QyVQEERxithyTQRhNUODYjGMtL+kWVFzylGAINoEeSBKBybJ393QHmoYSt3L7M
 eXlXAXTElJKHa9Qe+K/wZLu0GePOIGOElSEDxaEoq7SCN2w5ApZ1vOXgi2HhtBRZrSDK
 EspQ==
X-Gm-Message-State: AJIora+WCJ5tZH+2FhlOF/wxuxCxgFP2q7wMG5CR64NpN5tnIduCeHg0
 qs36N3ZgzqgCeAPjzWB6jQ1WIQLogdVN1TGw0KsrM5eRtl23wmpXs56cLHrk+YfGQPMWS3CpZxf
 qRqqiHE/KdVVguw89WijOE94S8oXaL4bBk9R3PnYJxgjFRR0SyYDH3Rk7
X-Google-Smtp-Source: AGRyM1sFOT/g8UFaDrgKCsuhHJkflxIvwWEGF/8Lb3Ig5vy/tDJCGKr+FBusKvHmVOKDKEVkYgZsDK/1mD4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4be])
 (user=edliaw job=sendgmr) by 2002:a25:abc9:0:b0:66c:9e77:585b with
 SMTP id
 v67-20020a25abc9000000b0066c9e77585bmr16507278ybi.96.1656711481876; Fri, 01
 Jul 2022 14:38:01 -0700 (PDT)
Date: Fri,  1 Jul 2022 21:37:49 +0000
Message-Id: <20220701213749.3744031-1-edliaw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1] controllers.memcg_regression: add trap to clean up
 directories
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The memcg_regression test creates a memcg/ directory that can be left
behind if the test exits unexpectedly.  Use a trap to clean up the
directories on exit.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../memcg/regression/memcg_regression_test.sh | 20 +++++++++++--------
 .../memcg/regression/memcg_test_4.sh          | 11 ++++++----
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/regression/memcg_regression_test.sh b/testcases/kernel/controllers/memcg/regression/memcg_regression_test.sh
index c91a4069e..2467ae0e6 100755
--- a/testcases/kernel/controllers/memcg/regression/memcg_regression_test.sh
+++ b/testcases/kernel/controllers/memcg/regression/memcg_regression_test.sh
@@ -54,6 +54,15 @@ nr_null=0
 nr_warning=0
 nr_lockdep=0
 
+clean_up()
+{
+	# remove the cgroup
+	rmdir memcg/0 2> /dev/null
+	# unmount cgroup if still mounted
+	umount memcg/
+	rmdir memcg/
+}
+
 # check_kernel_bug - check if some kind of kernel bug happened
 check_kernel_bug()
 {
@@ -102,12 +111,12 @@ check_kernel_bug()
 #---------------------------------------------------------------------------
 test_1()
 {
-	mkdir memcg/0/
+	mkdir memcg/0
 	echo 0 > memcg/0/memory.limit_in_bytes
 
 	./memcg_test_1
 
-	rmdir memcg/0/
+	rmdir memcg/0
 
 	check_kernel_bug
 	if [ $? -eq 1 ]; then
@@ -211,14 +220,12 @@ test_4()
 	killall -9 memcg_test_4 2> /dev/null
 	killall -9 memcg_test_4.sh 2> /dev/null
 
-	# if test_4.sh gets killed, it won't clean cgroup it created
-	rmdir memcg/0 2> /dev/null
-
 	swapon -a
 }
 
 # main
 failed=0
+trap clean_up EXIT
 mkdir memcg/
 
 for cur in $(seq 1 $TST_TOTAL); do
@@ -236,7 +243,4 @@ for cur in $(seq 1 $TST_TOTAL); do
 	umount memcg/
 done
 
-rmdir memcg/
-
 exit $failed
-
diff --git a/testcases/kernel/controllers/memcg/regression/memcg_test_4.sh b/testcases/kernel/controllers/memcg/regression/memcg_test_4.sh
index 620031366..d002601f1 100755
--- a/testcases/kernel/controllers/memcg/regression/memcg_test_4.sh
+++ b/testcases/kernel/controllers/memcg/regression/memcg_test_4.sh
@@ -22,6 +22,13 @@
 ##                                                                            ##
 ################################################################################
 
+clean_up()
+{
+	# remove the cgroup when exiting
+	rmdir memcg/0
+}
+
+trap clean_up EXIT
 # attach current task to memcg/0/
 mkdir memcg/0
 echo $$ > memcg/0/tasks
@@ -42,7 +49,3 @@ swapoff -a
 sleep 1
 echo $pid > memcg/tasks 2> /dev/null
 echo $$ > memcg/tasks 2> /dev/null
-
-# now remove the cgroup
-rmdir memcg/0
-
-- 
2.37.0.rc0.161.g10f37bed90-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
