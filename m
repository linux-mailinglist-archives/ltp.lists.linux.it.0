Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC83A6B6C
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 18:14:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1AD23C7222
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 18:14:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F5753C2E34
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 18:14:53 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 76D006008C0
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 18:14:53 +0200 (CEST)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lspEi-000354-I9
 for ltp@lists.linux.it; Mon, 14 Jun 2021 16:14:52 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso11986867edc.2
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 09:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O/DQ+m30wOVbFdVI/NLrGHDLkgC7pIkkfOxU38H515I=;
 b=AugqCuenkJ8/8T91Q8NmdlHdVUOV3R2XE0TqETCa5eGFEjSvgz7iue1KvKeIXdE6xr
 M1Jih9Yd63Z5C4ZPw0vEsxiOU9GbzntclKkutiL4/NyaUrkYjgdaGEamziZWZ+gLTDqk
 4PcTa+HJgXkN2B3UWyvupJvMYzk00sOLxJwe018lkmVSpOepgz+fQ+aCmQGg2GEu4qSB
 j9VCyQEtVwjil4cp9DrmOOXNgt9Zl3x1O6L01bCoT2pcOJ9p27pNZiOqydH/YzguvQ6Y
 cu1xP9tZyuh6J+AfLSPYpNookvXU11tnfQy7ghHhYj3HuwumYI4Gimdj03a+XJR+p6r4
 2tOA==
X-Gm-Message-State: AOAM530zFUgDuYBoVL8m5akisqTAuWU5PjeeC9oRDWTxgMNoAtIVKI3v
 vMqfVFxLtPjh/pryfNVws2NCKB9y9fyD8swllsldYGp/xltTbZTaIJv6PLp3HL65Q6H1s1jhCtY
 dIAEWtdJMhkQgYLf81BKuqyldGDpw
X-Received: by 2002:a05:6402:b6f:: with SMTP id
 cb15mr18618717edb.25.1623687291895; 
 Mon, 14 Jun 2021 09:14:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrX9eFifkI1ui/o3u8C4b1QA7SFYV9b48FOskMNvhKvLDDYR9tweicnIQGzejuefUNdrNQLQ==
X-Received: by 2002:a05:6402:b6f:: with SMTP id
 cb15mr18618700edb.25.1623687291757; 
 Mon, 14 Jun 2021 09:14:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id o21sm7445546ejh.57.2021.06.14.09.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:14:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Mon, 14 Jun 2021 18:14:12 +0200
Message-Id: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] controllers/cpuacct: skip cpuacct_100_100 on
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

The reason is cgroups pid limit set by systemd user.slice.  For example
on 2 GB RAM machine it is set as:
    /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

Add a check for both free memory and maximum number of pids (when using
systemd) to skip the test.  Systems not using systemd might still fail.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Add checking for pids.
2. Accurately check the memory constraints.
---
 .../kernel/controllers/cpuacct/cpuacct.sh     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 323aa7513bf4..66a48dde679b 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -38,12 +38,68 @@ OPTIONS
 EOF
 }
 
+check_free_memory()
+{
+	local memneeded
+	local memfree=`awk '/MemAvailable/ {print $2}' /proc/meminfo`
+
+	if [ $? -ne 0 ]; then
+		local memcached
+
+		memfree=`awk '/MemFree/ {print $2}' /proc/meminfo`
+		test $? || return 0
+
+		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
+		test $? || return 0
+
+		memfree=$((memfree + memcached))
+	fi
+
+	# On x86_64, each 100 of processes were using ~16 MB of memory,
+	# so try to estimate the needed free memory based on this.
+	memneeded=$((max * nbprocess * 16384 / 100))
+
+	if [ $memfree -lt $memneeded ]; then
+		tst_brk TCONF "not enough of free memory on this system (approximate need $memneeded kB, free $memfree kB)"
+	fi
+	tst_res TINFO "memory requirements fulfilled (approximate need $memneeded kB, free $memfree kB)"
+
+	return 0
+}
+
+check_limits()
+{
+	local realuid="$SUDO_UID"
+	local tasksneeded=$((max * nbprocess + 100))
+
+	if [ "$realuid" = "" ]; then
+		realuid=`id -u`
+		test $? || return 0
+	fi
+
+	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
+	test $? || return 0
+
+	if [ $tasksmax -le $tasksneeded ]; then
+		tst_brk TCONF "limit of tasks is too low (approximate need $tasksneeded, limit $tasksmax)"
+	fi
+	tst_res TINFO "task limit fulfilled (approximate need $tasksneeded, limit $tasksmax)"
+
+	return 0
+}
+
 setup()
 {
 	if ! grep -q -w cpuacct /proc/cgroups; then
 		tst_brk TCONF "cpuacct not supported on this system"
 	fi
 
+	check_limits
+	# Don't bother with memory limit checks on smaller tests
+	if [ $max -ge 100 ] && [ $nbprocess -ge 100 ]; then
+		check_free_memory
+	fi
+
 	mount_point=`grep -w cpuacct /proc/mounts | cut -f 2 | cut -d " " -f2`
 	tst_res TINFO "cpuacct: $mount_point"
 	if [ "$mount_point" = "" ]; then
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
