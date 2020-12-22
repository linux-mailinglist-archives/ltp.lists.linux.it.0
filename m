Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B32E05D5
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03A633C2973
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 19A893C58A1
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:22 +0100 (CET)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3D55E600AFB
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:22 +0100 (CET)
Received: by mail-pf1-x42b.google.com with SMTP id c79so7834528pfc.2
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 21:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fga8hcBw/t52ter24P/Z+ZkR8UZSyxMYqMSBB6gbttE=;
 b=YyBtT8J+vVRYzrMS8fv4rqeey7Sv7x/n8D/CwLH3W0w5Z9f+WoED0SYi/irlYq1lZX
 2XE4oABi2rzq1BuFsuKFOtV37gwWS5IAqCFxZb8+/rwenAfsmGQY4xPWbteUOf33jqTD
 zO3p72kEyMuma8w97dPYAJO2aAgJsY1LIRyFEtpYAI2cXd/D2iBOBoXmKghQrpgU9X4c
 DOfRRs1jRu6ptF0Iwi3XNTkMZJ1R/THcoZjPEPtMeCX8uAboYPBRKXrSP23oQ+vtsJgZ
 E7tAD/j7Dvw/UkCkYET4LVcOObYSM40ICcUcdXhwMeZ7gNh1UvJrJq5UCanSVv9BlWD0
 5VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fga8hcBw/t52ter24P/Z+ZkR8UZSyxMYqMSBB6gbttE=;
 b=FJ2BlT0rF70x57rBI0PpRb6WBmVfv7X9dFcTkv28WHeR1GPJjFr4YOijr0tB2npE7W
 areweaK/Lnwsg3gH51FBHIlFQbQKE+t70yDgiiokBf0+1Q21XMeRKSVo04N6XOeU5o3F
 C8zMc0i2Zm1QiI7khBj29TVEYPUe/LR94O40eOKkRg50usQbk/7HUiywqxfRBXD2IjIB
 WBBijysvQ7K80d96RECfCr7aHuHMo5NzRM7fAeLiftoXyhOiWInzedIc0rBSeCqnZsqT
 z7XoFK8gKIeFQ7EaF+/A16E+foxmPwceaLS9Ntmj631ZLAzoOOvEPccRXMT+B9y4cSmF
 VCnw==
X-Gm-Message-State: AOAM531FHgpkrf05dyh98CwbQlANJ+XtB78XYgS5bj9itxWnziKXaNwm
 XkdS4lSqxyxWXrIcu7V3SJ8T/JDmd7befw==
X-Google-Smtp-Source: ABdhPJxlU1f71YOjs85qnXGOtlzfBZAM8RMEFBlUK/+00MqQ/uWRmdfFhU9sCrQ7iLLHUZlezcxA2w==
X-Received: by 2002:a05:6a00:88b:b029:19c:780e:1cd with SMTP id
 q11-20020a056a00088bb029019c780e01cdmr18209484pfj.64.1608616160620; 
 Mon, 21 Dec 2020 21:49:20 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id t22sm18201068pgm.18.2020.12.21.21.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 21:49:20 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Tue, 22 Dec 2020 13:48:38 +0800
Message-Id: <20201222054841.736529-2-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222054841.736529-1-gengcixi@gmail.com>
References: <20201222054841.736529-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] delete_module: add gitignore file
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

When build ltp, there have generate some module files in delete_module,
add these files into .gitignore
Untracked files:
   (Use "git add <file>..." to include the content to be submitted)
	testcases/kernel/syscalls/delete_module/.built-in.a.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod.ko.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod.mod.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod.mod.o.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod.o.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod_dep.ko.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod_dep.mod.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod_dep.mod.o.cmd
	testcases/kernel/syscalls/delete_module/.dummy_del_mod_dep.o.cmd
	testcases/kernel/syscalls/delete_module/Module.symvers
	testcases/kernel/syscalls/delete_module/dummy_del_mod.mod.c
	testcases/kernel/syscalls/delete_module/dummy_del_mod_dep.mod.c
	testcases/kernel/syscalls/delete_module/modules.order

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 testcases/kernel/syscalls/delete_module/.gitignore | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/delete_module/.gitignore b/testcases/kernel/syscalls/delete_module/.gitignore
index 8ffd4256e..1a774a6d5 100644
--- a/testcases/kernel/syscalls/delete_module/.gitignore
+++ b/testcases/kernel/syscalls/delete_module/.gitignore
@@ -1,5 +1,12 @@
 /delete_module01
 /delete_module02
 /delete_module03
-/dummy_del_mod.ko
-/dummy_del_mod_dep.ko
+/*.ko
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
