Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B337C14C928
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:59:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 397F03C2569
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:59:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1E24C3C2387
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:59:06 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35779600684
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:59:05 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id 6so8661250pgk.0
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDee1WcKsYoWNIf0+N8rt29p4eleWnJvIkbTnO3DsRE=;
 b=COwDXGlKiZw+WAWOCSmxvvySoqOSJn081FZ8KOuHlFOxy1774kUHYDHRfqzf70Hbfj
 dI1Vmo9Jc3Kkp7sU/spngkb6uarqyKWS7H9ZvkqnGOrjPKdolgX6WFGKwAPNWhA4mC+n
 rH/tE6fwERSGctUa/EvGu3IPCRYqTE1PZFPLsqSq1RwRK64VXIBx4kflmQUsZ17Gh69b
 zoVySRGh5UMIQW1zXIR6FN7u1vPf56DB4zqPikCQsprwhTghcdExIfD1sNbLmC0QmuFW
 4K48UutRK0bHtfqRzzLig4c2PlykxnoTAJTHEJqY4e5KDZZWAjgR3UlgceVASh7lTgQP
 B7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDee1WcKsYoWNIf0+N8rt29p4eleWnJvIkbTnO3DsRE=;
 b=OPpLdq19DwYpJVI+67ABI5Yq/n6ceibZzL7HAw06vbNlunbueaVtfaxY43rByy090J
 o1HxP7wANIHdFVBv1QS58pAfuY5s6uCsfkv9nZCkQ9XuiK0t3x1QHehSLCbhKOVHWc90
 dCtW+irS9IMVzaE6iCmbDkM3uyALdIXXNAtsNIHec0C8fzC6a9Z0wyFBCgEhdDvObSVd
 qxHo6XheUXQSmd8/ktw8g5M2drEMj3Yqd/Rb3LU36L8oGzKjRv99jrUz6hktoLuJUwFR
 mQrZY15sf34PMCMAt3Z7/8FnG9mYzs7s6gs6ujAmKDVdB1lA28KERhFOE2F/FCRhdlea
 9h8Q==
X-Gm-Message-State: APjAAAUQH57F7cDpUfNcYy0nTQcK2uv632DceN7mrG5pOH+/7oNp1tfY
 Oaynrv4MXXBLFuds7l40i1jexA==
X-Google-Smtp-Source: APXvYqxOuBjKvOquzQcE0EVPjJtgRaLn5C9LcjSZZ/NdktP3HOvtnw/jAM2Jr/LATLF7XXKYM7aVZA==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr15417343pgq.102.1580295543691; 
 Wed, 29 Jan 2020 02:59:03 -0800 (PST)
Received: from localhost ([122.172.141.204])
 by smtp.gmail.com with ESMTPSA id b15sm2134709pft.58.2020.01.29.02.59.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jan 2020 02:59:02 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 29 Jan 2020 16:28:34 +0530
Message-Id: <846e4f42d5112c2f945c391644949a14756f53f6.1580295508.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/io_pgetevents: Use tst_syscall() instead of
 syscall()
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use the preferred helper tst_syscall() instead of syscall(), as it also
takes care of error handling.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/io_pgetevents.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/lapi/io_pgetevents.h b/include/lapi/io_pgetevents.h
index 9c7f0ec9d813..3c9d5b2d7618 100644
--- a/include/lapi/io_pgetevents.h
+++ b/include/lapi/io_pgetevents.h
@@ -21,7 +21,8 @@ int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
 		 struct io_event *events, struct timespec *timeout,
 		 sigset_t *sigmask)
 {
-	return syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events, timeout, sigmask);
+	return tst_syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events,
+			   timeout, sigmask);
 }
 #endif /* HAVE_IO_PGETEVENTS */
 #endif /* HAVE_LIBAIO */
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
