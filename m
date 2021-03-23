Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00034E364
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:42:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50BD23C278D
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:42:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 94EE93C2CD5
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:31:47 +0100 (CET)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5A2091A00988
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 14:31:47 +0100 (CET)
Received: by mail-pf1-x429.google.com with SMTP id 11so14331038pfn.9
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNOmG0uF1LdxN2SibD6Yz28dDFCU+iWdPKZ4pEjpTcI=;
 b=fuNbsajLmX2FCuudNVNUHWCYaF9uaTYswgJxl+dtcf8xThLpiXDiIfYZgOt0Kkagy6
 g+9cwoLwxO/awaB8eMY4DlpCo3WXLd3+CapmOOxqLROmVJiW7+FG/X+DIdncSTr7CSQE
 NMOTV6QDoz2rYPbPV9nLAyij6LYVIU4BFJPjxTknvklO8CaHfG+UExnr8FGGR3kZ8Zxz
 xrxTDbIdoKWxg/ORcnr3FB4R9425ZG3T7t09nwIUPTPRghTgonY+3H9cyc3Fb0dCJeN4
 31lmUaZfnRVlwileS4K2cEmHDQbinwOt/fQ1BfZowjoQIQfIeHKJsDs5D0gHMSDdtKfy
 ln/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNOmG0uF1LdxN2SibD6Yz28dDFCU+iWdPKZ4pEjpTcI=;
 b=LHrKoGxa+ZQvidhZnJz1QXQtq1XSSPgLprSd1YxXdF6nOBLyHu3y0W6DyAQGW78jeI
 BLoqRZLYuIWkNpATIxVrhu23PXbhFMPpY/34cVNkNRIC2Rjfb0+3mcPqr6ftsDvhNjxM
 /NerLkyxIqywV98HFPp17zmRo0FPjmhYrkfaYM/vJJckccM5QSB5pRmvBPNhjUSgmLTa
 IOeuWNqUbf68iOXDmJYw+UcD7wlTvEmw9hsYmIR6z0cv2YNBmkEeE3ryx0EGiMh+d1CT
 T7ulADkXIHk5kCVU4zf7SuwkBcQbouLUccmY9v7ATQ6dY8ksmMZ4Xt2bVUAIgD97qwgV
 IKGw==
X-Gm-Message-State: AOAM530pLwqbfU4AhkhqCiaWGcW6V8Bc/QaRHUMo7wZ1ga3zL0pIno+c
 j9kEPkF66atG64MA0wmiAl77t3ASHzj88tK6
X-Google-Smtp-Source: ABdhPJwyB9XW2GDVDlsQtdq5rH9VSmXAA+affjITfva9miiMOjJCYXXZAU3MM/kgqaYFCyOuPunNQg==
X-Received: by 2002:a17:902:b7c9:b029:e6:3d74:5dc5 with SMTP id
 v9-20020a170902b7c9b02900e63d745dc5mr5746227plz.16.1616506305343; 
 Tue, 23 Mar 2021 06:31:45 -0700 (PDT)
Received: from maritns3-pc.loongson.cn ([194.156.230.236])
 by smtp.gmail.com with ESMTPSA id b3sm2767489pjg.41.2021.03.23.06.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:31:44 -0700 (PDT)
From: xueshi hu <hubachelar@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 23 Mar 2021 21:31:37 +0800
Message-Id: <20210323133137.2280947-1-hubachelar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 30 Mar 2021 10:42:52 +0200
Subject: [LTP] [PATCH] change mmap flags from PROT_EXEC to PROT_READ
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
Cc: xueshi hu <hubachelar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

In some architecture(e.g., mips), PROT_EXEC doesn't guarantee PROT_READ,
which will cause segment fault. In others architectures, PROT_READ is
more accurate.

Signed-off-by: xueshi hu <hubachelar@gmail.com>
---
 testcases/kernel/syscalls/mmap/mmap03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap03.c b/testcases/kernel/syscalls/mmap/mmap03.c
index b957a3218..2fcf1ef17 100644
--- a/testcases/kernel/syscalls/mmap/mmap03.c
+++ b/testcases/kernel/syscalls/mmap/mmap03.c
@@ -85,7 +85,7 @@ int main(int ac, char **av)
 		 * with execute access.
 		 */
 		errno = 0;
-		addr = mmap(0, page_sz, PROT_EXEC,
+		addr = mmap(0, page_sz, PROT_READ,
 			    MAP_FILE | MAP_SHARED, fildes, 0);
 
 		/* Check for the return value of mmap() */
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
