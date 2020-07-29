Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F11D2324EB
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 20:53:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3D073C266E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 20:53:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AC1E23C0515
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 20:53:52 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D3AB4600D78
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 20:53:51 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id t15so2535169pjq.5
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNiIUeLLutCNQ1yQj12jTetedw/Lx2DDoSqRTWcGS0Y=;
 b=uvohNirOBXMx7zHQlqwD2Qy4vRhcl+9u9fCIOdOxoEWLyLzvER6RGndwFR09bBQJE9
 pE9zmOU5uO8dLJjPILSa/245sGWtLM3NM2C8o7uEIcTwnPcySWP8jHq7pqRihQbT+fAC
 N7zv0OiXGZqDmTMrYvm7rFYSWf0zy4VP0qLNYnPIE/p0vDnfKh0pDr4GLwkxNffSdIly
 bMBs35TcFBNnhtsltPoFpPmh0xr6Akx2kVgJuqOFJRrTHU6U0V9NNRPxAujcw0L/LkTU
 TnE+nq06kB848dip/qYQD+8477qhDpDJt8Czv5iwWN4teGmXkkQxnXgRGBFmLkaWasNs
 KT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNiIUeLLutCNQ1yQj12jTetedw/Lx2DDoSqRTWcGS0Y=;
 b=Ov2PZJOrNwOHvQTzckhJK7Us/4QFa8k1WmEEHpVkCyWVn90udpMKMRFoTvhVUP/lrF
 49t/Crb3bVpHzBuyW0dZNYxInez2XPlEiw/hPt7JZMhRLQ7raQq0uL0RjPA7QfY4/Grr
 sBJfCgUK7dciYDjvXIH9fmAqFTCReDh+Ifl1KJAgvKW2kUiyogk7QO3WJQFXXSVBOcIs
 roBHsuu6Ym5cjZD6AEmL1HamygnwnyhZ+LqDqJlw+e+TRDaIE/rngNh+H7QKwKFTv0wM
 F8hgM6evIU3EDrY+b0U7VyPbX2W2AGkvYRvz3UfComxW0styUWveTuQisTMvus6ozuCE
 WLvw==
X-Gm-Message-State: AOAM533POg472tyM57yWNgdoHJggLaezzkIIF4XyeLMrT3owiPaS91kz
 KRCCVxislYerdszyrSWl1e5hAcEm
X-Google-Smtp-Source: ABdhPJyuAnm1CYZOuUS56XNghUxSvKKysj+tdc8Ci8dzyQ+G3CqekKRFM8e0a9oFbYBm/EBQ3TdAcQ==
X-Received: by 2002:a17:90a:364c:: with SMTP id
 s70mr11568831pjb.146.1596048830485; 
 Wed, 29 Jul 2020 11:53:50 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id l4sm2841387pjr.46.2020.07.29.11.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 11:53:50 -0700 (PDT)
From: Yuan Gao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 18:53:44 +0000
Message-Id: <20200729185344.3318703-1-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] hotplug/memory_hotplug: Remove unused goto label
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Remove unused goto label in parse_command_line_args function

Change from v1
1. Remove a redundant blank line

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 testcases/kernel/hotplug/memory_hotplug/memtoy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
index 8ac9600de..e647f86b6 100644
--- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
+++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
@@ -447,7 +447,6 @@ int parse_command_line_args(int argc, char *argv[])
 			break;
 		}
 	}
-done:
 
 	return (error);
 }
-- 
2.28.0.rc0.142.g3c755180ce-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
