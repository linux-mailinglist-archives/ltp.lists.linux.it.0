Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C863616B9D6
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7313C3C2615
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8093F3C2622
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:41:00 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C07D32001D2
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:40:59 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id 4so6639337pfz.9
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VgygX/O//wUaTggLlqoaZZbWXZli523jsG1uz/WP4xU=;
 b=en/pY1HtphKnZtIb2KOu7DWxDaVQZNSUGX9CxcDYxO2Q6zCRHmY6HIMMblmKQbH7Z3
 xi8g6s3DNwuANzbse9yKtpbewev+FX7KQniXnB7InGaZcKu7UsbzeMk/DByxTxNAbY+c
 wNp8fnLKIBeNWHt4ExHL16pqnJezp6HtZncO1hHc/X4Og5a0vExxxST5KD8Y3OmnYDWa
 1bg7cn3hHtImv+c6M5eR/0EgT6Wo51YauWFLWRGpO4GDCWBwAb5EH62vFgYGGaegDmEW
 Q6Ju3BMZLhzJ78p0d7dvsdF+4iBzpXJvpv+8RyidsBLteuxfv7ZiljL7bq44ifOmNrqU
 3PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VgygX/O//wUaTggLlqoaZZbWXZli523jsG1uz/WP4xU=;
 b=qJ9EgIZBZH5/7zCJbyVh1IwV4mqS/1TMg5WnOcoxdj4ChLO8rA63Z0b8/5yslIFbu9
 kvCQJgQ/dl5SuljDbX4F9FufRhIkCcq8Q9JnIEa/mZL9GPKfNzQa++ea1bEhc/AVBplF
 iUCoARGZ8vkwwiA5flxb0Ny1cVfo7nfrXg+596bqGkCIx6h6mgtbTxCI0NYGMrhDuqww
 BWz3CufNb09OmTtv5p30/HxMwNK8WUiERFHqLmSIax61zWfVI2xvAJ3qSaVvYmB74lg9
 RD4b0KBuj+kSh8EPAb9WwFMhWkQsbI7f2IpkgcNUezHe/GhOX0VBJuhqti84Fr77uAlx
 gUhw==
X-Gm-Message-State: APjAAAUyIRIGt0kZD2F0RhJMtX4WubjzKhGcZafPUzaFkXjwsVpXyq2I
 tYt3y4blbKy0rohHdZW4n6Z7qECXtRc=
X-Google-Smtp-Source: APXvYqx8kcXk1upSFo1vz5/rBNKZuQ7hEW23pRvVTJN040kojSUcoUZOy2U9NuhhynI3pYhia9YHuw==
X-Received: by 2002:a63:8342:: with SMTP id h63mr19708760pge.141.1582612858026; 
 Mon, 24 Feb 2020 22:40:58 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id r145sm15598998pfr.5.2020.02.24.22.40.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:40:57 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:40 +0530
Message-Id: <adc609fbfd9b8ccc31bb3dd6050af13d7126e2f2.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582612624.git.viresh.kumar@linaro.org>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 02/10] lapi/fsmount.h: Add
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a helper to check if the fsmount() related syscalls are supported by
the kernel or not.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index 87f2f229c371..a6a24904e66d 100644
--- a/include/lapi/fsmount.h
+++ b/include/lapi/fsmount.h
@@ -130,5 +130,14 @@ enum fsconfig_command {
 
 #endif /* OPEN_TREE_CLONE */
 
+void fsopen_supported_by_kernel(void)
+{
+	if ((tst_kvercmp(5, 2, 0)) < 0) {
+		/* Check if the syscall is backported on an older kernel */
+		TEST(syscall(__NR_fsopen, NULL, 0));
+		if (TST_RET == -1 && TST_ERR == ENOSYS)
+			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
+	}
+}
 
 #endif /* FSMOUNT_H__ */
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
