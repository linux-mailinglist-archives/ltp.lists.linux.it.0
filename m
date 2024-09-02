Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F3967DE9
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2024 04:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725244838; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=cguPovQOjl2mP1E5uikogaYgxNrxivoFDLlDG18QJhc=;
 b=N+i1vaZVUOs+W6gWf87o3+OWs2ER7CdD69sUmiq9aeltUnNHQAI7WjT9w8pj2d0fY87Ao
 kaZO1IALFRK41OHIKgt5txLPSZe6a1zYy2Bc1V4lPHv6XIbOjuH14JnHAmRpnG9izOlnIhn
 f2yrrfi4whYt76YhjsLH2OTJr5iBUZU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C15633CC7C1
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2024 04:40:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83C3E3CC7C1
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 04:40:26 +0200 (CEST)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8118F2009F0
 for <ltp@lists.linux.it>; Mon,  2 Sep 2024 04:40:25 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8683dc3b17so225599066b.3
 for <ltp@lists.linux.it>; Sun, 01 Sep 2024 19:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725244824; x=1725849624; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RXUxIfyQ1vkAGa6Pbgu01Zezc1+kexQIScOy95cen8=;
 b=Df16bOBqBJYjIJCe26UZaq2LWXW2x8KXDrmpRk93TVQ0KH269OzYGSp6372056SADF
 KE42Lf3DWZltUvkcxVIrO/6hbTAvfCOu+7x0x+awx56drHBY/dvISOhbPcjJJ7ZRWBgi
 Y5HiZ0XF9sDn2Adt1eltpn+Wx6s1xeU6em85ONrIGXVERyW/PiSif7cx62QIvaDjjvJ8
 sFbNAoXJ2Mlflw2mWIRpYthIaqiuUe6MLeve3ULfqb+RxW9Sghfrkos2WHaUpjohGWMC
 NIgGBLDcPGkYQlzejWmCd0s+/gjmuaEQIZ9GrWkF5jJMLOYfCL9fE3FGW0a8cPjTydFN
 iX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725244824; x=1725849624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6RXUxIfyQ1vkAGa6Pbgu01Zezc1+kexQIScOy95cen8=;
 b=cyARrpsdeFeqA8nPGHFeplyzqVD2dKi+RR4pZHK3cWBpcOVItV/nqoLwqUpbtcz6bk
 nyGLI3eKzOUhEBf9w/Y89ft8RvzQr5K0iSUp2PqARbJ1Uesz4mbd+NSxna/hLM/NpnL4
 TneZ4/ZJ9HCDsUs0KFsP18F2uW8YcjsK/8IUzcUIBuwUAWXzcupqjvWer3sjQCmYEonO
 rAOsEBOpS9sx/9uTJrtZ5CZOB/tyR6CE9tiFZDEtUfrZsAwZL2q+ncu+VkEAkPbEpsVB
 nw26Ew20tnaAPNdGM0GxzNtwGXkbb4OyhzSiTkHWMwPoJVWTQMxIi7QoeAAHPsLYQGZG
 FA4w==
X-Gm-Message-State: AOJu0YxYO0zV7S/fs9BdCoJjAczrDfNZMwJx5mGYPJRCkI+/MZ51ylD5
 OjIsnsAi5TnES7xPYQU9UVIDH9d299G4o7+2GjMJ44ouYy027LSjt9AUmjB9ao3FCPOuPa38JN0
 =
X-Google-Smtp-Source: AGHT+IEVDgrQ04coV6dI+EdZGIRlf0osD2Xhv36zw2XBUgZi0VJBgWcTKcLg6lKwsDWvfbOL77/H2w==
X-Received: by 2002:a05:6402:d08:b0:5c2:1803:ac65 with SMTP id
 4fb4d7f45d1cf-5c21ed54d08mr11558427a12.21.1725244824203; 
 Sun, 01 Sep 2024 19:40:24 -0700 (PDT)
Received: from localhost ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922710csm497479066b.223.2024.09.01.19.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 19:40:23 -0700 (PDT)
To: ltp@lists.linux.it
Date: Sun,  1 Sep 2024 22:40:17 -0400
Message-Id: <20240902024017.6404-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240830095758.20018-1-wegao@suse.com>
References: <20240830095758.20018-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] mpls01.sh: Add --allow-unsupported for modprobe
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

In sle-micro we encounter following error when do modprobe:
root# modprobe mpls_router
modprobe: ERROR: module 'mpls_router' is unsupported
modprobe: ERROR: Use --allow-unsupported or set allow_unsupported_modules 1 in
modprobe: ERROR: /etc/modprobe.d/10-unsupported-modules.conf
modprobe: ERROR: could not insert 'mpls_router': Operation not permitted

Signed-off-by: Wei Gao <wegao@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/mpls/mpls01.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/network/mpls/mpls01.sh b/testcases/network/mpls/mpls01.sh
index 196b5b2f9..957f9d153 100755
--- a/testcases/network/mpls/mpls01.sh
+++ b/testcases/network/mpls/mpls01.sh
@@ -21,7 +21,11 @@ cleanup()
 
 setup()
 {
-	ROD modprobe mpls_router
+	if grep -q suse /etc/os-release; then
+		ROD modprobe --allow-unsupported mpls_router
+	else
+		ROD modprobe mpls_router
+	fi
 }
 
 test1()
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
