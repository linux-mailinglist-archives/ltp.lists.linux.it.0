Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9643F96C2
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:20:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A20263C642F
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:20:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E0B7B3C2DB3
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:20:20 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D01EE1A011CA
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:20:18 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BDD5A3F329
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630056014;
 bh=fGiO0VJ45zRZnIMiijbMH8G4HjCcblU2fjo3Wtksec0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=MVQXHOeo6/PT+GKfv1j1c7nw9B1cmrNQvMxcaKmp8+zu9pB+r7ZDznsuTYpdiTSNm
 OKy2YjBAGBxr0+NjQ2wei++o5WBM+66oeuwYxbu4qW2iWxS2GE/MvtDWsess8mGODo
 wU1IgH/+ItuPfaohmmEvuOHm2+syBpKY7/r1OPfNgQDvo2D1aC2VbVNTFTLZCcDF9X
 fXiqgHd+dh3sT7TG79dHPXmQ61tf52L4cRJ2OJMNBHFMbpinpFxUXbQF08WKVsTJG/
 zb/fNqUg0Q0F4YBddDIBnec+v72JrYmAU9wCh5RJz1EmEzA5UEmx8by0LNf2H6k69a
 DETMBPu8myECQ==
Received: by mail-wm1-f72.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so1866968wml.1
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 02:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fGiO0VJ45zRZnIMiijbMH8G4HjCcblU2fjo3Wtksec0=;
 b=cWRTnrlimd2C7uT0Jfogjuecm0GwPxypM3LlXZHm1UQ90jbd9hvYgCx97Bbv1jjqoc
 1XtReRxcOvJIVvH/vP3PsW+rPL0j30ksAKyl4XEqVN+o84XNKwbwZjG4gttlddQmsLX+
 fO8qExPfjfU2pxAYRifpkx+Y0e7yaNl218JJwVWIT6eJJVV1jM4SzVFJmgU5CFq3Ywht
 Meiao7O/7+TNQT0snH6bxMFLSh90UvQu1IPLZDZal63Tpepi2SQzkWrMYkFKRpXBmZj3
 /Wqmp6L7w3P64t7apmh+njjpFSmOwnWb6NmwfBiEj7zA0VfdtBiRKNuaLVgZIzb6YXZL
 709Q==
X-Gm-Message-State: AOAM531FM+mZlLspvQMowP5NV6W/+R1O+QVoB8hi1eWbLz377wjU/9wA
 U3XLNWj64JYpkbOIqR2k3dbgPxhcnkFXPIdCDU+rB+rKEVjJdqulcNUoV9pySQ8EicAEzLBUBas
 DXcFpPqX7xLKmtJ0ROf0/YuxlEXAs
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr9009058wrs.158.1630056013798; 
 Fri, 27 Aug 2021 02:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzOC53/h81FbL14ZHQwq+lUUTeF4EBPeAL5Vb1XtjCrscQOwkbxzKN95ICjN2ehli1VTpjEA==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr9009035wrs.158.1630056013594; 
 Fri, 27 Aug 2021 02:20:13 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.249])
 by smtp.gmail.com with ESMTPSA id c9sm2811525wrf.77.2021.08.27.02.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:20:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 11:20:06 +0200
Message-Id: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] controllers/cpuacct: skip cpuacct_100_100 on
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

Changes since v2:
1. Correct realuid->real_uid typo.
2. Correct handling dash shell tests for return value.
3. Correct handling numbers - infinite.

Changes since v1:
1. Add checking for pids.
2. Accurately check the memory constraints.
---
 .../kernel/controllers/cpuacct/cpuacct.sh     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 323aa7513bf4..cde2ea948cee 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -38,12 +38,72 @@ OPTIONS
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
+	local real_uid="$SUDO_UID"
+	local tasksneeded=$((max * nbprocess + 100))
+
+	if [ "$real_uid" = "" ]; then
+		real_uid=`id -u`
+		test $? -eq 0 || return 0
+	fi
+
+	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
+	test $? -eq 0 || return 0
+
+	# Check for number for cases like TasksMax=infinity
+	[ -n "$tasksmax" ] && [ "$tasksmax" -eq "$tasksmax" ] 2>/dev/null
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
