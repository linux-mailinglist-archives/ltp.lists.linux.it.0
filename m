Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AB3A290A
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 12:09:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF2E13C4D81
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 12:09:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70DD63C313C
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 12:09:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1C4C6601AF9
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 12:09:36 +0200 (CEST)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrHd2-0006cN-02
 for ltp@lists.linux.it; Thu, 10 Jun 2021 10:09:36 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 z3-20020adfdf830000b02901198337bc39so674085wrl.0
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 03:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDkYVLnciyyBGGAbVRaJesYo0njKoJVC7u4PvEjTgfY=;
 b=AknVlQ24xgpT3gG8cNOUl6dAHb4zyXDiPDeVZng6U5p0j8hbz1OCeap22q30V4BeTM
 VPmTF74MOTSUL/F16YFHRh+v6p+NFfjJW+rbqfRfzmLHR7gs+mgs8lOoJKdlaBq8iKrs
 rTxVofmw5oSp0RC6Rbn/dZSJZRyoKbzqAjF8qLtJesywVBBP77QYqxAGfaptR27v9Zlo
 JcfvV1YWpZp8UP5eJFSowh0vhO87sLZri4vOy9dTigGAvmMGFNsfA3sVnfSgCySDiYoo
 Rq2XzkPa0SfKl2MMyZsabEuNwoU0tc4YP5NzJtezVai2eXjwbGkoly7CQRW0wcgiFueF
 5HGA==
X-Gm-Message-State: AOAM5320NVyTUhiqoTcV2uMjMPYUQb6DjNCDyW/dp+Za6nJgtfKOxZXo
 CCING/5oYzQ8zUoO8aFH5ECx9a+1gIrFt529plo9f6KXBLgCd69a7cNv3R3j9PoQwfKtCaS/eF2
 r81NzhM7P1UpqKb9P/hR/bwAKpXLv
X-Received: by 2002:adf:f946:: with SMTP id q6mr4355976wrr.283.1623319775135; 
 Thu, 10 Jun 2021 03:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxttpXCMvrdsGcIm2f+gFALxAPa7+kxnOkvozhtRLsCzhbSSzoX/fjr6UB44SkqT1I67T1x6Q==
X-Received: by 2002:adf:f946:: with SMTP id q6mr4355961wrr.283.1623319774987; 
 Thu, 10 Jun 2021 03:09:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id 6sm2527849wmg.17.2021.06.10.03.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 03:09:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 10 Jun 2021 12:09:26 +0200
Message-Id: <20210610100927.32015-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] controllers/cpuacct: skip cpuacct_100_100 on
 small memory systems
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

Running cpuacct_100_100 on a system with less than ~4 GB of RAM fails:

    cpuacct 1 TINFO: timeout per run is 0h 5m 0s
    cpuacct 1 TINFO: cpuacct: /sys/fs/cgroup/cpu,cpuacct
    cpuacct 1 TINFO: Creating 100 subgroups each with 100 processes
    testcases/bin/cpuacct.sh: 0: Cannot fork

In dmesg:

    LTP: starting cpuacct_100_100 (cpuacct.sh 100 100)
    cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope

It seems system might not handle or not allow that amount of processes,
so simply skip the test.  The threshold of ~4 GB was found during
experimenting, so it is not accurate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/controllers/cpuacct/cpuacct.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 323aa7513bf4..2646018d295e 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -44,6 +44,20 @@ setup()
 		tst_brk TCONF "cpuacct not supported on this system"
 	fi
 
+	if [ $max -ge 100 ] && [ $nbprocess -ge 100 ]; then
+		local memtotal=`awk '/MemTotal/ {print $2}' /proc/meminfo`
+		if [ $? -eq 0 ]; then
+			# cpuacct.sh 100 100 will fail if memory is less
+			# than 4 GB with:
+			#   testcases/bin/cpuacct.sh: 0: Cannot fork
+			# Choose some limit of total memory, determined
+			# with experiments: 3*1024+768 MB = 3932160 kB
+			if [ $memtotal -lt 3932160 ]; then
+				tst_brk TCONF "not enough of memory on this system (less than 3840 MB)"
+			fi
+		fi
+	fi
+
 	mount_point=`grep -w cpuacct /proc/mounts | cut -f 2 | cut -d " " -f2`
 	tst_res TINFO "cpuacct: $mount_point"
 	if [ "$mount_point" = "" ]; then
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
