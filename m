Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 358423FDE08
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:51:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 679BE3C774B
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:51:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEF313C2A05
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:51:38 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 55243600A3D
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:51:38 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 39BB24017E
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630507897;
 bh=eSTl1xeiQKlAi6qoW93HFAiX3esSCMwAKgy39x8OG2Y=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=gvDyUyHfieaR5j79xVpzvZ+jI9feMRQouw6VwuJyvtI8OlA5/ehzZUwnlvFRCu1vr
 NHVYFXi1bRcrhHJDvIs/jNJM0TVpKtWXkIJBli0cKYns0KdhbJMSd4q7DsMeoqq0y7
 4lSIlkPS/pVyYx2kQCgax/eXx2vL3FPwJ+4E3w/zM3Xj/4fx2+3TJ0KncQVilLAJc7
 0rGbOcxIPjePqQkUFOb74DN/yke2SsL8sf/2i6oNspfdKvgOJjz16s8UZQq5HFMJ4G
 RnERq0Jme8DSRRHfCfM/KL9LAyVFkBurcOaagJKJ5vIUERItw60N8mZjFr4iGrureI
 aeZmvC85guOIA==
Received: by mail-ed1-f70.google.com with SMTP id
 y21-20020a056402359500b003cd0257fc7fso1416298edc.10
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 07:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSTl1xeiQKlAi6qoW93HFAiX3esSCMwAKgy39x8OG2Y=;
 b=uA9CfnoX5dQBvjErn3bJwNc6NlLjEw3J5WO6Lp6rstP0Flj6Zt6kwHtWX1DNAI/c9Y
 u5B3JyO7Zjk/gga5DvYCiSWDF06u+Wuy77k5ocH+lInjowfWDwfrQhcTiyCI84vMtV0T
 Vq2XtzEDMDT/oZmi2EcsyyCzqR7cD208WpNOUEgpN5wpEwan8i8n4vV3aDCk0m3K/V5X
 naGyKVZLgb8zwjVx7kt8S1mJkfvPJRVK7RsOnFAWGKg37OjGt/wulnyWce3CHLJ/IT+m
 htyF5s5SiSJJLSAPvnIIvsdGSLexLj3Ch89eLG6/2TNsie2SEZ3RIKhZVhG1a05V1jka
 WXKg==
X-Gm-Message-State: AOAM5319F2nfwi7jZxxUdDNvUeUCWTt2kHJZ1ghwvSFj96d/1cJuxKBs
 JcvhEp/sL+Nix0imo39/KfpABLeIBYCc/UL8VZABZRDv8RvCRNXLzNXIibLJ58ehiwLrfikrwM5
 mX2TF7lJj0KyfGjBH8meIJDcmDAg+
X-Received: by 2002:a05:6402:4404:: with SMTP id y4mr31725eda.52.1630507896499; 
 Wed, 01 Sep 2021 07:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN2XzqVQon4WXdv9btr4QAx/MgIBEzZb+wS1f9zGZbnU4zFUcvcV+Qwv7LvIRBn5+ZPKc5DQ==
X-Received: by 2002:a05:6402:4404:: with SMTP id y4mr31708eda.52.1630507896308; 
 Wed, 01 Sep 2021 07:51:36 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.112.53])
 by smtp.gmail.com with ESMTPSA id v12sm57651ede.16.2021.09.01.07.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:51:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  1 Sep 2021 16:51:26 +0200
Message-Id: <20210901145127.92315-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
References: <20210901145127.92315-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/3] controllers/cpuacct: skip cpuacct_100_100 on
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

Changes since v3:
1. Use tst_get_free_pids helper.

Changes since v2:
1. Correct realuid->real_uid typo.
2. Correct handling dash shell tests for return value.
3. Correct handling numbers - infinite.

Changes since v1:
1. Add checking for pids.
2. Accurately check the memory constraints.
---
 .../kernel/controllers/cpuacct/cpuacct.sh     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 323aa7513bf4..39f880a53996 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -38,12 +38,61 @@ OPTIONS
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
+		test $? -eq 0 || return 0
+
+		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
+		test $? -eq 0 || return 0
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
+	local tasksneeded=$((max * nbprocess + 100))
+	local tasksmax=$(tst_get_free_pids)
+	test $? -eq 0 || return 0
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
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
