Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B453B1DA2
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:30:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A69D3C6FE4
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 17:30:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9287C3C2298
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:30:10 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EABFB1A0144D
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 17:30:09 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw4pN-0003qy-AC
 for ltp@lists.linux.it; Wed, 23 Jun 2021 15:30:09 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 g8-20020a5d54080000b0290124a2d22ff8so620308wrv.4
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 08:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X2f5pAcSfdEO3/rpl6MDlHj/eOvTzp/nCuWSib3RrYA=;
 b=Tk2Exc9YrQ8ozD0fYS+l+ToHfXbGgIoG+1DDwDplaggJidr5jPM7t5MOj1+krOJUh7
 TkiL70revaVZVgBRDmakfiuMR1ez2cAQoMi7eLYvjlSHnyqg/MP8mbVFExAiTxuitm73
 j6kRUGsePeNcbIlXby3oKett/04jsVBkt1XEN8MRryu2t+V50mn7Is5Op0KmVxjhQ+Qb
 PXetZ6wO5fGbof4AwSM8jASMasemD3HW9VfWOq13S3DwnW3wDJCsqm03UNApMz4JfU2Q
 uitZq/tBdzCbmDmUhwtXEvlCYGu/7VO4VvA0pP762lwqLpfqd8s0YfI1JSfquM5NUp4s
 Trew==
X-Gm-Message-State: AOAM531X54XH3ug+GLFN5jiXQAJ98K/SYiCpVYFYI+X/g5/gmyr1D7mr
 DSlNvExYh/Pwk4mkSSzbjW+1UmZedzgligWjypP5XnAe8PYIG1Mo/quktYvohnS8qHcMW6qc7Y5
 pKEHaEeEzy6XoYXWDJXOfYmRFIeNH
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr670384wrs.43.1624462208838;
 Wed, 23 Jun 2021 08:30:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqKNyFQ4lgqmbNU9WLLfHJgDYLf0ypkwSDFB/OV1EnLFcdFvvCNZzbrVEmwkvHghSGMaDDUA==
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr670372wrs.43.1624462208724;
 Wed, 23 Jun 2021 08:30:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id i16sm285927wmm.9.2021.06.23.08.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:30:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 17:30:03 +0200
Message-Id: <20210623153003.94404-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623153003.94404-1-krzysztof.kozlowski@canonical.com>
References: <20210623153003.94404-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] controllers/cpuset: skip unsupported Microsoft
 Hyper-V
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

Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
if enabled in kernel configuration.  Quoting Ubuntu bug report from
June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
CPU add/remove is not supported.". [1]

The cpuset_hotplug, cpuset_memory_spread, cpuset_sched_domains,
cpuset_memory_pressure abd cpuset_load_balance fail on Azure clouds with:

    cpuset_hotplug 1 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 1 TFAIL:  CPU#1 failed.
    cpuset_hotplug 3 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 3 TFAIL: setup test environment(offline CPU#1) failed
    cpuset_hotplug 5 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 5 TFAIL:  CPU#1 failed.
    cpuset_hotplug 7 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 7 TFAIL:  CPU#1 failed.
    cpuset_hotplug 9 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 9 TFAIL:  CPU#1 failed.
    cpuset_hotplug 11 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 11 TFAIL: setup test environment(offline CPU#1) failed

Detect the Hyper-V with systemd and if it succeeds, skip the test.

[1] https://bugs.launchpad.net/ubuntu/+source/linux-azure/+bug/1776293

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. tst_virt_hyperv moved to patch #1.
---
 testcases/kernel/controllers/cpuset/cpuset_funcs.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index f3ba1d5ca931..9939f13a3218 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -134,6 +134,13 @@ cpuset_check()
 	tst_brkm TCONF "Cpuset is not supported"
 }
 
+machine_check()
+{
+	if tst_virt_hyperv; then
+		tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+	fi
+}
+
 # optional parameters (pass both or none of them):
 # $1 - required number of cpus (default 2)
 # $2 - required number of memory nodes (default 2)
@@ -149,6 +156,7 @@ check()
 
 	nnodes_check ${2:-2}
 
+	machine_check
 }
 
 # Create /dev/cpuset & mount the cgroup file system with cpuset
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
