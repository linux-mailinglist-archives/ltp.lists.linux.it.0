Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id 51CAE16405E
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D41C3C0E94
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 941AA3C2674
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:24 +0100 (CET)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0AA13100156A
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:27:40 +0100 (CET)
Received: by mail-pj1-x1042.google.com with SMTP id dw13so2319374pjb.4
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7JdHcs/rJtMwFHG93wlvPUns98WiAWOm0Bdd5VO1cbQ=;
 b=MSFe98gUiimm8lL0EBjKu6FXCWyP0SU1LNmdgeZfWmp8VQYQvwc6DCezz9j2P4GYfv
 IhSfBkDYoXEOAIXq3+rqrLp+fjYi8jTgviOtTIbN+vY36Y0jMAvzs+Qkt/czLKmcXiMw
 reHMDWrXnQvU+JtFh7lwXEz4/srswg6q59GjjEfDg3zz3ZLOkTblE8wloQbxcYJF9+JG
 sQY3JgGlo1QksQ/9pR5c6wmKmV5fYq2rTM/H0Gk/ge8aJBZW6gGVxgio4dMyIECogIdc
 FhSQXXUCEh9vZaSKIgKCeOUFIM3ZVeOTGeHGNzo1lTVuqxpfA+RDKlA3mbdDOPgNIVKM
 oxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7JdHcs/rJtMwFHG93wlvPUns98WiAWOm0Bdd5VO1cbQ=;
 b=dhqVwyQQ/u0iA/lLfrWQEcMloxz1FsCPiIkQC7aIjhh0Exkyxl99E9qT8UYahKUVIo
 T3KHK67Y6W8HUnm12PPzIj+pM/sTghLIXYzWYmLUw028PIXZiTrn8JZ7oXKTnsp//lFE
 k94SVQfFa9xIyt1POdKeyD6lc2Lojud82LCdMLlhHN6JUs1gOqJ9dBjGtj1kUhaIybSf
 y4bvMhIRcpi0186Yner9ohttdsHt2lXpzsXxmYbo5A55ip+WyAIQ8RgAB4YrLGBwVZiv
 TeX7FZaLJKbAtHx3sYz02aAlb/VYHxz4DF45L4p9UH8e33PoctwNE4ed/PXXC3cGQUjA
 QZ2g==
X-Gm-Message-State: APjAAAVt2uEUisXiDiGDwt2Wwo+jzl/jUIBx8LkQYEycSRyzqB3Z1kqO
 s74ygTpEs0s/sWEGcQuHb3uzapChIuQ=
X-Google-Smtp-Source: APXvYqwhlDNWum8FZ5hbclp/V0T0mSS2nhuRj/BLlxCBGNi+0yYG3ZmzkVBR5QUv3W/yAChBCn3UdA==
X-Received: by 2002:a17:902:8642:: with SMTP id
 y2mr24622819plt.306.1582104502116; 
 Wed, 19 Feb 2020 01:28:22 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id x7sm2228786pfp.93.2020.02.19.01.28.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:21 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:57:59 +0530
Message-Id: <12230a17d3574ad2a5cc88ce47451e378c66ce05.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 03/10] lapi/fsmount.h: Include "lapi/fcntl.h"
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

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h                        | 2 +-
 testcases/kernel/syscalls/fsmount/fsmount01.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index e23b52e3733b..49738fede5d6 100644
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
index 5b8e95176728..c3cf8106f63b 100644
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
