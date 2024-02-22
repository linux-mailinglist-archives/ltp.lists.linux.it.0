Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686F85EFB2
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 04:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1708571458; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=OFCRNtGdWDVXshkgBcqP6by4fU79B8MPBpj6TkqNLg0=;
 b=Zi4kxIB27VBHH95XIOKJosg5rNhisu2ED+WjFXCpQ9fFzGV5l9H+KRY2aGnU/2PO6glr7
 2LTr7JHV/cEixon8fxnA1ILarilO29ET3a3eScAM0i5vkqMTKG6Iq+J0ZwCYb5t3c4ij2iW
 /0Ux3u1jSCp658UK+E7aT7L8mUSLEFM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23BFE3D11B4
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 04:10:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 834CF3D11B2
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 04:10:42 +0100 (CET)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B66491405144
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 04:10:41 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d243797703so43588181fa.3
 for <ltp@lists.linux.it>; Wed, 21 Feb 2024 19:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1708571441; x=1709176241; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoAJBPBESdsToOqelX8CGLcNAsrX4gzyK3mogZNWDfY=;
 b=C8KHzY5D1M+K/fiGFy5rUqCmQMDnR3aYMGwEn54Tm58J1jBYUPIVRDQaRn26Ob9UJ5
 GgO3FgIjH1itNIasQgCaFpqGQIXa3xuC34OTcSCkNiSTnWZD/2VbuNDgZazSOYBdxc/M
 Kx5jNPeQL2tdet0Ylvp6xYdlNRqjXCaT9BYu89LRNJl5nHae02lawbBSsbu5wHMyAxlt
 iMJ00nFIo60/idx7ALyDUZaYM9duOmPbS52a8KpCRRbeV1LRNmQgCWrn1J9ThVh1TeGz
 6D+l1BrTeyWzTaQIwPdmfAKJwe7mta5Tx5cVBG/yQUiLythiF5S1gvS2jzv7+xhu1Gsl
 HCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708571441; x=1709176241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MoAJBPBESdsToOqelX8CGLcNAsrX4gzyK3mogZNWDfY=;
 b=PPoi/IiA1a3VT5q1rnMw8aeC7jEbfgFpZOngGIZwRtvTZX92NG4wHypfFNN/UHWie/
 TEYQtBmVTo+6tAPd05m5z19MbKgiMJP8qAXAW6fnE9AqQym8jl97a/86fW9pQJm+JYuh
 umCdjlkkIFHZduX0qMHJ00hhavgkS1pDRDAJOz5uiVB1sWj3vwlEyhWSvMquClPfCSHc
 qsxSAoAHutOFRTh8QIDDtHpo+ROuwv3mPW0NC4jG/JOPOFGugZI8aNQRbqaz3H1LDHqQ
 NOCPgHMQd5k68ry2gdORMl93cLKzIsEvCnF5HeYTEBbun/NhE8SjDUQBQ3UXFSwUdlpN
 M/Pg==
X-Gm-Message-State: AOJu0YzXZacHMCvImVnhYFFHo7LYi4tt6ExQS71S1dqLKPuwAgRMuedp
 DHm4GkBfdw6LYHMNg77d/T36OSImnj17TbBIoj0I2+0XhTHa5wZ7yd0r7wZXA9RkY2TwZITIE9M
 odg==
X-Google-Smtp-Source: AGHT+IHe5bBKoOgm//nwAOvYHakNeDOZiR236a3VwfOLRxDwrM8uQFpqla4NWqIzQJI96/5hJsx6wA==
X-Received: by 2002:a05:651c:1043:b0:2d2:329f:7a7e with SMTP id
 x3-20020a05651c104300b002d2329f7a7emr8799661ljm.6.1708571440864; 
 Wed, 21 Feb 2024 19:10:40 -0800 (PST)
Received: from localhost ([223.72.38.233]) by smtp.gmail.com with ESMTPSA id
 fn16-20020a056a002fd000b006e3dfb2ef4esm8358184pfb.95.2024.02.21.19.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 19:10:40 -0800 (PST)
To: ltp@lists.linux.it
Date: Wed, 21 Feb 2024 22:10:17 -0500
Message-Id: <20240222031018.12281-2-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222031018.12281-1-wegao@suse.com>
References: <20240221084256.32661-1-wegao@suse.com>
 <20240222031018.12281-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 1/2] cgroup_core01.c: Set system default umaks to 0
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When system's default umask is 0077, following error will popup:
cgroup_core01.c:50: TBROK: openat(21</sys/fs/cgroup/memory/ltp/test-3519/child_b>, 'tasks', 2, 0): EACCES (13)

The reason is default user will create directory without permission for group and other if umask(0077), then error happen
if case switch to nobody user.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/controllers/cgroup/cgroup_core01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/controllers/cgroup/cgroup_core01.c b/testcases/kernel/controllers/cgroup/cgroup_core01.c
index 2e695deed..ad08c74a9 100644
--- a/testcases/kernel/controllers/cgroup/cgroup_core01.c
+++ b/testcases/kernel/controllers/cgroup/cgroup_core01.c
@@ -76,6 +76,8 @@ static void setup(void)
 {
 	struct passwd *pw;
 
+	umask(0);
+
 	pw = SAFE_GETPWNAM("nobody");
 	nobody_uid = pw->pw_uid;
 	save_uid = geteuid();
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
