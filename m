Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7816D9C53
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 23:15:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE7223C22B6
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 23:15:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1169C3C1410
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 23:15:13 +0200 (CEST)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 856BD1B7182E
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 23:15:13 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id 3so295505wmi.3
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXKSFHwmY0WSjXKSLXF4mpnlru7ODpAT2sBekhKh+BE=;
 b=R/T2RUgBM0lgK1TBZ9l+Iy729ILh96XkK1rI1estUq8/vDJawkMGjvotR3L45L5TO6
 jB9xZsTvwVr74yibmyFbpKa5m/st8a9rbWGGfWrKjiNZ8UHh3IPIxOxPmFCW0E982L1J
 CAzZnA+uMVMX6Czco26NayIFQGLAfPSOj4cz1Y4b00lg9xsrArtVZOQv0o5u8X7zVYXF
 ygU3NcztpkjPl1whkp27CDYoJzgIa5c8nuGqArTYFKR3MY81dXFmJ5pzJW7GKoDRuMA1
 bJRbGlBMSQ2ey/I4XqnPIjjc5MaUBEIYeghFkX0xM2IiSZ9+nQhm3uHN9Odup3WcC3KJ
 kcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXKSFHwmY0WSjXKSLXF4mpnlru7ODpAT2sBekhKh+BE=;
 b=P7kDo0yLGrrId2hfSCx1xBDWWE59uDnWawiIVMNCgDRtsKbqcuJzmQB7VTuvOfM6hQ
 5eFzxJqq15L5k7W0eP+gHZ63PkP78SWlf2xaj+yn9toxUftyg7DPVbp5SXTE0t2vOr55
 4k6yWpAD8q4vOZ6fwJoPusZ7Iqk/iM7moxDRONtvIoBWyjCS5XHYMZQ6I+hWFFRsJgcU
 Yfqb75S/YWzI+vg0NahaY07Fbo4XGZMbV0M+fu/TQWTux83aDr7cVEZjhuVfeMrQKzfK
 wWkgYTqLMrekrZ4M2M8lk4hyxqdPhiq6/0cGHy6jJCw2mUPLcjQoqIL2sd+3CvoenTNx
 DKyw==
X-Gm-Message-State: APjAAAW8ib9LtJYXMSXiCOzIeU1k0ESKxQ+IClpK8b1io+oFX9SBKjs5
 HDnw58c6HUgIWiXjjXEMSX1Ic2r/6Z0=
X-Google-Smtp-Source: APXvYqy1n2f29q0IedmBIAkpvcQozKYUg3TOeMOes5SoieeZpE+jRYb/7Gl2kb/vaLmAJXIdEMLM6w==
X-Received: by 2002:a1c:e10a:: with SMTP id y10mr5037864wmg.29.1571260512820; 
 Wed, 16 Oct 2019 14:15:12 -0700 (PDT)
Received: from dell5510.arch.suse.de ([178.21.189.11])
 by smtp.gmail.com with ESMTPSA id y13sm80024wrg.8.2019.10.16.14.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 14:15:12 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 23:15:01 +0200
Message-Id: <20191016211501.3777-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] fanotify: Fix missing __kernel_fsid_t definition
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

which is missing at least on musl which doesn't have FAN_REPORT_FID
support.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 1c7623d3b..01a2d52bd 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -35,6 +35,10 @@
 #include <errno.h>
 #include <fcntl.h>
 
+#if !defined(FAN_REPORT_FID) && defined(HAVE_NAME_TO_HANDLE_AT)
+#include <asm/posix_types.h> // __kernel_fsid_t
+#endif
+
 #if defined(HAVE_SYS_FANOTIFY_H)
 
 #include <sys/fanotify.h>
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
