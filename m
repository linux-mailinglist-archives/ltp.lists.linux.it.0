Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHTgLwXfcmntqwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 03:37:57 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 772436FB82
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 03:37:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769135877; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=pvRSdI82152LbxJNrMcreR7vgHbFHqb4DGYz4e2/QnM=;
 b=OIu9OyDGzj8vaujg8NBr16USZHp7ZsP3QnuhwqD4u+1HBgMUh2SjlPH+CdAbTheFwGQAn
 C6925SBQKTX3IEgu+xJnKC8iwvOeSce8jiBMT7WUiqe/O8u9WKEH9J3yHT6pS0bQ100GVUm
 yqwk17uuFqDQlluD+y+hnBUNYrZPfAA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F8473CB3C9
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 03:37:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F1F13CB3C9
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 03:36:48 +0100 (CET)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C8F071000D8D
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 03:36:47 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee974e230so15335225e9.2
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 18:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769135807; x=1769740607; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WVLBvShyQH+R/ieiXJSz8YtAtMqO5uYTG+Cpt55leA=;
 b=b1FITIayypVqXIey165xk7s7AC7IUjPe9SgScQjUwh8FvlbPc7gU3rC1+aNraDZ3UI
 k/2vLjNDtyc0kNd09LwCmqWhs6gSWPYtIS4Nagrro4TjZAwECvHDm9ydzN9EpGFrJ6iX
 KTJryOxd0NCjpPPuDD3Klgst/tPuP3h2hTkscSfPzB9yO/ZFaO7nxKRYEQkBm3sTW4A2
 sI1Ri/pgOmN9+qHuTRk7x1ao3PbOsUll/5KCXcCE6paWjKuCvVf0BAUHSwEmR0thL0/8
 77HoVZLUMlgxOV28m1pkrDwRlwG659CIeFQwZsqg/f1PuuryXGIyAXADJQ4V3sfrosR7
 o7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769135807; x=1769740607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+WVLBvShyQH+R/ieiXJSz8YtAtMqO5uYTG+Cpt55leA=;
 b=aXS0aD7uMz+hl7RCQO/m6cmhoSznaLCPI8IyzHhbdIAY1SG4UMcd2bx/Lc4LjmHgQb
 2YLLddOdaXq6uwRqaUiag06hbyxX1WhEanqe+nmkThhQBGoUF0P7E7RSlDFh0/CT+s9G
 vMzYclvjnugNljkigf5NB0H5FLz8qYmSZEoh12wmum9RjXzKNF33WCN7o+9wBShTKqF0
 Kjn5GlIJxx0SnzSh+U1cRZeiEKsGUdY8nL0FYbh+i9/tlA4+J6LA/aLO0dn9IsQ64NpM
 M3+DT5UxpbijQlbiQPFJC28/L/gcC/hKrx1rHfcg/HomcinGFdBr5V0sxvKQ4LzgG9Kh
 YLGg==
X-Gm-Message-State: AOJu0YxsgRJazmpGaAzFp4TWZdumLTVcA0pPqonwh/eIgEPNFSdI7tFd
 pvmfWlwrcagXt/kmx/63OBn/tnkUo0WZ7cF56QvrgLqIC0/9C/C+8AWx0KzAslykUovUvAyyfv6
 GWyg=
X-Gm-Gg: AZuq6aL8ix0VICuTfQPhoB6eh3Nie0QE0V4nUo9m+O8G4wWCe97PsNK4eQYVoSahYK8
 f66DkxmUzVZ176C1aURCDA/mF7kIm7mWs20ZBNc8gYp//WhRUKYraSqfGdKW38j3fW0KDvQbbeS
 xbodoTqndcLHkFz40WPg1bePqjkTVzqwckL348w5MOb+CIypW3Ju1ULV+Gl9YAsGwvKjYhKb3Ux
 codvH9Dud1636HpCGC7i2yrktsqs6IuXIYRlOpwlu2EigP4s0J3E98UGa1IoiP0nLTyX91AXXHC
 w6BiqhMxXtVxDoC0RGhXSvTay6a2ebXxb+I05YAKSaYeC5d6iCzbJIY8CsbXA8SFhwrVTgt5dsa
 iGprnkaFXX3dGa77Ao0KPH9/ygTM3UffgkFlFPqcbYockde+6+A1UbXvlS0HwoCvx8Cl8nPRZuZ
 s=
X-Received: by 2002:a05:600c:46c9:b0:480:4a90:1b00 with SMTP id
 5b1f17b1804b1-4804c9aeb15mr24877715e9.20.1769135807007; 
 Thu, 22 Jan 2026 18:36:47 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4804dbd9436sm7783605e9.18.2026.01.22.18.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 18:36:46 -0800 (PST)
To: ltp@lists.linux.it
Date: Fri, 23 Jan 2026 02:36:28 +0000
Message-ID: <20260123023635.29692-4-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123023635.29692-1-wegao@suse.com>
References: <20251113015242.799-1-wegao@suse.com>
 <20260123023635.29692-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 3/3] ci: Add e2fsprogs package for CI test
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:email,suse.com:replyto,suse.com:email,suse.com:mid,picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 772436FB82
X-Rspamd-Action: no action

We should add e2fsprogs to ci env otherwise test cases
which need tune2fs/dumpe2fs in ci will be skipped.

For example following message:
2025-09-24T09:00:56.9304198Z tst_cmd.c:268: TCONF: Couldn't find 'tune2fs' in $PATH

Signed-off-by: Wei Gao <wegao@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Li Wang <liwang@redhat.com>
---
 ci/alpine.sh     | 1 +
 ci/debian.sh     | 1 +
 ci/fedora.sh     | 1 +
 ci/tumbleweed.sh | 1 +
 4 files changed, 4 insertions(+)

diff --git a/ci/alpine.sh b/ci/alpine.sh
index 254f4aaec..f3a1bf528 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -25,6 +25,7 @@ apk add \
 	musl-dev \
 	numactl-dev \
 	openssl-dev \
+	e2fsprogs-extra \
 	pkgconfig
 
 cat /etc/os-release
diff --git a/ci/debian.sh b/ci/debian.sh
index 0445c92ec..767c9b985 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -33,6 +33,7 @@ pkg_minimal="
 	linux-libc-dev
 	lsb-release
 	pkg-config
+	e2fsprogs
 "
 
 pkg_nonessential="
diff --git a/ci/fedora.sh b/ci/fedora.sh
index f57806ebf..f4482a1da 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -26,6 +26,7 @@ $yum \
 	libtirpc \
 	libtirpc-devel \
 	pkg-config \
+	e2fsprogs \
 	redhat-lsb-core
 
 # CentOS 8 fixes
diff --git a/ci/tumbleweed.sh b/ci/tumbleweed.sh
index 8a30b02c2..8f23229df 100755
--- a/ci/tumbleweed.sh
+++ b/ci/tumbleweed.sh
@@ -30,6 +30,7 @@ while [ $i != 0 ]; do
 		libtirpc-devel \
 		linux-glibc-devel \
 		lsb-release \
+		e2fsprogs \
 		pkg-config
 
 	ret=$?
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
