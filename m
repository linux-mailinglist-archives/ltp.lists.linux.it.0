Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAuRAvnzlmndrQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:28:57 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7815E471
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771500536; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=CJ4+lzwq5c/ssBkgxahx9FnLsRfMBhWZrFarlqIHLn8=;
 b=VSyRi+9wfmYbeTnzIvM5iZcgWcA0LFbg0PQW++eunTnMMJOkwV6sj88oH0Bj5HF3/Yb1Z
 BLaxlr7+dj7w7ouz9sz4WvK6ODiQT5zVlim51tgzETVZp/6TyBPHN2dfpCQ0twx9GImM/1C
 2c8kOrrP70vU3ZNTcpzg7+iyTWIK2fI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A06A3CA4ED
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:28:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BDE53CA4ED
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:28:42 +0100 (CET)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8C5F82009C8
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:28:39 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4376de3f128so548246f8f.0
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 03:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771500519; x=1772105319; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smOwen8WG8OIDIG8ziqE2FZtkqDcxMsW1nIro6FJiAY=;
 b=VyLRBIytEO+cyDY8j+7J9/2WI0gXGCiQTzZb64gKxGzxHamNtwyxoJU9m9lcbT1g5q
 slLb3UM63bihcKgmMaXmKfXYwaHvZwiHHKLNrzwb2JxebaVmDMyNftFuhnL/gAX99ugl
 +vRhSY/n5K1kApICRkYsJaS4qZiOtGcuR1mZfCwLBud7zP1FsNH/jJniVMtYuFR7KD+z
 G8rqxpMg2hNHDb5miuv80Hw/j88OatYJ96JYL+A+B5xr8V+0TCtamPzw7lc87gFn2Zr4
 2Yj02jpy53Qg6biHaDfgavsK+Sop2nsKtruEE5SPLpzGsRFzP3nJFKnGDuUR581K7XWM
 ML/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771500519; x=1772105319;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=smOwen8WG8OIDIG8ziqE2FZtkqDcxMsW1nIro6FJiAY=;
 b=dkos9X4eF532i1oG9R6/SDEpiY+S9kwOD6w+joFO07/6W2lp8SWC4E0ZJY4VYaLkpx
 r+9xNnND+/wb/lhElkzfoiftcfR9IBvOqJc7FL58SWTfkm8VEOQL5p4K6e6H1QAfG1gx
 iMVIbWhmMmJLAG8otV49Oit3WeMjLwR/HP6hkdiNb3pqelmTvt+hHoEvsZaG3ERI0kVy
 UFdxKduoU3m6ehRNb/P5foGGNzEAzvshRWq8YX3iVcZofol3W/p9CTVHdpcRz4RXpBMw
 Mbb/eCw2MuRf545Snv6PjnDZVUD5F+Ks3T/ghofwG0+uHU2CrCGoV/YC7DVTYxpFA0Za
 7mMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX79qkx1qeN8FwUBzpq2LNn7z8TFCR8B62KqtwVs0domVyYdhAbzKIpFEtLvgR4qACj+ds=@lists.linux.it
X-Gm-Message-State: AOJu0Yxr6sIxcxQW+Jq0N2vAfw6htw0u9Fo6zl2TjDGR7lCzpJvUP5di
 CznZgvQv0qWjrobyl9F2t+NyCoFhsQzbi0mZZpGqWabPBo9g+XlP6Fn7mlqqinP5Gn4=
X-Gm-Gg: AZuq6aLp21d0uKSlrphSFcQazO5D1cA1MqlMI/hf5LCWGaAVKuPmhxERSB/Tap2o4Dp
 u+FQqQ0neQpgK1aKII+xaz/TmDHBivz6GUhn1N1mdwradt6i8TKPFCylpmCVKPP5gaj46nqopzY
 c2kfUVBvh4nR0Ltv/SAebHtSgMigf0UbesWxyDWWgIR+MZRq1tcu/rUyJLs6FXxaR4DyBOznvua
 jy0JCyMyazASubPsuyxPdxaO7QXRHByvzciICxvPM9908hMkYfVqLtDn994grW7MNhNb3Hlw11K
 K+nIU4oKHIXDdD09ccse8IzJChAx9MBMek75LSa7T63iSlsurTjZNyzLps/Jf7Y8bNLFGh9i7XU
 x3TA2hiuL5e0na+6nCiH5aY0qTl7ZI8AKbjdDwlAm+Ysm4jk3ERm84SZTGA3iWzsN9zY2DiuNzU
 DuFzRyUqlGWPL675MScD2rNWar
X-Received: by 2002:a05:600d:6409:20b0:483:96d8:9f75 with SMTP id
 5b1f17b1804b1-48396d89fafmr73984355e9.28.1771500518827; 
 Thu, 19 Feb 2026 03:28:38 -0800 (PST)
Received: from localhost ([88.128.90.50]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483740be167sm449327885e9.15.2026.02.19.03.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:28:38 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 12:28:37 +0100
Message-Id: <DGIWIUQKM6Y6.OPA1D526RIVV@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260218135026.159676-1-rbranco@suse.de>
 <DGIUIYEL9H07.TK6CF1O2WP7H@suse.com> <aZby3eA2UvAnpWzd@yuki.lan>
In-Reply-To: <aZby3eA2UvAnpWzd@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] userfaultfd: Add test using UFFDIO_POISON
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 97D7815E471
X-Rspamd-Action: no action

>
> This one is wrong, volatile is correct for variables changed for syscall
> handlers.

If this is wrong, we should verify checkpatch.pl configuration.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
