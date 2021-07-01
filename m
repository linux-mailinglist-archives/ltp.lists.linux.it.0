Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB13B9193
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 14:24:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82DE53C9AB1
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 14:24:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 874A03C6B12
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 14:23:57 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9EBE914011AB
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 14:23:56 +0200 (CEST)
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyvjX-0001q5-Fd
 for ltp@lists.linux.it; Thu, 01 Jul 2021 12:23:55 +0000
Received: by mail-ej1-f70.google.com with SMTP id
 ho42-20020a1709070eaab02904a77ea3380eso2030813ejc.4
 for <ltp@lists.linux.it>; Thu, 01 Jul 2021 05:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsLthQ6HKZx2oIUqVVJsrUnOr1S/A0UxOL0QcRSfhGA=;
 b=cCMMIi2jd05WXRqdR+w0BheA/WNVRtslrJ0JKNwBFz0EBHA7BAFoc8HzqM3xPEX2d8
 ly8DiGhl4CkFG76fR6EDDAE1Zj3Qcgybk4CpbAHeMsGwUtrjAUCkLK7vMdyKo3CyR+MF
 CVXe6OusSY/Lxph6kpJlRPVdj9m2w6EM8z0rxSWoMcJkdGh2RoHx80JZctI9hz07tWv0
 9oTP4Z4MUSltSwmv2Z4y6JLaqd4qedvpdnp1XS9DZUaql1xse9eUQkTPVvhykUOX5FTm
 DsWWRNQQca2DOD0YPfM0UJmTpkaxcvpCoTNCIafw0wjkRUWas0u3Le/7FvF+c7fQLtCO
 n7uw==
X-Gm-Message-State: AOAM533G30uMix/bel3odG11y/vHwDuPbfgSwzgOQulqryYK5vKkthsw
 Pj5rXdyD/guzIbDQAvH9UVW81u969KJUAV0mC3kFxBpbQjwMRTLFZ5+zPG9aJ6Km8uJXSfhtgl1
 0g1YbrfNiArePPzWbbxTGYTh4NzNI
X-Received: by 2002:a17:906:3a8e:: with SMTP id
 y14mr41004636ejd.153.1625142234322; 
 Thu, 01 Jul 2021 05:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1WX+XpfEZWDQP90BN2nh2di/x1vnGp4HWgc2573UPjO08ERArvqvhbE8yjyYcyFEQlTr9HQ==
X-Received: by 2002:a17:906:3a8e:: with SMTP id
 y14mr41004630ejd.153.1625142234160; 
 Thu, 01 Jul 2021 05:23:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id l26sm14423440edt.40.2021.07.01.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 05:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 14:23:50 +0200
Message-Id: <20210701122351.56397-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] proc01: fix selinux attributes without
 libselinux-dev
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

SELinux can be enabled on the system which does not have development
selinux libraries.  Such case was already done for Smack and Apparmor
where we unconditionally accept their attribute failures.  Do the same
for SELinux to fix failures like:

    proc01      1  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/current: errno=EINVAL(22): Invalid argument
    proc01      2  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/prev: errno=EINVAL(22): Invalid argument
    proc01      3  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/exec: errno=EINVAL(22): Invalid argument
    proc01      4  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/fscreate: errno=EINVAL(22): Invalid argument
    proc01      5  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/keycreate: errno=EINVAL(22): Invalid argument
    proc01      6  TFAIL  :  proc01.c:404: read failed: /proc/self/task/29986/attr/selinux/sockcreate: errno=EINVAL(22): Invalid argument
    ...
    proc01      7  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/current: errno=EINVAL(22): Invalid argument
    proc01      8  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/prev: errno=EINVAL(22): Invalid argument
    proc01      9  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/exec: errno=EINVAL(22): Invalid argument
    proc01     10  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/fscreate: errno=EINVAL(22): Invalid argument
    proc01     11  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/keycreate: errno=EINVAL(22): Invalid argument
    proc01     12  TFAIL  :  proc01.c:404: read failed: /proc/self/attr/selinux/sockcreate: errno=EINVAL(22): Invalid argument

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/fs/proc/proc01.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c
index 0fae6754f7f7..282c70e94882 100644
--- a/testcases/kernel/fs/proc/proc01.c
+++ b/testcases/kernel/fs/proc/proc01.c
@@ -97,10 +97,12 @@ static const struct mapping known_issues[] = {
 	{"read", "/proc/self/mem", EIO},
 	{"read", "/proc/self/task/[0-9]*/mem", EIO},
 	{"read", "/proc/self/attr/*", EINVAL},
+	{"read", "/proc/self/attr/selinux/*", EINVAL},
 	{"read", "/proc/self/attr/smack/*", EINVAL},
 	{"read", "/proc/self/attr/apparmor/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/smack/*", EINVAL},
+	{"read", "/proc/self/task/[0-9]*/attr/selinux/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/apparmor/*", EINVAL},
 	{"read", "/proc/self/ns/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/ns/*", EINVAL},
@@ -133,6 +135,7 @@ static const struct mapping known_issues[] = {
 #ifdef HAVE_LIBSELINUX_DEVEL
 static const char lsm_should_work[][PATH_MAX] = {
 	"/proc/self/attr/*",
+	"/proc/self/attr/selinux/*",
 	"/proc/self/task/[0-9]*/attr/*",
 	""
 };
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
