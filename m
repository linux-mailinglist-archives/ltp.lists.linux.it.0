Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4E2D2931
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:48:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CDC03C58A9
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:48:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 535F23C0752
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:48:28 +0100 (CET)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8D7C51A001E2
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:48:28 +0100 (CET)
Received: by mail-pg1-x544.google.com with SMTP id m9so11855489pgb.4
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fP5UFxrTwcosLSJj2BWsopXIyIJqDJocNARtaJ05PoY=;
 b=IjheK2qcHiWe85xwUUG9BnldPAEDsE+z/oXvAkCJoqehHQo7DzHLG5l75cDRBUJNYY
 koOi1jjeQazchCZKQLMkmJZGojwLEhOQB96nWVokjB8kS9PgRqPNVmg+bicxaMDMOJ8v
 PwjAKWqx2mxMNFoDlkVNinlo9a16exUiNlPx8DzhrdOfn7AtEHsssgXcrJshBxlBvswx
 NckxsTMWyXWklxjNYn5vFy8IljwOtTes+2iy2HZjjrqHsJkJwN/QZysXu3wJz3fSEbQq
 cUBmZ4lvQRbJtQAJTUZskcP2cR/d7PKqtS9fooeaAVQJ2G45Tev/CQuRr1R3+kKPK7QZ
 LQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fP5UFxrTwcosLSJj2BWsopXIyIJqDJocNARtaJ05PoY=;
 b=DDM/zX78DZJ1WOlGXck5DjlgyVe3rGXC9Jt0IyB9eiiSlXi2f6N+FFTaIcq4Ajpe+2
 hO0IPjgk2ibYN3veitL9QGbW/m7os8BZTZ7VrgNTU5IwaUl3k3dU8IfpTfErU71Ine3j
 Gz6s9VkyGR8hPdl7VOZvMEj2e5pwGWhS4FEo+UlHTZqP3VXxgg/heHYME+HOBYyg4Z9H
 41L5ob2kC2s62/bvQL6Qv9f0Wv27WYcf63QBBi10X2pR2nuDQgPV1k2ST+bSQqOJwEad
 2THXZoptXy+nG2CYfa0MVIHP9V4nF/06Bjdy4g1X5jOWtcU54Ct8IuMqpWBUtJ0T+Z4d
 +Pfw==
X-Gm-Message-State: AOAM531w8Ut7gCddJUQygqx0umRPJCwsuEe1qfO4Vt52TLGSCRduaf25
 rsk0zt1k0UFoGy/H/+INq3TFbDjt5ICUdg==
X-Google-Smtp-Source: ABdhPJw6w2AJZho4PYPt4Z4ygI+C/HAgCtbeEGlaQR/Ymm6kr1tzG6H2cPEzucRlWnI8fa8pFSIbQw==
X-Received: by 2002:a65:5ac4:: with SMTP id d4mr13210892pgt.50.1607424506661; 
 Tue, 08 Dec 2020 02:48:26 -0800 (PST)
Received: from localhost ([122.172.136.109])
 by smtp.gmail.com with ESMTPSA id y19sm17934535pfp.211.2020.12.08.02.48.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 02:48:25 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Dec 2020 16:18:19 +0530
Message-Id: <dd3f6d5df505895a30dbcefe5336f95592816920.1607424494.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Update .gitignore for .mod files
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
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Following files are getting built currently and are showing up in git
status, this ignores them from git commands.

testcases/commands/insmod/ltp_insmod01.mod
testcases/commands/lsmod/ltp_lsmod01.mod
testcases/kernel/device-drivers/acpi/ltp_acpi_cmds.mod
testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.mod
testcases/kernel/device-drivers/uaccess/ltp_uaccess.mod
testcases/kernel/firmware/fw_load_kernel/ltp_fw_load.mod
testcases/kernel/syscalls/delete_module/dummy_del_mod.mod
testcases/kernel/syscalls/delete_module/dummy_del_mod_dep.mod

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 86d8190a3a65..769d4be8873e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -11,6 +11,7 @@ core
 lib*.a
 .cache.mk
 *.dwo
+*.mod
 
 /aclocal.m4
 autom4te.cache
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
