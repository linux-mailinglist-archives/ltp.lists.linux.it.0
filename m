Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EF3171006
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DB553C2549
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3459C3C25CD
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:55 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8361D60092C
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:54 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id b1so818317pgm.8
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igC8sNIqb3C9sWcEIoUIFuUzh6VpccovgjPm4/pN6fw=;
 b=b71i5CznJRLAZnK0W2gzHjF02g87OkEYXL7/zzI88WHeYLh2qtmczHE6cieXRVdw7L
 u/aehs7u1XEeAqeXH/rYCg5D13ALbEpcjzjXCuUNk6R8CaF4krYay0CL58dFeI4ZdwrW
 q/Bi6XUquwKdrz7g1TzSIHM7pt67wSqt8JBUImnkvJCh30PGSdWYjv0px0VzEqv/JqKc
 MKS+lpSFtGaTWjKUiyGybbbo7VCczgxsSyEFkLN2D2ZjvWmAoUIxDrVW90Pfb9Cgwp5U
 6iNTky0siy6iPqTRrd7KW4+5pgxgZl1OM5tU81wN6/xFlAUyCjyakYZA71yucHcm6Qnb
 2aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igC8sNIqb3C9sWcEIoUIFuUzh6VpccovgjPm4/pN6fw=;
 b=QIrLXXOuXQgd7TiYtB9E4HREgiYe8FtYKMs2FljUg7ehRcnvpTwD5YJo0Nw3/wgP6x
 HPwyB0wCKB98ave7pJQzu6kRzwfnrk1bgQx52KLO/2u5HlW//jEmij+c9qSdDJyz02OC
 Y9HBlNJa7+zy9zAVf3t1Fl+tA9BBXsmb4SMmM4K3UhtJpc6cZMii76m4RwDj5ijPks19
 hO5e9T52eEh6y+5H8w2P+pXFUbZaaKeWnwP4zJ/SBull8aT8/UR7eQooWO6thyVedlje
 8tM5yGFwL1VXTxArEHXrG0zzNs0ITS+qV1m7rqo4kVBT6rPhV+vrFF+S1QfsfF5BIBkB
 C3bA==
X-Gm-Message-State: APjAAAUIK34Mxhe7KNSe0RJFmn7NBMFbpzcDSgg5lORgzwsC1XiOzVvn
 3Iho2tjJ88Rz9JZLtWSVH1soqsvkeIE=
X-Google-Smtp-Source: APXvYqwMu/f5QhD8cUO1kRiXSYJ+8bVggj+M539sStryQnW8XL6rOW9DWzlfccWfK6vsiaKevvkL6A==
X-Received: by 2002:a62:2ad1:: with SMTP id q200mr2359367pfq.123.1582780492625; 
 Wed, 26 Feb 2020 21:14:52 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id 133sm5269424pfy.14.2020.02.26.21.14.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:14:51 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:31 +0530
Message-Id: <7a20c9dc8df8c99f07d5aff5c153a38b21dbdc19.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V5 03/10] lapi/fsmount.h: Include "lapi/fcntl.h"
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
Acked-by: Li Wang <liwang@redhat.com>
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
