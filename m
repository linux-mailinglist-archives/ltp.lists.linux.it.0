Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJD/ELzecmmNqgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 03:36:44 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D916FB3F
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 03:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769135803; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=UsXOSV677+pGKwT4VxQ+CBhT69punaLiBdAnn0msTcI=;
 b=P4gFMkPiCXduUiegB6afyI6jhP7IZ5iKmKgw9RyWeEQDVM/zZ0MDOUN/m885eMxyDaxhG
 qiaAM5zeYTw+YeMbs5Ete3nO9wpzuJxG0shHmM0dBQ75Yd3yWZi4BojDFOtICuF9+M6D2CS
 SsSd1qHINZrg7URHpg2A/1Uediv7BnE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33A1E3CB054
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 03:36:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5BEC3C4C70
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 03:36:40 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 64E48600070
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 03:36:38 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so12395715e9.0
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 18:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769135797; x=1769740597; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73BOC1yk2bEIqtkgkjJewvWQwrXTEMoH15DfZgdalic=;
 b=djCgpYMfxJS5k/bWXviZQu98OJKO7wR1UHKi0Y09LdvJoCwrw3AbVgptgcNStMAGU+
 MkXWRuljm+p9GJLA/GU1xrvwjpOhcXOD8Xqo65jGS6KloITJZvOEkCrGZqIdYhNon01K
 CvTnNYcaMJMaVMgHmnybJq1vocBoordGWPzhc3fqWAdX38PmdUd64GWUicz53QFeYvIe
 J/c9k8iis1ASZBQKTC7SogNr1xtX0tca9+QcRvdnlMwALFj9Z4UArEQaP9frD22BCbPi
 Aayan9B56prP0AwEAnfM0nC2LKxZPcxY8IT440mB5yvClbR2OEIc329bk1DxYxAgcCsi
 WjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769135797; x=1769740597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=73BOC1yk2bEIqtkgkjJewvWQwrXTEMoH15DfZgdalic=;
 b=sV8nUUfm8vh9LZowLi9gk/YNH8fNsdrNQNmheGOs5I+ONwbkZiZC2tCghPOq9odhXv
 Vr6XpL6d8IlT9UAn7aq1QajO8wIqE5Wo68lG88NzwLn9ABbYW80ehSf37jPr++6JwUNM
 R2M9XIg24KRgSeVE1he/x+eDvUv7fUjGFdk93r6OdgmH7a+3uztmPDLXcpZF481bVJ93
 b3vbewE/QlnCzqIiyH7wWqJrJy2QBC9MvVR0rGUUgxY5khqCPZOD3riPkuvTTduRFR2Y
 SwDvzFCXKLIXL7Z2Li/Sl27g7AHpD49yjUD7oQIDddlVA5Pm+4/qaC1Kx07itYm3HoSQ
 U/xQ==
X-Gm-Message-State: AOJu0Yw0g/wNJbIz6uc50FO234VQpwP46Bl4dVQiV+KCCbjl/FkyTlWv
 oXHJV4bEpsgdFaCugsWRKXiPb4+Y9vKt96ytFHpCZClJCwkYuIMauJ7OjfGH0LUojEttjHb3Y9b
 iK7Q=
X-Gm-Gg: AZuq6aJvTyB1bPJ+8I+NBbGdOjYO8O24vtTr1CLa9HjLrGL/rh/d0XwHE6AOAt4U7Gd
 NLVudSTXr4L12Ta59zkFfLqc1ew4mUecLio+e6A0k2cIp/y2FYSFiAC0zeV50t8sdMc6vDJW/Nu
 Mk89fpvLLjfQVQXqtzKJGk422MDNC8hjRHkQXTAvq7J6As18lt361zQnmateTASLO0yFNxnJMNB
 iNUPuFnajGrM+SQuFBrqRaVcQtgi69Al7i7aUdlxx2ARBSGLlOLEVQkpOtdbZ9PEInYOeCvM/qg
 wI6yIXAcnKvuScX9/tnngPqtViHi+c0znmstJnBoEwqrR1d/JDYCAYuk2kka4k3DG/DiQF2CRCI
 Ul3xE46IM8k8VWlTWVlFJcD9y/30mmWgceDqiXQxZp2/tm10pZ/h6ne33WB3chwLhJdnFLVF/tL
 E=
X-Received: by 2002:a05:600c:3b18:b0:46e:49fb:4776 with SMTP id
 5b1f17b1804b1-4804c94c4c4mr22072205e9.11.1769135797557; 
 Thu, 22 Jan 2026 18:36:37 -0800 (PST)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4804daf23f4sm8749935e9.1.2026.01.22.18.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 18:36:37 -0800 (PST)
To: ltp@lists.linux.it
Date: Fri, 23 Jan 2026 02:36:25 +0000
Message-ID: <20260123023635.29692-1-wegao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113015242.799-1-wegao@suse.com>
References: <20251113015242.799-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 0/3] tst_filesystems01.c: Add test for .filesystems
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:replyto,lists.linux.it:dkim]
X-Rspamd-Queue-Id: B9D916FB3F
X-Rspamd-Action: no action

v4->v5:
- Adjust 'char*[]' to new 'struct tst_cmd[]' since commit 39a284442

v3->v4:
- Use #define for 128 and 10240
- Change commit subject with ci prefix if ci related changed
- Separate change which unrelated 

Wei Gao (3):
  tst_filesystems01.c: Add test for .filesystems
  ci: Add mount operation for busybox
  ci: Add e2fsprogs package for CI test

 ci/alpine.sh                                |   1 +
 ci/debian.sh                                |   1 +
 ci/fedora.sh                                |   1 +
 ci/tumbleweed.sh                            |   1 +
 lib/newlib_tests/runtest.sh                 |   1 +
 lib/newlib_tests/shell/tst_format_device.sh |   2 +-
 lib/newlib_tests/tst_filesystems01.c        | 108 ++++++++++++++++++++
 7 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 lib/newlib_tests/tst_filesystems01.c

-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
