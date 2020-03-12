Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D4182FBB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:02:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF9923C5E95
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 637CC3C5EBE
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:30 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A85661001F37
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:29 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id x2so2799386pfn.9
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYPWs0zvQC33zMq3tDLsxEkeoB9nuw9wHWSDOZfYDZc=;
 b=VqEwDNZ04a47n4hizsxI9HRU6NOv1gnZtJ6stpwMUZYZnUxQu6QVNwORA8mXV4RbGx
 /im8KAomXmzDXcWeHAuhRH+WDnvSnricQV+LicP9nWj/afboDeYJut2LnZYIUFQfd0Ya
 5Cyn1b+tu1zCjSRB5web6wWL1lhxzFfMVmtSfHjL3GVXTyQSp4A79U70/awhLay+hBqc
 ZMftLz4id6YqeFOCe7tHVhSABElBWfeG5MkPlkmRxIaFRhzSIi3n+r58Lx4/RGifmq0d
 99mNwckAXPthV0MX8mFzs4sHlJ7ZEm41oKhK5klEa18uhjXBx2lV3W8Mu7xsTVuYxtSd
 2mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RYPWs0zvQC33zMq3tDLsxEkeoB9nuw9wHWSDOZfYDZc=;
 b=jvLlwsm+Cr8UuAjayxEABx9DyHeSMBB+3SrfcyRjRhdNlYPKxLj+r4XLdsTlmRBM6i
 WrM5vkfyCD/zxMx55ekinp3ZP0ueZY/54j/kNx3aMx1MSnM47h5zAQvVMX1HcOaiGaE6
 bfD/Dqy6leR1KGP6YIZi1/wd7xJD3i3yvgbZJnP9XZIGNucj+DSkvonasFi66e71hxxu
 7xVmfRxfb6Hh5Y78Pd0TeBnRqwdpItV5QPs2+iqtbsRsysR05XdxvInMKjhX373n8+oL
 R4mOrasxEOZY/Ue9Ytn/HfNLW82VQVA/4ljGuc98b47WcgExClekUZHh31J23pY4zBFm
 KCMA==
X-Gm-Message-State: ANhLgQ0dX7HIZZBS6Cw1p5GYhb5PZWbNGh7X6DST0AJBtuvedCH9nddg
 Pm0ZK5Hq/Bzo2fB9E1M7j/XXtt3/AQo=
X-Google-Smtp-Source: ADFU+vvs3HFnP8EU/dil+BLnoYOc0EqIfHrvv16+dSjlCTe1zSbX3UzG/i0BfiYGN/Aq7zJui8Y1Ew==
X-Received: by 2002:a63:5f13:: with SMTP id t19mr7229688pgb.265.1584014487085; 
 Thu, 12 Mar 2020 05:01:27 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id y207sm4182215pfb.189.2020.03.12.05.01.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:03 +0530
Message-Id: <ee1f3ca8455540f9fc90c9521d573071fc5ad802.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V6 03/10] lapi/fsmount.h: Include "lapi/fcntl.h"
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
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
index 94adec2fb609..09a2c1611866 100644
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
index 530a794647c1..43337e22e224 100644
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
