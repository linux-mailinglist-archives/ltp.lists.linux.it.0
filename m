Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF781DB8DC
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 23:16:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B12EC3C2337
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 23:16:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 778253C22A2
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 23:16:21 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D0D1D6014A3
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 23:16:20 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id r3so3931853wrj.6
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHUZRFUTaFvpP+lEwmHM4189zxq77INNGrt025TqYMo=;
 b=K7DtFNtXJbV+3+aWiDwxQ5ZcN/TNfwenGBFkBvgoQQ7P6KQ/iFldNJOcVz3NMl44Uq
 hw1iBo5K6G3YKPc3M2qgZ/FIC8hV775KZfjcahuI7nljBAQZkynYCbK1mhXRy6hoGa+K
 fnzrJUpdlQ+wU7qokvt3hhFSvD402k3Kvhgr9Ix6lkn41oKiZ42WtbSpsnB2FN6q5J2X
 pIn7YOiryxsg55lZjUdz6vKSJLAtW4mj4yYp6rJRztGzQUKX81m4al2S/XWt3sOAeA/p
 sOM8uiQwzG3b2vhVpXRd+t2s6zp6UBTj0o9h4aAX78Qh3kBdITRvuO3mJ2ZMfE/Hq0/I
 mEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHUZRFUTaFvpP+lEwmHM4189zxq77INNGrt025TqYMo=;
 b=qT802XqDTuyLB4Z1qNqq1qrcvU3jQbfqLIHaAxztLzCKhf2RnoaTIpTMCIXbhljGNL
 wryPUdpCGw8jruc5J6GKeaRJenyYzMJARimQrGaFsR97HPHIhEfbj/Exmkieq1GSrLvo
 IvBWBtFTFxnWWgaldyUP9qoeRCydKnWRYj1uT50A/zcK/V7AOKHUt6eglUepX8ltu/NV
 xy3VO1ohz//PNWFy6Y5+B6vZJq7u5FKYCx0peGmkoXYWgknp+9uqHRtHSJZbpFOCbwE2
 jYswdGfhCCjkdqL53NCg7/VKyOgM46XsG77VHt0zLRwueiNARKc133zg9sJPTeEcFOoM
 rPEw==
X-Gm-Message-State: APjAAAXibHGRyrfMbM9dRiuTH05k7NDWAEOVd9fKPpjD0BgJi23sLE6n
 nxsXGodfj0i59thtfmNNw+j2DpAOzOY=
X-Google-Smtp-Source: APXvYqzMKH3YQ4+VL4rSA6ZDNNVkOtQt4iNVZvrHOYm1gRAj+shbDrRw0xv/QvnYSeUwKtycAg0lyQ==
X-Received: by 2002:adf:f010:: with SMTP id j16mr4818234wro.317.1571346980038; 
 Thu, 17 Oct 2019 14:16:20 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id v7sm3272775wrr.4.2019.10.17.14.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 14:16:19 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 17 Oct 2019 23:16:12 +0200
Message-Id: <20191017211612.19090-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] fanotify: Fix missing __kernel_fsid_t
 definition
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

which is needed for fallback definition when FAN_REPORT_FID is missing.
Instead of including <asm/posix_types.h> where it's defined we just
define the missing bit.

This fixes build error at least on musl.

Acked-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Jan Stancek <jstancek@redhat.com>
Suggested-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 1c7623d3b..435f100d8 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -126,6 +126,13 @@ struct fanotify_event_info_header {
 };
 
 #ifdef HAVE_NAME_TO_HANDLE_AT
+#ifndef __kernel_fsid_t
+typedef struct {
+	int	val[2];
+} lapi_fsid_t;
+#define __kernel_fsid_t lapi_fsid_t
+#endif
+
 struct fanotify_event_info_fid {
 	struct fanotify_event_info_header hdr;
 	__kernel_fsid_t fsid;
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
