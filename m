Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B236182FBA
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98CFF3C5EAD
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:01:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1A7213C5EA6
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:26 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 289D61001F3D
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:01:26 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id f15so2475377pjq.2
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsZ2aXxT9Vup2dRQ/tGy52YHoYMfXi/Q/KJ/6v/WA7M=;
 b=dfDMpuIRH5dmjup9RfrEEnuOb1Tk11Kx7H4TYm1KFzR8LCfLZKdmDkZG8E3ef3kfn3
 PK9vHpaxq5eeipb+vI7C5JI9mtyTkaKJrTabcZ6gqjP3GsVhyaH5+0TCykOTqI8pHocR
 PaMvLEAymdlh0o7ZXYqtg8oyYvQxgTK8D83p6wt6AJ3Xyoz2lF9mM2d6/tCYjVwaxMud
 5Ri3dyI1JviHv7lAf4IsM76CZ7mPE/o4uBSBQ4ZUx2CimwIcBwp/mfEiqFCxhaD0pT6k
 HRbCvdgLu5zFG4EvS+yrOfIwXk6NowJPla7lhf7RnwNXSsUipIRZ8hzWIQyytzr8ZcDP
 R6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsZ2aXxT9Vup2dRQ/tGy52YHoYMfXi/Q/KJ/6v/WA7M=;
 b=SsxbrE/CJOU9OfmQnV/fxtn8XhREnxgJW/WClEvT8DUYqmZCHGiS493VntFiZ0GIN/
 h6vJfjuERIxFKlITObPbCeSYxdOweAFM3XE1WW4d0kUVWnOw46phcYsFb5313+Xp+IYA
 2XngmH6VZlsMQJqLiW1yMS6V9TZfUQNAuCTWfGTO+lY7QYwlJvvU+fAP0eK6ItJ8U3aP
 R2q7TCl4o0yeLCVGHzInH7rb3oRvogrNf9RIbmoXOJkVddG4lvNHbN3v0TQUuYHHbm+I
 XDLGKMxkUcWIhyTCiQtVBR+s2J4Bhci6tUF8eiqEk9QnYzhkl4R21b41kOTMRu+IFnEd
 xyFQ==
X-Gm-Message-State: ANhLgQ37YwRDRrCUnJMXS9Ab6HvCYz2Jzb8U74IJkRMjp8SxXgP6mvGR
 jGcdzVGAdgrTUZQ4LQyIkvu50MzDu8g=
X-Google-Smtp-Source: ADFU+vtClHYaWidf7ikvSQPrZOxgQhQvLcw8RBeZNQbe4Dxel4Vykty5glMBSzfKQzePgQjIzstuOA==
X-Received: by 2002:a17:90a:c687:: with SMTP id
 n7mr3704768pjt.159.1584014484189; 
 Thu, 12 Mar 2020 05:01:24 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id g18sm9113369pfh.174.2020.03.12.05.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 05:01:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:31:02 +0530
Message-Id: <30703bd273dc225749871cd8ea3d2c177a0ca353.1584014172.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584014172.git.viresh.kumar@linaro.org>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V6 02/10] lapi/fsmount.h: Add
 fsopen_supported_by_kernel()
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

Add a helper to check if the fsmount() related syscalls are supported by
the kernel or not.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index 87f2f229c371..94adec2fb609 100644
--- a/include/lapi/fsmount.h
+++ b/include/lapi/fsmount.h
@@ -130,5 +130,16 @@ enum fsconfig_command {
 
 #endif /* OPEN_TREE_CLONE */
 
+void fsopen_supported_by_kernel(void)
+{
+	if ((tst_kvercmp(5, 2, 0)) < 0) {
+		/* Check if the syscall is backported on an older kernel */
+		TEST(syscall(__NR_fsopen, NULL, 0));
+		if (TST_RET != -1)
+			SAFE_CLOSE(TST_RET);
+		else if (TST_ERR == ENOSYS)
+			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
+	}
+}
 
 #endif /* FSMOUNT_H__ */
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
