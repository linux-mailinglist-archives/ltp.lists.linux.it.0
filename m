Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMc/AdhHjGkHkgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 10:11:52 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FF122947
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 10:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770801111; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=/49bzQWSMIQqUJC86zcc37F0U2E9vxNIxE0f83L5V+I=;
 b=XjIftd03GBUBH7p1bCcGw/WgtzFlBgvy1C3DSWf9KBl6Dwk/6/C0Sy+22a+kB2mDviSK3
 FIZrfx6ZAQYDgNLskv1KPRXSXGHGrAvRTyY5c1HUxPYjqcamcxa7CDG/BxlYpvoxqg3bJ9p
 3yW7aDyHbfvmJ8k1eN1Ezx7UOU4seBE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A9A43CCDFE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 10:11:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75A4D3CC237
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 10:11:48 +0100 (CET)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFDFF10006CF
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 10:11:47 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-480706554beso53739725e9.1
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770801107; x=1771405907; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNx0SRRF4p19f0pl2fNt6w9bN/NVZPlmwCFOtpuyvWU=;
 b=OswJXUFL3b7D9t+TkHDlSiyClCvLSqBm6yOWaVehodTw5qBh6y2VBX5Z234T8JG9vc
 YacawrkBo8/tc0x8egjjQPN9GSNFSuLxWNFpH+Invbuv0oYEepONTHP4KWDyx50CAi1f
 YQD+GFj5dn3dBh62ryqVzbgll6XCNVIaE2gVVRKkT72ujeDX5bSGvKKU2BV71BWAkt+i
 VK2bvfnJPWi5Q0HEo6jqfMjZl2MphrLxswYtOLnZSSE071Cb8zoz0eWNqczyay5zCJQt
 fSPhVeoRrZSLK/2yG3IEBdlm7PfNhhJ7vBNt9resP7vnl6kn70Vtn4whSUGLdxkTiQ+g
 pwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770801107; x=1771405907;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jNx0SRRF4p19f0pl2fNt6w9bN/NVZPlmwCFOtpuyvWU=;
 b=rotkxx4J94L7qTbpLsk3l6gZh0tG44AD4W9xFQQKvpfzHMW1yaR+qLW2w7LIAWPOhc
 WBP1hP1hxQivllpp3pUI15nfxNbVUyUkvoImaFKNPy0GlRif+ldP4ADDFxH9HNzYeo7I
 vNwBLTcxpdA+q5sd6RP7kMtV9xJA0SHvMwlQ4N3ztcvkuPgrT5nnmO+bbGDDC7Wzu9A6
 i5hUMXQsqVpVDp6wpdBieSWNxP7BhbEa1ZzFwkLWUhfdXLn6QPXajFqr0KlFbYr6GjnP
 hKu3PvYESMjkc4v0yayZhBUwbrlS4fLGieR9/THG9FTcvyRGlawi22kJvEk6cikJrtAU
 A96A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN2EtuySothul1Wz01bUSgfZ/AFOi4cZm9yb9HvUzpR6lsXFjErUd4tNgZsLkNdTxEIpc=@lists.linux.it
X-Gm-Message-State: AOJu0YxIB14cXDxXkf34OBGhFkWPY0Hpn4IEsvGTkAZV7iOfRj/RLt38
 hmrxz5yxWPrk+31O5efECwsu5eWsROZyl0O640z2v+/PLc2GObjtTya1htWKbX+FXAg=
X-Gm-Gg: AZuq6aJ5JRIyXS3xQ+7qLn4CqXzvyqVeUL49f0keKahKwf/qOjsj9av6GMCl91w3yfl
 tsLkYvmRGkFMKS9WlsOHENzJKQKYtlOhuvA5FR02vv/Goj49iLdO0LebmV1ehivotzFgK0LzmSV
 I9oTFr0dFawQ+Z3LVYYfj12V3lRfXOUpB17bCc+4wmS40RoXqMUVbnmZabkoveNJ6SX0U5cSSeW
 XAQ5MalqcxuByEMokDqMBrh6GmxxHI1ED7NQ9uaOV23qxagfwxnX9rpcKFFwTA+D2Mcy2sPsG1p
 9GCKFubuhCJ6cM+lKKH9NjLHoEHRNbydYmPizk9PUvRaBlj2rD8NdtIF1hduWdPUm9qdgF3MnlS
 uFSF6XkXWO7kOiXQYDPKxHQ1XxECvx6VGKFFlefcQWODfKPNM/UiTdKC6OZlpmvu7WmVbvYOdrm
 RKtOqmYfvjzeuoRrtYQT2sca+s40VdkGZI2bhp/yU7T7AMBvGKUnaGcSz7JdsRzBVQzPeEdrFAd
 dDtti3VlnJ0o4Bi5aM=
X-Received: by 2002:a05:600d:4448:10b0:483:612d:7a5c with SMTP id
 5b1f17b1804b1-483612d7d04mr4785625e9.25.1770801107216; 
 Wed, 11 Feb 2026 01:11:47 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba506cesm18496605e9.6.2026.02.11.01.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 01:11:46 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 10:11:46 +0100
Message-Id: <DGC0LPS5JBO5.DEZE7CY4YTHU@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260207170632.2795-1-always.starving0@gmail.com>
In-Reply-To: <20260207170632.2795-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] inotify: modernize with SAFE_ wrappers and fix
 minor style issues
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.it];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,suse.com:replyto]
X-Rspamd-Queue-Id: A15FF122947
X-Rspamd-Action: no action

Hi!

> +	len = SAFE_READ(0, fd_notify, event_buf, EVENT_BUF_LEN);

is there a reason why you set `len_strict` to zero in the SAFE_READ()
macro?

Kind regards,
-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
