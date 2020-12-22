Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C202E05D6
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 335673C56EC
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B72313C29E3
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:26 +0100 (CET)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D011E600969
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:25 +0100 (CET)
Received: by mail-pf1-x431.google.com with SMTP id w6so7849346pfu.1
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 21:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7TdbvTYqx9kGGJE84xvP95zVhOV/8a8vCmW6wqQV+vM=;
 b=u1KrCPaoRzE5P2WK/vq4yb97QOaaoHexQBpAVg/5BDsOILaxMGwP3ieRIUmWWD77wD
 lMI32lJkrZ0/SdRJ/fBi60iTv7kZiAq4axusNKiYf91SSG/0x7T4Qs4qTp8lWXhvJqex
 sRPfMC/DKlzksOJywLAKN+25igC2iqx9GsRfhjGnDwudU1ykkNndlUUjZ5BbsscO2m3E
 7vPeoQrnmx0RBsFgS4eQqTWqKFrNXKlTyhkxrumqFHyMxUgIcIP519+xtjAioPZKSIgU
 gqJNGSCKRQ5QenM5eQJoxXEpRQqpspTg2G2i5X9yW4gsnuHVjz+tl9/SEW9meWbHcJZI
 h2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7TdbvTYqx9kGGJE84xvP95zVhOV/8a8vCmW6wqQV+vM=;
 b=OLssTkg8rUhpMOMIttI8zLoFXv8gXfSFbgATw3jYnD6KiunpOb3y0K8ugeWv35dutG
 MYEf6YF08uMj4TN1byWJV0AIwy8CA5i5zV2iGZ1NLK3quDmJDyapWhvnKG9Zn+HsrlMs
 //bnRup+PIhAvGVrgNeQFghhoI9+K5E6ZoUhNEJKw0zhu4LDkqTmfhh6HL6TBmqSIGdA
 CjwrXjZUjTPIzI8qQyokAyg5vZa7F5aNVJGjBp3mc2J318wQTvPkFu8oSFaJz7TPEFgo
 8k6HiKb3VZqk/hKU86r81FBuTRBwTVUgNok+Ud3uTelYJccmijv/JMRxxv0GpV8VZtSI
 cl+g==
X-Gm-Message-State: AOAM531qWtmJz7JwbLNkh0G7y1IGrfsPeNwoVmmMNCyCKe2y5km9SOLQ
 ALTS4HUF3jjPlStxXmnlIIhHTvemZMY3lw==
X-Google-Smtp-Source: ABdhPJyqZg9DVKKctwRR3mKrqWy1lk1XwJRLmJ9SClhgOz67sg+kxJI3RwbzQJjgyyOJd6JQU+ccAA==
X-Received: by 2002:a65:47c7:: with SMTP id f7mr14083641pgs.305.1608616164180; 
 Mon, 21 Dec 2020 21:49:24 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id t22sm18201068pgm.18.2020.12.21.21.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 21:49:23 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Tue, 22 Dec 2020 13:48:39 +0800
Message-Id: <20201222054841.736529-3-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222054841.736529-1-gengcixi@gmail.com>
References: <20201222054841.736529-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] init_module: add gitignore file
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

When build ltp, there have generate some module files in init_module,
add these files into .gitignore
Untracked files:
   (Use "git add <file>..." to include the content to be submitted)
	testcases/kernel/syscalls/init_module/.built-in.a.cmd
	testcases/kernel/syscalls/init_module/.init_module.ko.cmd
	testcases/kernel/syscalls/init_module/.init_module.mod.cmd
	testcases/kernel/syscalls/init_module/.init_module.mod.o.cmd
	testcases/kernel/syscalls/init_module/.init_module.o.cmd
	testcases/kernel/syscalls/init_module/Module.symvers
	testcases/kernel/syscalls/init_module/init_module.mod.c
	testcases/kernel/syscalls/init_module/modules.order

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 testcases/kernel/syscalls/init_module/.gitignore | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/testcases/kernel/syscalls/init_module/.gitignore b/testcases/kernel/syscalls/init_module/.gitignore
index b4d11e958..23baeb651 100644
--- a/testcases/kernel/syscalls/init_module/.gitignore
+++ b/testcases/kernel/syscalls/init_module/.gitignore
@@ -1,3 +1,11 @@
 /init_module01
 /init_module02
 /*.ko
+/*.mod.c
+/*.ko.cmd
+/*.mod.cmd
+/*.mod.o.cmd
+/*.o.cmd
+/.built-in.a.cmd
+/Module.symvers
+/modules.order
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
