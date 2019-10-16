Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD1D9D80
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 23:30:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32AAB3C1814
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 23:30:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 02E463C144F
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 23:30:08 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 14DE4222459E
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 23:30:08 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id y19so29688959wrd.3
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 14:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=buLPMfKyIw4C4PiWym2iWFBid3jfzj0S/nyMOqW7reE=;
 b=CYUtgcJSKOwO4KCQtbj0/5NpBIkStUFM+fhM/7S3irOs8ftwOC2ktLFkQnaq3N8jTl
 GH2M3wQjxjuS9bj+wUxJJzMwGwrOshwQoA1FboQkIo/bSUNzRgYIhoJ5U95NUaaqGdwy
 pGWclqZCI7gWih5uopfK2xlpz6Vp3nkQmApeUsZ0bL9C0yyMcpjude1R76pH3+sJPOt6
 U5Z+Zxs9ICpBM1XZVqEVRkp3rBHs5HOtbreOxveh/PXm93GKpYvsK9LeBi0dZE7qVtB8
 D33rvyvPSNsfHtw0hBZ3wjyH6IQYr13ZTifCkPqj+yh8nTTQGuIoz8rBQUAjIQiOC7Sv
 fkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=buLPMfKyIw4C4PiWym2iWFBid3jfzj0S/nyMOqW7reE=;
 b=kRpjmU8ZTQQKFQwfV/7RvXq7MmXW3w1KH75oQerC/pLqttDVyfv5F3TXNN9hpuuuX6
 ZtQQ+J7oQ3NcyIHUWBFV4UNk5yeiiAu8rYAtu0lgm35eXJBo+R2+mwbF9QYV5duPvy1M
 XLOORq4uNXlwvLA7E55vmKpXo8BayogeelCoxKAEda3qREx5dM6L7ka/1yTggDxe4cHq
 W2lzzG07IUEJLOGQzEQ0hefT4x6Bk7f+Lp27D4lM4wa5yGI1DGlmLGcqwasKWzHcA0s3
 Cmj65hrs9dw/uP6E/cM3JcplSursxYBGPKLLNEF7dcn0HjC4uMOhwseA7syfGmcmNMBf
 A6Eg==
X-Gm-Message-State: APjAAAWcjXj+bcSnw//wWKDADI6fLKzxAG75QAVuEqFI6w7wx7CB9mON
 NJMWjxaWBcytxSYN0u4hMQqzx3cOSMQ=
X-Google-Smtp-Source: APXvYqyz62xaMpOWONBoU23bhmdJoY568jLxm3D2AzBLHkFRam/BAFsJodP6AhsuZjKz6KNzHjLEFA==
X-Received: by 2002:adf:fa88:: with SMTP id h8mr4363456wrr.89.1571261407350;
 Wed, 16 Oct 2019 14:30:07 -0700 (PDT)
Received: from dell5510.arch.suse.de ([178.21.189.11])
 by smtp.gmail.com with ESMTPSA id d4sm80362wrq.22.2019.10.16.14.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 14:30:06 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 23:30:01 +0200
Message-Id: <20191016213001.23047-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] setxattr03: define _GNU_SOURCE to fix build on
 musl
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

From: Petr Vorel <pvorel@suse.cz>

musl defines loff_t in <fcntl.h> (already included) and guard it under _GNU_SOURCE.
NOTE: glibc and others define it in <sys/types.h>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/syscalls/setxattr/setxattr03.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/setxattr/setxattr03.c b/testcases/kernel/syscalls/setxattr/setxattr03.c
index bb511d5ba..58ee0f880 100644
--- a/testcases/kernel/syscalls/setxattr/setxattr03.c
+++ b/testcases/kernel/syscalls/setxattr/setxattr03.c
@@ -13,6 +13,7 @@
  *    -1 and set errno to EPERM
  */
 
+#define _GNU_SOURCE
 #include "config.h"
 #include <sys/ioctl.h>
 #include <sys/types.h>
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
