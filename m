Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF23F29BA
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D4853C2AB9
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29D923C2AB9
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:11 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B48501A008AC
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:10 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2042F3F116
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629453670;
 bh=Xm4I0CI1objtXZE1RTLebAXjSoqtNCbnvv2yEff4cO4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=K1wyejJU0Llk0kMAm3iXwAZL1h63fQ0rzztbiB0xGtwc4GhQFVydLqBJ0ZgDe9/I8
 y3g9CHS0b0Vdo0aNout0SVnaGlCraKLuBPUhAkBVu6UDz3F5yi7OcuB7oVMTa8Utd/
 uEqvZiMH3YnaShwX8Y9EmjiKmgR/g7TcZw5oM5AP1VPlMpXsxb4BvGBJ3GihIsMwdI
 bbDvHnsD7hRw1WjbGRlZqk2ZqYcxSGpiCb1RlJbd3PisX3rV9UMeCXKtGggN0KnP1J
 6qWEa5lcXIiKXDmqt1mjiu9wd3kAr4DUZXdRhtCpZ+ZluUFmQmsPKR71ZaXuV9bupH
 aF7tbsLiBpetw==
Received: by mail-ed1-f69.google.com with SMTP id
 b25-20020a05640202d9b02903be7281a80cso4293588edx.3
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 03:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xm4I0CI1objtXZE1RTLebAXjSoqtNCbnvv2yEff4cO4=;
 b=kBXayiUmYAtVZeZsmXg2YUt9+Oi6T67Hzkcf/CcKk4uqa1WfO7ObyiabbrQLDqsO7+
 Zi3dBIqdAYeZshOtkyepMvCC/q2MUtrx1KSP55NwrSdAehjWeIlf9qclxnakBVQXMtxH
 SkFMMrV+duOxZOO73Bn1FFt9J+Q06POIeK3PIlw9Ob6wjBEj3hEXETP15KToZB3Dj3Xe
 qJ+tjDrLnpgtnd9uYIx9Dj9oYqaxdH8ADa6IpM9+9qaNyzRnGUEb2HSNusu3uS5jfXbs
 kLbVJfi2+HqWMgTsTwjWZLUKehUSXpdafhUGzhRuHI1qMl6zsY/cC2oq8mV4vRi7Rsx8
 lz2g==
X-Gm-Message-State: AOAM530GLKy2KdMejWYWX8IcLkPrNUDxVEnGfJHCqdIhH5NRXLilAU5f
 zYMVljF6+BO7u3Yj7ZLhuDjebwhCYc+tYrbNXO5n/0cNGNzXahaiHiyxVsxYInguTcghazsody5
 UCsoICk8ERfTJVSPOI9CxsoHqN2Oz
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr21452310edt.225.1629453669658; 
 Fri, 20 Aug 2021 03:01:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Gt/HMjWYwX6LClDOJgYxHIrrBIES5Wj+W1BpRrPXR3x7eBp+dLojet7R5SCx08qnTvfDCA==
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr21452298edt.225.1629453669549; 
 Fri, 20 Aug 2021 03:01:09 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm3280162edv.78.2021.08.20.03.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:01:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 20 Aug 2021 12:00:28 +0200
Message-Id: <20210820100028.97487-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
References: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/3] syscalls/msgstress: tune limit of processes
 for small machines
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

Forking the exactly amount of processes as the limit (either from
max_pids or from cgroups) is risky - OS might be doing some work and
interfere with the test.  Instead leave some reserve (hard-coded
to 50) for the OS so the test won't fail on fork failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 lib/tst_pid.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index 23753988ca57..435a0c63af34 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -32,6 +32,8 @@
 #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
 #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
 #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
+/* Leave some available processes for the OS */
+#define PIDS_RESERVE 50
 
 pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
 {
@@ -97,7 +99,7 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
 	if (max_pids < 0)
 		return -1;
 
-	return max_pids;
+	return max_pids > PIDS_RESERVE ? max_pids - PIDS_RESERVE : 0;
 }
 
 int tst_get_free_pids_(void (*cleanup_fn) (void))
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
