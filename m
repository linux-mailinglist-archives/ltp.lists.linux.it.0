Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B533166C04
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 14:05:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C5E03C1D00
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 14:05:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 978E63C1C96
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 14:05:15 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5D0F8600681
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 14:05:16 +0200 (CEST)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hluIb-0000Gg-CS
 for ltp@lists.linux.it; Fri, 12 Jul 2019 12:05:13 +0000
Received: by mail-pg1-f199.google.com with SMTP id 8so260152pgl.3
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 05:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=L2G8gXBG20EIkquycJSt8b4sHukh3iA4ilKJL8VIchw=;
 b=C0+hWqqRAS0qqTEcKayP8HRvvKsXE+A/FHjquV6lhszIC39j6oqRXgbrnIDM23n1Cq
 YRTXtz2EucJepCHA4VFyXHNqwTYwm8tjDb2OU7yF2AfSTaWmKddmK8qEYZstM6sct+Ag
 vvwoawajuG/dn62n4AQCxTzdVFZLoIsf/09E1UBvAT92mkJQ+rF46aDemwN5+ZrTenOT
 OuNU27d+x0L05Mn3MKRBFdynywDyztq1lsV5N2/Be5bXxbKyxgtLIUCmzOqh6pYRSJix
 SpnNmvP7gDTg3eKUhcdaBGDuGhzONcZ2PZSQmsPKVjQCKp0q1NGFM6UG/RncPgiFtiGY
 VzXA==
X-Gm-Message-State: APjAAAUTp7x1VGu3UQrnP7GmExRwiEVO78DhRjSke1MqV6Xe6ObF9kac
 b6Rrj9MYO2bod1jz9hYZE03jQhk2TlqPIObsrh8DJ5CmcIn8VcQ/7iOwDOM/52OJ/nTxDB7FVNq
 BoB4yw9uT9i9hgoO2z3sLlf5vF+g=
X-Received: by 2002:a17:902:f089:: with SMTP id
 go9mr11060256plb.81.1562933111698; 
 Fri, 12 Jul 2019 05:05:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIgKtMZi98L3wSbKY+KkA07siob08SQY/uI6Kg3ivaoSElNpN0zZzPN7nBjLkPMgg3AtYSzg==
X-Received: by 2002:a17:902:f089:: with SMTP id
 go9mr11060225plb.81.1562933111452; 
 Fri, 12 Jul 2019 05:05:11 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id j5sm9785930pfi.104.2019.07.12.05.05.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 05:05:10 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	miaox@cn.fujitsu.com
Date: Fri, 12 Jul 2019 20:05:05 +0800
Message-Id: <20190712120505.28953-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/cpuset: improve the node number
 calculation for N_NODES
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

BugLink: https://bugs.launchpad.net/bugs/1836188

It was spotted on a Power9 system with Ubuntu Cosmic installed, the
N_NODES obtained from the file contains only "0,8":
    $ cat /sys/devices/system/node/has_normal_memory
    0,8

This will cause the N_NODES calculation in cpuset_funcs.sh to fail with:
    cpuset_funcs.sh: arithmetic expression: expecting EOF: "0,8 + 1"

As it was not designed for counting the number of comma seperated nodes.

Improve this by splitting the file output with newlines, iterate through
them to count the number of nodes. If we ever encounter a sequence
format like "3-6", use shell substitution to get these two numbers and
with their difference plus 1 to get the number of nodes in this range.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 .../kernel/controllers/cpuset/cpuset_funcs.sh   | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index 935a41ed0..6861b8dbd 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -28,12 +28,21 @@
 
 NR_CPUS=`tst_ncpus`
 if [ -f "/sys/devices/system/node/has_high_memory" ]; then
-	N_NODES="`cat /sys/devices/system/node/has_high_memory`"
+	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' '\n'`"
 else
-	N_NODES="`cat /sys/devices/system/node/has_normal_memory`"
+	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' '\n'`"
 fi
-N_NODES=${N_NODES#*-*}
-N_NODES=$(($N_NODES + 1))
+i=0
+while read item; do
+	count=1
+	if [ "${item#*-*}" != "$item" ]; then
+		count=$((${item#*-*} - ${item%*-*} + 1))
+	fi
+	i=$((i + $count))
+done <<EOL
+$N_NODES
+EOL
+N_NODES=$i
 
 CPUSET="/dev/cpuset"
 CPUSET_TMP="/tmp/cpuset_tmp"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
