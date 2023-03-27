Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E56CAA07
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Mar 2023 18:12:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71A8A3CCBC0
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Mar 2023 18:12:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68F6E3CCEFB
 for <ltp@lists.linux.it>; Mon, 27 Mar 2023 18:11:56 +0200 (CEST)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5479C2009B7
 for <ltp@lists.linux.it>; Mon, 27 Mar 2023 18:11:55 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-536a5a0b6e3so93770807b3.10
 for <ltp@lists.linux.it>; Mon, 27 Mar 2023 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679933514;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3fViac9MbDWQILs9fDverAH1LFD8JQBYF2FQ7eBO5WQ=;
 b=l+1ekOZw5EdmzlKl08CiJQK37z2favY7FC0AhttTIb4dJYuTSLjk0k4uAGSAuL8gpn
 zloF6bFw9RNvSOJVLqDp4rTQ7Y6HD1Bf9Lm1cPPr6uu2oAbGP7wlbsFnyrgPHJGoP98l
 qJ1LGGVCKOaPH7ytuLUOolcwlcaaAcqOwW1EnKY2Mj3govdT7Qce/D/FAR822KgPxYJc
 9F0dyIVLTvYwLFTAx+3PXV1XSHybySAAYOnQ1m3phcz5nXzT9UQ5yxlZ7PmlfZ+UCmr0
 kpMt5bjDFrWY7KmUrO4132kAurJRwux713gWztfGQFRslDowCBmBHfYy1Wp01RH0F2IY
 7GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679933514;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fViac9MbDWQILs9fDverAH1LFD8JQBYF2FQ7eBO5WQ=;
 b=t+cXz4T9Ampl4HTNoR1nn2vMFu0MrZNxcbY+JjpdimshwKfuzhCSgVscXcsqwMTeo7
 0N8FxwUM+a9wRnqQrnHFMLm8o/FWS2qHITueLe8DltTi5oFjYPqTOnx+KT36rwM2UAgX
 r/5mMZ/pHTEFshIl26YPHGWBiQRsuXZ1DgLrox3OY4LxMUtaheaEO9YijPVZgNJMKFgQ
 1Xou5xWnBBsdR39GC5JU9XuzYU61EDQyMyXNJkt8rbK26XlN0bEJp1dwOLub3Jjvx9cB
 btp6lmGyFy+lIzTUQH9i4liRUigGwsFE9356ftcbiioibWFm1solloTinVQDdrOiVeQE
 O8aw==
X-Gm-Message-State: AAQBX9d2FOzM5t7N9EyKKTFoPDNxBRKwh4wjNp8fo8AZzD10mpVfZHvO
 TpfZgIihGEXo1mxan03TaX/bGR4bRc63YLTiySkJvhkeTVxsN0bxfGPcuz5yRljtUPm2WvXesVE
 GLuva+9D6CjYZlLOMd5fet/G7nKtYlwldUoP2eeEorGeJsKLUEqnsme5k
X-Google-Smtp-Source: AKy350aOE8COwEv8apTjONwQC394jtX161rfn5Wa/luu7fmV+z4kO/CawUyYLclFj49RDHrnNrmCDw6m+Q4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1083:b0:b75:8ac3:d5da with SMTP id
 v3-20020a056902108300b00b758ac3d5damr5625197ybu.4.1679933514168; Mon, 27 Mar
 2023 09:11:54 -0700 (PDT)
Date: Mon, 27 Mar 2023 16:11:44 +0000
In-Reply-To: <20230327161145.1702680-1-edliaw@google.com>
Mime-Version: 1.0
References: <20230327161145.1702680-1-edliaw@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230327161145.1702680-4-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/4] tst_find_free_loopdev: Check return value of
 set_dev_loop_path
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tst_find_free_loopdev does not check the return value of set_dev_loop_path
and will return the last attempted path even if it does not pass a stat
check.  Change it to return TBROK if it fails to acquire a loop device.

Signed-off-by: Edward Liaw <edliaw@google.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index 381b91554..2b4b6fb95 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -88,8 +88,8 @@ int tst_find_free_loopdev(char *path, size_t path_len)
 		rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
 		close(ctl_fd);
 		if (rc >= 0) {
-			if (path)
-				set_dev_loop_path(rc, path, path_len);
+			if (path && set_dev_loop_path(rc, path, path_len))
+				tst_brkm(TBROK, NULL, "Could not stat loop device %i", rc);
 			tst_resm(TINFO, "Found free device %d '%s'",
 				rc, path ?: "");
 			return rc;
-- 
2.40.0.348.gf938b09366-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
