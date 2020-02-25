Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA8D16B9DA
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B154A3C2616
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2D94E3C261F
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:03 +0100 (CET)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7E3E8601AEE
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:02 +0100 (CET)
Received: by mail-pf1-x441.google.com with SMTP id n7so6665421pfn.0
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R3wM1iQZfIRRjyEkVJNk0nOm9gFFwzGrXM9z6mvpLxo=;
 b=H24XjHE8Hsl83RExI/H7BcyCAQHVQ2qUgZ3ZTj1PdNVDmxBNCec0+Rpy9Ar+P6YG3B
 1xP48qHW7NlqBV/yBlhB+wlTan8qywH5AbdlnezQoYaYC2gGXYsV2QacRYzD495K5whf
 ZJ6dCleh18FvbvGSyqhxSeCH87M//VQPLYl/ZMlwIrMaomc8NZJkLO50PSY2jpcnFBAC
 VYrJdLqacIHI003SK+qmCMTbme+m/Au1c0S8kNZWZVRJtjHhK/RykCaxyZZousl+Jkq/
 EhMG+tPeg3ve6TPmYTp2CNQeMVJ7UzUFwQo4YLHiVsaEm+Vc2S0q7zTHEbDHKYX0Op6Z
 fAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R3wM1iQZfIRRjyEkVJNk0nOm9gFFwzGrXM9z6mvpLxo=;
 b=uB1NhvCU4oiWmtuLAF4v2ZJNn/1hwEOGhqDS+lqICICYONNKQ920YNPtzx1pAZ/12P
 6POLrMElQ5u7jmsmkCpOknwHRQBPul+5rcuaF0sMJuqjtoGhQ+hS/ouwDcdJkbeMBPGl
 RY5V63pXscfwsWe3LqFFDTThIQiRabvtN/8Jp5r67HUye0DLoN4PwS2jyYVZ1iMpDlbI
 YsQ9spsWG63w6Y7uMIsvifKqqaZMGh6d7l2BB+AKk8mGanABH/1Yj79RjpOfmWhkJ+ef
 klqfxkDY0CnUp5tnE2irqrwtCQf4TgSuXekfQWvRsViSdk5AcsFqkaNZKYYPZgDukuRF
 F1FQ==
X-Gm-Message-State: APjAAAXFuYgOURR/10zAe108rk0g5HNzH+tuCijU7oMt63c6HoPJcBq0
 CBKOpB17UJLJwO3b7aTwfQth7gNZlAE=
X-Google-Smtp-Source: APXvYqyGUbn2i0nxs/syT1swdzmemvCV9HxGDkpYtKIWgxAHrklGE0mg7JC15nGa6dZwmve13eYx3g==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr54817105pfm.60.1582612860668; 
 Mon, 24 Feb 2020 22:41:00 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id z4sm14805131pfn.42.2020.02.24.22.40.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:41:00 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:41 +0530
Message-Id: <655d948e27dbbc03f6cef038e339ec0269d11140.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V3 03/10] lapi/fsmount.h: Include "lapi/fcntl.h"
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

All the files that include (and that will include it in future) are most
probably going to need the definitions from "lapi/fcntl.h", include it
directly instead of <fcntl.h>, which will break it for old RHL distros.

Acked-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h                        | 2 +-
 testcases/kernel/syscalls/fsmount/fsmount01.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index a6a24904e66d..5e5eaca7e6ff 100644
--- a/include/lapi/fsmount.h
+++ b/include/lapi/fsmount.h
@@ -7,12 +7,12 @@
 #ifndef FSMOUNT_H__
 #define FSMOUNT_H__
 
-#include <fcntl.h>
 #include <sys/mount.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
 
 #include "config.h"
+#include "lapi/fcntl.h"
 #include "lapi/syscalls.h"
 
 #ifndef HAVE_FSOPEN
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 8e29a1537334..514d3b0b38f8 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -10,7 +10,6 @@
 #include <sys/mount.h>
 
 #include "tst_test.h"
-#include "lapi/fcntl.h"
 #include "lapi/fsmount.h"
 
 #define MNTPOINT "newmount_point"
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
