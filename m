Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCA22E9DF
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 12:19:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58C7C3C26BD
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 12:19:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D38463C2467
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 12:19:22 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 46DCA200B70
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 12:19:22 +0200 (CEST)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k00E5-0004YJ-13
 for ltp@lists.linux.it; Mon, 27 Jul 2020 10:19:21 +0000
Received: by mail-pg1-f200.google.com with SMTP id s1so12304644pge.16
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JL0zG5gnljqf/nGbK5FOS+MM6VkJIhPViNUo/SeMKc0=;
 b=hWg8vykA0ueqqh9jwEoY99QJlSE5w7kcOcV89mQoLBKLJA+fooU7wISlqABQzreCgj
 q2UneciRazfvMJ5w2nGjn+lPOTcscbQsadL4LOSqBIIPANCvEwFOfBa476g1GqpzfwIv
 546TXm840nhKVDrbQFb4doNtrcWkzaFjRgijRRqSi8TmA11lm5YAXqWQItQRFP5yXJGe
 HO6NqQPHyyoDJHggr3jjBsbhbykghpq6InKyi9svf2PWVFhA+UiU3mfS18TUW5JaPaYj
 IzqtxHsnDzXMHe7aFvCA1Sz4eGBp9zuaK3XfIKz7/9YNvjUyvk4jLi4z3FqlMR77WoQC
 RmiA==
X-Gm-Message-State: AOAM532wsvVVMOZFl1sKFPxFufLFWocKaZxgLHE8w9dbaDL/vuAMxiI3
 m0lfesmAEKGXezzIjX4HjdXr6PBBg4Lmi8sFOjnc0QWONuvINkxedffE94NR4OqghUJkEhaZo89
 W/JHulcBM3r87D1ECHpYHzPfG2+I=
X-Received: by 2002:a17:90a:ea0f:: with SMTP id
 w15mr18901840pjy.138.1595845159422; 
 Mon, 27 Jul 2020 03:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtImOP8IjNWUhcQs8xOMESUmxEulTYLVUjaIau1sFbO03x2ak6OD3tTgXcfDBkXaDtqV4rxg==
X-Received: by 2002:a17:90a:ea0f:: with SMTP id
 w15mr18901808pjy.138.1595845159103; 
 Mon, 27 Jul 2020 03:19:19 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id k29sm6604204pfp.142.2020.07.27.03.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:19:18 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Mon, 27 Jul 2020 18:19:04 +0800
Message-Id: <20200727101904.27424-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Cc: po-hsu.lin@canonical.com
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
