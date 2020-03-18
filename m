Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA218962B
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 08:18:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 354ED3C551B
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 08:18:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 278DF3C013A
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 08:18:38 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EE75610009E0
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 08:18:37 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id h11so1281674plr.11
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 00:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXPw+mEK04mDu5jK/sgjBQGWUCjbS/oEJEK2idtMO9g=;
 b=PwSf/280MgSQ/yKaLlxqZioHAyfaoYT/eJz1o+83zKgj5MYqvNLULtMlAh74PjH0al
 DGXQch96gJeVZ9PJup1Z6yRzGMrYHeqZSYWyAh/7RGU28aVXhzmaYSKbXtdYdkQ1mO1b
 2d3siQC9Kl4LWqWdp/y8V7fYn4mlNBCVs7xdhG5JYKvh5zjtQgT6jLtiIfqvJH9jcQZO
 cEGq58fxNyz0lnHqw4+pcojmsa/IApqqM8So/0vDFMtvOffbtmZD5mEZ9LabetGLPCT6
 hn0fj4CJNU+HCbYycYzb0M2UakGlm1czX9q4DN+NjZS6ye86tNHDVkFFWkY8VP5QDMoJ
 k/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXPw+mEK04mDu5jK/sgjBQGWUCjbS/oEJEK2idtMO9g=;
 b=NWsvtfZlPmxkFoLRZ1M7TppYJMkW5kFyvWrB53Oqd7uNUmcmx7k8wqRFhuulvA/6y7
 Q+BNnnuVrI5mHXzxP62YD2m6q5LiiKHelK0R/q8FNSJVC4jJw8L2zsuiJU42J0BPQ71D
 l5lgNUb1IsEuRfQCBGFvXMU87uyH8T+4lrkmMwrYpvi2s2FUVSxEns7qIPGnRseXX81t
 FukyYlTLw5qYXDcYseILiDcSbxAiu6+0EtpbWpuISQayGy1k12sv/+Ls58AEbGHv8GvS
 PmlKdU+4z+MwDul1WKLiTkrir0b1OYHsiq/9TFzjLHU7Imjh672+eq55Wa19hziL0ZTP
 5i+A==
X-Gm-Message-State: ANhLgQ2fOuf5kwLBXiArChfSGpmuQTKVA0ndsJHgDY+jnvI63gxoWu3q
 DxCsqDL6oqf13Yzk40ety5ZVxx/zMgE=
X-Google-Smtp-Source: ADFU+vuBshiw+e+9SBFufsVFsdt0inazvlQapj9MKQpzXy72iHeThSXEQa88qUBsbsOusB1jNuAx1A==
X-Received: by 2002:a17:90a:2a89:: with SMTP id
 j9mr3165645pjd.64.1584515915907; 
 Wed, 18 Mar 2020 00:18:35 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id 73sm4821407pgg.90.2020.03.18.00.18.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Mar 2020 00:18:34 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 18 Mar 2020 12:48:27 +0530
Message-Id: <31b0bde3ac9d0e617c2878a9b4ae1e1dc1f39c10.1584515853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pidfd_send_signal: Use local pointer to
 verify signal data
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
Cc: camann@suse.com, Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The current check, uinfo->si_value.sival_int == DATA, will always
evaluate to true as we are checking uinfo by mistake instead of the
pointer passed to the callback. Fix it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
index 64dddad6643a..3137b6967371 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
@@ -26,7 +26,7 @@ static int pidfd;
 static void received_signal(int sig, siginfo_t *info, void *ucontext)
 {
 	if (info && ucontext) {
-		if (sig == SIGNAL && uinfo->si_value.sival_int == DATA) {
+		if (sig == SIGNAL && info->si_value.sival_int == DATA) {
 			tst_res(TPASS, "Received correct signal and data!");
 			sig_rec = 1;
 		} else {
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
