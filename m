Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB724D0CF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 10:50:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 609233C2F7A
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 10:50:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8251B3C2F70
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 10:50:23 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DC32F1A00A38
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 10:50:22 +0200 (CEST)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k92kf-0007qy-Mb
 for ltp@lists.linux.it; Fri, 21 Aug 2020 08:50:21 +0000
Received: by mail-pf1-f197.google.com with SMTP id b16so999131pft.18
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 01:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JL0zG5gnljqf/nGbK5FOS+MM6VkJIhPViNUo/SeMKc0=;
 b=pgWncKE+W0STU8Tm4keXsVE2Tuuh1yjWs4vlvxyuMP6CdrnWH0+WkbkGGpiIN4CPR3
 Eh3F3Axog+42vFj5F5FzM7XCR3i293Fc0ff4uHnhV0oN5Sza+zvI5AXgp/cH3fjKUIv5
 auUCnixoY0HIxLISOKy9TGABj3yobUNbqwCowAFEy1bEpj5CvxxVBomlMOkVlW4FwqtZ
 p57xSO2dBXIM30WAG9V8YzGPl7wYfGQ4U555Nx3GbjUbN6dGU0+Q+6B06dKqvTlTPgee
 SqfIE7dDXbTiPhJ+jE6JiRa7DpAsHSRLHGr+ZNswQuSdL2w/NYaWFHt0NJFFXK1ebYd+
 aH8w==
X-Gm-Message-State: AOAM531BI0d+Rxk6WUMqaTB0iXYPV6wbbH1OePjD4+Z5KNJvT6kbu/xn
 XfXsiEtwofqZOxiOf/d0l1vt7s2jViLcsipV0MhB9tqpL1T0mhHsJ5w7AJYktZWJxAh6SW5PPf+
 NvqfqwP5o/YmVBIr3A73P6YlMHYY=
X-Received: by 2002:a65:4d0f:: with SMTP id i15mr1545393pgt.71.1597999820151; 
 Fri, 21 Aug 2020 01:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh8ZmXwn+tfQevss0THHCYaEabt3C5vPlwUnUXchfLi9cLGmvTSboJC8RRcXo9eZNv9j/xMw==
X-Received: by 2002:a65:4d0f:: with SMTP id i15mr1545377pgt.71.1597999819763; 
 Fri, 21 Aug 2020 01:50:19 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id mp1sm1335028pjb.27.2020.08.21.01.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 01:50:19 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: po-hsu.lin@canonical.com,
	miaox@cn.fujitsu.com,
	chrubis@suse.cz
Date: Fri, 21 Aug 2020 16:50:12 +0800
Message-Id: <20200821085012.16808-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

BugLink: https://bugs.launchpad.net/bugs/1836188

Issue spotted on a Power9 system with Ubuntu Eoan installed, the
N_NODES obtained from the file contains only "0,8":

    $ cat /sys/devices/system/node/has_normal_memory
    0,8

This will cause the N_NODES calculation in cpuset_funcs.sh failed with:

    cpuset_funcs.sh: arithmetic expression: expecting EOF: "0,8 + 1"

As it's expecting the number of a range (dash seperated), but not comma
seperated nodes. And this is causing failures to any test that's calling
this cpuset_funcs.sh:
    * cpuset_base_ops
    * cpuset_exclusive
    * cpuset_hierarchy
    * cpuset_hotplug cpuset_inherit
    * cpuset_load_balance
    * cpuset_memory cpuset_memory_pressure
    * cpuset_memory_spread
    * cpuset_sched_domains
    * cpuset_syscall

Improve the node number calculation by replacing the comma with space,
iterate through them to count the number of nodes. If we ever encounter
a range format like "3-6", use shell substitution to get these two
numbers and with their difference plus 1 to get the number of nodes in
this range.

Let's assume some extreme examples, if N_NODES is:
    0,2,4-6,8
In this case the imporoved algorithm will give you 6.
And if N_NODES is:
   0,2,4-6,8,11-15
This will get you 11.

Patch tested with different arches and Ubuntu kernels, and it works as
expected.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 .../kernel/controllers/cpuset/cpuset_funcs.sh     | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index 935a41ed0..2665afd31 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -28,12 +28,19 @@
 
 NR_CPUS=`tst_ncpus`
 if [ -f "/sys/devices/system/node/has_high_memory" ]; then
-	N_NODES="`cat /sys/devices/system/node/has_high_memory`"
+	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
 else
-	N_NODES="`cat /sys/devices/system/node/has_normal_memory`"
+	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
 fi
-N_NODES=${N_NODES#*-*}
-N_NODES=$(($N_NODES + 1))
+count=0
+for item in $N_NODES; do
+	delta=1
+	if [ "${item#*-*}" != "$item" ]; then
+		delta=$((${item#*-*} - ${item%*-*} + 1))
+	fi
+	count=$((count + $delta))
+done
+N_NODES=$count
 
 CPUSET="/dev/cpuset"
 CPUSET_TMP="/tmp/cpuset_tmp"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
