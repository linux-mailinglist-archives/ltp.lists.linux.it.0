Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE05645D
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 10:17:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7A7F3C104A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 10:17:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EC1873C0131
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 10:17:46 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 45A461A011C3
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 10:17:45 +0200 (CEST)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hg37g-0003wj-Rr
 for ltp@lists.linux.it; Wed, 26 Jun 2019 08:17:45 +0000
Received: by mail-pf1-f197.google.com with SMTP id c17so1242382pfb.21
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 01:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=q3XyEg+KYWbwlzStIWmO+yMbAT3qRF0OSW4AxI72XCY=;
 b=P9tfJnIQrt5a+m75Z3ANMX5WgsqbBWFcK2tPLewYgZGOhQNAMCW2MxDIR4peISju6U
 aMlciFBHM6H925C2uioQTU1NsJDw8qqTMWhZvO4sxC+xkkk0prKz4jWROKPZKYCboRZq
 ysjDIHev6fHGeUrUf8AXad5fS/sTHup/O/a8VdUMp62+HcTyhejIWwWktjO/+PgLqdrZ
 4mu92TC13/Xg31FdldplSpP+C2CUlsY+OcaWJrdWp8coC4+a2sP6juGjbCH96D2UoRAB
 fdPgP8Aa+HbXM8OL4rs7iVVo9KGib4B6Q1q6zk7eXe4SehHmDaDaKqr1NxL1YpEh8z6O
 hPFw==
X-Gm-Message-State: APjAAAWtW9dyLYbal1IluCXyMOyqfean82kfHoqGE7RJ0ATb1q6ago9v
 aQtZY8/HRx7jfRpapE0Gf8b6EeKvonHQ4ZcOcvOQwT5IVDEYiqLDG2oTIVP40op38d39wqDkav0
 kP/ZoZHLTYku3sKKdbwMkgWpQ9M8=
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr3237297pjt.107.1561537063324; 
 Wed, 26 Jun 2019 01:17:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh0XkCGYpAoMtgiX7clcl2noLuU8wZHnKqcXRwYpmISQiLMN5OdZtEVVuckMRUWmZy8HI8sQ==
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr3237235pjt.107.1561537062701; 
 Wed, 26 Jun 2019 01:17:42 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id 30sm1319838pjk.17.2019.06.26.01.17.41
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:17:42 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 26 Jun 2019 16:17:35 +0800
Message-Id: <20190626081735.31327-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] runpwtests03: fix for module name retrieval
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

The -l flag for modprobe has been deprecated in newer packages.
This will induce some noise during the execution:
    modprobe: invalid option -- 'l'

And making the "Loading and Unloading of governor kernel modules" test
not doing module load / unload operations.

Fix this by using the find command to retrieve module names instead.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/power_management/runpwtests03.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
index 11197937f..81d44f9b1 100755
--- a/testcases/kernel/power_management/runpwtests03.sh
+++ b/testcases/kernel/power_management/runpwtests03.sh
@@ -118,8 +118,8 @@ pwkm_load_unload() {
 	RC=0
 	loaded_governor=`cat \
 		/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
-	for module in `modprobe -l | grep cpufreq_ | \
-		cut -f8 -d"/" | cut -f1 -d"."`
+	for module in `find /lib/modules/$(uname -r) -name "*cpufreq_*.ko" \
+		-printf "%f\n" | cut -f1 -d"."`
 	do
 		#echo -n "Loading $module ... "
 		if [ $module != "cpufreq_$loaded_governor" ]; then
@@ -131,8 +131,8 @@ pwkm_load_unload() {
 			fi
 		fi
 	done
-	for module in `modprobe -l | grep cpufreq_ | \
-		cut -f8 -d"/" | cut -f1 -d"."`
+	for module in `find /lib/modules/$(uname -r) -name "*cpufreq_*.ko" \
+		-printf "%f\n" | cut -f1 -d"."`
 		do
 		#echo -n "Unloading $module ... "
 		if [ $module != "cpufreq_$loaded_governor" ]; then
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
