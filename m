Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3D528EE
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 12:04:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3117C3C13BB
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 12:04:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B1FA63C12B6
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 12:04:08 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6DB6760070C
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 12:04:10 +0200 (CEST)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hfiJ4-0005h3-EK
 for ltp@lists.linux.it; Tue, 25 Jun 2019 10:04:06 +0000
Received: by mail-pl1-f197.google.com with SMTP id s22so8964563plp.5
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 03:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=RfQzVoVEwJCmpNI2BNg4xVNS6v2/PXQgB8JxizfutSs=;
 b=uVVzJ5ZmhUZl6wwH4pcsX5Fp0PJ19DaQiFfAyHE3ZtRC2TlqDL2ih3SEvCkLO7qgLu
 53O0UdwuhARmbZXRHvEQKuiNSUQQZL2Xe/Xpt9L0A6FTbVlC8ZcgdLu2v8NhbYR9+pLp
 BywT5dTu2ZuCdUvMZVT5p4DWqZqNFySY/T276Uw2YX1lZEUfDiJRUoNg3XjsthW5BpNj
 4bDlZpJ6eMFtbPYehd3yrqGS9yLx1XTttSqcv32ml2OHm89G/NVeHty4ChRaMNJQB21Z
 02Y7guCV+9hqce/KqIVt4GGaX1u+1AI4xn/VYGzomPi+2t8nbdF6Qaudi+qDgbgzXx/Q
 pENA==
X-Gm-Message-State: APjAAAVIhUT66zuiWC7FbSA2vIwKbkqa691oVuRnizgByfX7KogaOe9n
 RS0/OkD2hKqQ+ADLhq2ffSOMfWZNJZ0Cy2KHrAfxYQ+Pw2shnqvKTtkrXhMRyVDJA0XaiuSi6B9
 99iugl09Aw3bDCccM0/3yqRkfPCA=
X-Received: by 2002:a63:80c7:: with SMTP id
 j190mr20578488pgd.410.1561457044908; 
 Tue, 25 Jun 2019 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnXefEYQEXi+vCG90EpGIAKjBpmcRdkG9vUnkbLQcT5F9ZX7lT20Elx5Uxmhd0M87wiIh+fg==
X-Received: by 2002:a63:80c7:: with SMTP id
 j190mr20578437pgd.410.1561457044319; 
 Tue, 25 Jun 2019 03:04:04 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id 5sm13599167pfh.109.2019.06.25.03.04.03
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 03:04:03 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 25 Jun 2019 18:03:51 +0800
Message-Id: <20190625100351.19800-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] runpwtests03: use expr to calculate total_cpus for
 runpwtests03
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

The arithmetic operation (( total_cpus-=1 )) does not work for dash,
which was symbolic linked to /bin/sh on some OS like Ubuntu.

In such case, people will see error like:
  runpwtests03.sh: total_cpus-=1: not found

And this further leads to access for a non-existing file and cause
false-positive result in the end:
  runpwtests03.sh: cannot create
  /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor: Directory nonexistent
  runpwtests03.sh: FAIL: Unable to set governor -- powersave for cpu8
  Power_Management03 2 TFAIL: Changing governors

Use expr instead for fix this issue.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/power_management/runpwtests03.sh | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
index 11197937f..3fb85d273 100755
--- a/testcases/kernel/power_management/runpwtests03.sh
+++ b/testcases/kernel/power_management/runpwtests03.sh
@@ -25,8 +25,7 @@ export TST_TOTAL=4
 . pm_include.sh
 
 check_cpufreq_sysfs_files() {
-	total_cpus=$(tst_ncpus)
-	(( total_cpus-=1 ))
+	total_cpus=`expr $(tst_ncpus) - 1`
 	RC=0
 
 	for cpu in $(seq 0 "${total_cpus}" )
@@ -51,8 +50,7 @@ check_cpufreq_sysfs_files() {
 change_govr() {
 	available_govr=$(get_supporting_govr)
 
-	total_cpus=$(tst_ncpus)
-	(( total_cpus-=1 ))
+	total_cpus=`expr $(tst_ncpus) - 1`
 	RC=0
 
 	for cpu in $(seq 0 "${total_cpus}" )
@@ -79,8 +77,7 @@ change_freq() {
 	available_govr=$(get_supporting_govr)
 	RC=0
 
-	total_cpus=$(tst_ncpus)
-	(( total_cpus-=1 ))
+	total_cpus=`expr $(tst_ncpus) - 1`
 
 	if ( echo ${available_govr} | grep -i "userspace" \
 		>/dev/null 2>&1 ); then
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
