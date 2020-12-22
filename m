Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FD2E05D9
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 637DB3C29B2
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6DEB73C5718
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:33 +0100 (CET)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 121F6200B7C
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:33 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id g18so7707031pgk.1
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 21:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kX0LeosKEGswfeeJC+77CW+zhWd++dvVSxizUY+zfxU=;
 b=T83ghm8vov9vOW8ksZwnf1QKbAHRR8UxoEqr5qXeJlkPpTHjQ5Ei0vTcA/8pcV4e+s
 apsgJZD5UorYQ869SiwZYHEw5lcLRiNiOHcQd7+nC8YcT54ewCEPC43zcsgldpymUi/j
 8ito/060+J7tR1cvRQfQlGUxgGgbMhr4J3ajDEwO4MkAHRnb8OrSNMOEiv/rQtu7fjJr
 nn5W73LOQJh9+jLGIZofi8dX2FmWNRoz+HkMbcGmscRUvQEsfSQyXNNe0B/NsZbqClkY
 GSR6/LJqUCIfbPt3mvnOxKY/rZc4F4we6woF5zPFS0wsRdln0aIa3Cw0BIsvQbps3H01
 LBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kX0LeosKEGswfeeJC+77CW+zhWd++dvVSxizUY+zfxU=;
 b=SiJgrQdYfmCltOQhY10vohTEm/JjpopVKrxz7qxBITWP5YSI3t/geeH+eL/+Y9Z36c
 q53lrbeaWSq+/W1u/LJGnX05JbPz7NK6FPvqh4OqpjzWrYpfw+tndCNIR/KVqUIv0plb
 UDSmn6rQWzwwbi8d2qt1SlAJhanUgybq63KYIMqLSa/DZaQKzOTEh3AMIp3FHH8dRl41
 +b73D4qExdvlbQFNsCS61JTlC3tyFR0GjYQeGUBfE83TRMRvf7PGez/qZQc+9OisaHWB
 9C4H9r5JaghprF7kDRlP5WtQ19QFjQFJNVHRYiOxpxxxDM3PsY9BTT76jZoX8Rlyuhm+
 74OA==
X-Gm-Message-State: AOAM532fkj/Mm2i7JJKfWsNYNXzoT0aTzgqrmeWJt3Yeh6mHcAZyHkho
 WBdhuwEBq+yakF29EZ3SXmQL3h0sTKXAbQ==
X-Google-Smtp-Source: ABdhPJxbkqZxyPDc1+4Knk2oYAFbdxYCEYgeVPagtPN4PjaxroRda846u8iTrOVF1+QBsVnlNmkK9g==
X-Received: by 2002:aa7:904b:0:b029:19e:c8a5:5154 with SMTP id
 n11-20020aa7904b0000b029019ec8a55154mr18859772pfo.41.1608616171371; 
 Mon, 21 Dec 2020 21:49:31 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id t22sm18201068pgm.18.2020.12.21.21.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 21:49:31 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Tue, 22 Dec 2020 13:48:41 +0800
Message-Id: <20201222054841.736529-5-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222054841.736529-1-gengcixi@gmail.com>
References: <20201222054841.736529-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] lsmod: add gitignore files
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

add compile module generate files into .gitignore

file:
	testcases/commands/lsmod/.built-in.a.cmd
	testcases/commands/lsmod/.ltp_lsmod01.ko.cmd
	testcases/commands/lsmod/.ltp_lsmod01.mod.cmd
	testcases/commands/lsmod/.ltp_lsmod01.mod.o.cmd
	testcases/commands/lsmod/.ltp_lsmod01.o.cmd
	testcases/commands/lsmod/Module.symvers
	testcases/commands/lsmod/ltp_lsmod01.mod.c
	testcases/commands/lsmod/modules.order

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 testcases/commands/lsmod/.gitignore | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 testcases/commands/lsmod/.gitignore

diff --git a/testcases/commands/lsmod/.gitignore b/testcases/commands/lsmod/.gitignore
new file mode 100644
index 000000000..0e19fb3fd
--- /dev/null
+++ b/testcases/commands/lsmod/.gitignore
@@ -0,0 +1,9 @@
+*.ko
+*.mod.c
+*.ko.cmd
+*.mod.cmd
+*.mod.o.cmd
+*.o.cmd
+.built-in.a.cmd
+Module.symvers
+modules.order
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
