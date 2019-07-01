Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384B5BAD3
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 13:37:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41A6E3C1D77
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 13:37:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 841083C1D64
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 13:37:28 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id EB5526011A7
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 13:37:27 +0200 (CEST)
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hhucg-0001Dj-Cn
 for ltp@lists.linux.it; Mon, 01 Jul 2019 11:37:26 +0000
Received: by mail-pf1-f200.google.com with SMTP id j22so3258939pfe.11
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 04:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=HF4DwFgnHRYiZF0Srg2bbAjcFXD1KYPKgtbzYZMVy5M=;
 b=jzRfmNQf0PiHxf/BAXbWnD3ITFKGk6AMEudwTDDyySwvMPiJxet9fyOKsWY64iO1z6
 nri5fWpznV3ETJMrqlG36XcSktN4cBU/Jv7pX3qMz9icFezJ+E6PfAA84HO9Qpr8751e
 MiIt71E0ND4ZtIzkkh+93ypGg2Y54marlNNAlz9xKK4OA9EKXRQUiv2NeLPeE5MlERIF
 Rh7bJgr28UHtrMxMLke+q0p2T5ew+FsMdQGvxIilIOWSOi0MgvFpWGwL55HFWoRYx30H
 YmNBlnW/cXizzKJGOqr2W0muDtsL/nbzIz6dnPCrhPzjWLC3l2NHqeK5kjLsNniTfj1t
 3s9g==
X-Gm-Message-State: APjAAAVGNKJF+yVknyFURXrjPqzi57bPc4pPTnkUsXxX1muKhudowWG1
 4Dk5h9nYwAMpWM8IvheJMWV/sIDwBR8swnRCt+vwOL3+Vq7jdvoIwwyAzzBoxQ33+wQVyfSBLBP
 BZ6KUorSTq/z8yGQDZuKtTRqpWCI=
X-Received: by 2002:a17:90a:1a0d:: with SMTP id
 13mr29132417pjk.99.1561981044928; 
 Mon, 01 Jul 2019 04:37:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDWZ8TaiPUWTaKu7jd2BxCeXYBpCRrd2PIeSm1hNqYDbT8ulVGmDUyByk6jQaf4t+vYWrCvw==
X-Received: by 2002:a17:90a:1a0d:: with SMTP id
 13mr29132398pjk.99.1561981044621; 
 Mon, 01 Jul 2019 04:37:24 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id v13sm11003655pfe.105.2019.07.01.04.37.23
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 04:37:23 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Mon,  1 Jul 2019 19:37:05 +0800
Message-Id: <20190701113705.2758-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] zram/zram_lib.sh: fix local variable assignment
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

The compression algorithm was stored into a local variable "algs",
however the variable name "zram_algs" was used in the for loop later.

Unify them with "zram_algs", and use sed to get rid of the square
brackets that indicates the compression algorithm currently in use.
    $ cat /sys/block/zram0/comp_algorithm
    [lzo] lz4 lz4hc 842 zstd

Also, the /bin/sh was symbolically link to dash in Ubuntu.
This is making the one-liner local variable assignment not working [1]:
    /opt/ltp/testcases/bin/zram01.sh: 102: local: 842: bad variable name

Break it into two lines to solve this issue.

[1] https://wiki.ubuntu.com/DashAsBinSh#local

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 45116af3e..a19d03a01 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -98,11 +98,13 @@ zram_compress_alg()
 
 	tst_resm TINFO "test that we can set compression algorithm"
 
-	local algs=$(cat /sys/block/zram0/comp_algorithm)
-	tst_resm TINFO "supported algs: $algs"
+	local zram_algs
+	zram_algs=$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)
+	tst_resm TINFO "supported algs: $zram_algs"
 	local i=0
 	for alg in $zram_algs; do
-		local sys_path="/sys/block/zram${i}/comp_algorithm"
+		local sys_path
+		sys_path="/sys/block/zram${i}/comp_algorithm"
 		echo "$alg" >  $sys_path || \
 			tst_brkm TFAIL "can't set '$alg' to $sys_path"
 		i=$(($i + 1))
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
