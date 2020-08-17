Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB18246600
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:07:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C63363C58CF
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:07:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C57103C3000
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:06:58 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94A316000FD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:06:58 +0200 (CEST)
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7duj-0005Hd-SD
 for ltp@lists.linux.it; Mon, 17 Aug 2020 12:06:58 +0000
Received: by mail-pl1-f199.google.com with SMTP id t19so4145982plr.19
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wegby4JckUWugorC9n6EabnD2ZSbVnkhRYq2Jdgj0B4=;
 b=oA52EXPbWlcQNDgbZYYiA0qbtr9TKTp3dxGDMrInlFbm8Bm0AzLbDSrPavyVvgpqkx
 QQoAEQev72/dQ4rFSgGlh1iLbqbRX+pcLP4gI+nsAZHuhUNf2qIAGdYXT9mOnI9lYQur
 hP4WO7aN0nSgbFFMlPv2mhXkM3FkPdAvHo9YnUa7uYI82rsSEqgY/PhOFo61LD7wvnrM
 aEHpKtJU+RpFJgY7H/gvDkPpnDYQjc1r4BpbHUTZykt63NUOT3M0f07pPS9LbmNYQke2
 Oiv0A5kAykn3vxjkdOWPkMThmVdskhkWurAjTDMDs6CjdBC/YiYP+/FXiLUzpekoUKQU
 0vwg==
X-Gm-Message-State: AOAM5316XvYP1jzRc+0u/ro4mxqYY1Zc7X1RJIBoM0MsXJ8LLqW80jVp
 y5WWbbLQP6Ndu2B91HinKCO9zDBX8rUWzR+grO3SwyRHUABHi5/C22SVSJ+pkOpSvTqCGzeJO9C
 tlyRFkSE+KWM0jV3Lb6shMQdRi6U=
X-Received: by 2002:a17:902:8bcc:: with SMTP id
 r12mr10631252plo.314.1597666016042; 
 Mon, 17 Aug 2020 05:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoWMlAZiOssF2q9SQd1MK93BvLr4z4qLe/uI24c2/RFyVGphOwgJy41+68jaSi0QMFz9k8/g==
X-Received: by 2002:a17:902:8bcc:: with SMTP id
 r12mr10631217plo.314.1597666015546; 
 Mon, 17 Aug 2020 05:06:55 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id e29sm19597278pfj.92.2020.08.17.05.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 05:06:54 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	viresh.kumar@linaro.org,
	chrubis@suse.cz
Date: Mon, 17 Aug 2020 20:06:43 +0800
Message-Id: <20200817120644.9401-2-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817120644.9401-1-po-hsu.lin@canonical.com>
References: <20200817120644.9401-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tst_kvercmp: Add support to get distname for
 Ubuntu in tst_kvcmp_distname
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
Cc: po-hsu.lin@canonical.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The kver on Ubuntu will be something like these:
* 4.4.0-187-generic
* 5.4.0-1021-kvm
* 4.15.0-1093-azure

So it's better to grep for ^ID=ubuntu in /etc/os-release to determine
the distname, instead of doing this from checking kver substring like
what we did for RHEL / Oracle Linux

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 lib/tst_kvercmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
index dc3bb669b..349d45543 100644
--- a/lib/tst_kvercmp.c
+++ b/lib/tst_kvercmp.c
@@ -139,6 +139,11 @@ const char *tst_kvcmp_distname(const char *kver)
 	if (strstr(kver, ".el6"))
 		return "RHEL6";
 
+	// Special case for Ubuntu, kernel version cannot reveal the dist_name
+	int rc = WEXITSTATUS(system("grep -q ^ID=ubuntu /etc/os-release 2>/dev/null"));
+	if (rc == 0)
+		return "UBUNTU";
+
 	return NULL;
 }
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
