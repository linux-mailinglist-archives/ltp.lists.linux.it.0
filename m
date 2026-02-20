Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOnRL5QXmGki/wIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 09:13:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 367B41658B6
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 09:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771575187; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=F3r//9Y6Jan+CWzxHlsBr2Xp9gWPevzprHLes+xPmcg=;
 b=N7izcoEIitTcqvvgKysFfKjYTC2pX3i62/X2v4OxqGr2GoR3ntYpeJPrxdyi3RtIgLv9P
 VUWw0MgPZNnQ6tGzJDudyxLWRhg4yP4DcwuEuolCAB67/VNJRPTD4oaMMwxr1bVKxQzAkzW
 rkugUzEJmm9O6x7CMZECmKOLrieYTpw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99E413D07F3
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Feb 2026 09:13:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 85A183D02E7
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 09:13:05 +0100 (CET)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DA503200AD0
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 09:12:59 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so10615935e9.0
 for <ltp@lists.linux.it>; Fri, 20 Feb 2026 00:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771575179; x=1772179979; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yyq+9zi7zICtRc9D6CanQaSzuE38KaPKA0jtPXLijdo=;
 b=KUj82b3UHXCOlSVXLRgx2kL4b7+j61vrFDa/a8JVjNJQOiML7oDMjQX/mHYufevPFQ
 sTS0L2OLVYy1SKoXNsusr37vjDUQHSwQMHYlnqPWGNVgoM53jict7XHOXuXo9Rpn1JHg
 6L45g1zu4GiBMl+ToLHnJ2xeFj2J1TA2rsG5t4x7rY88PnYaYX6U0+i2qHnHmjw2r3IM
 8MmJ4+ikGGefkjWvC738IEVH/gmNSneB2FBADVreL2aanvbe1ppt7GV4fH9kqaPd3u6g
 RHV+jvNrZhdX7hjzGJUr7SeFm0IqfOA1Uf0Y+mo7OKVIgQ9AniDoOV2qWwLCvtoa5l7J
 pP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771575179; x=1772179979;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yyq+9zi7zICtRc9D6CanQaSzuE38KaPKA0jtPXLijdo=;
 b=HkNr4Pfx7VUpBPLOfL+sNxK2P5KpJMtkvzgbqlIeIKQBNW47n/NkDengs5qy+inHuS
 io3zM36lPQrrL5j7omCmWWdoXykTgZAsNxQput7SmZ2t8+1qhklpQmrDOo6sNZUrbvQg
 nStj/oTR74DTpBy6rtlIfjssRlu2ItMVtSfFgNJJVcd2OyX62btwv3xBOOAGN6V0cUZc
 YaqYor/NnofX74Q11PK0p8VFfBow0xwTaKAcuk895IWelGGhFS3bglC9fyE1PoPyhPcW
 0FiJa7bjuAuFuWF75P7DOSqYp4EaUB+LvHCgm6RdgH50I7yySMwxTUihXzLydFG7FvUG
 nfmg==
X-Gm-Message-State: AOJu0YycyMvfT+XZurgHpdPuclqIpDO4PiN50romb7RHMY1GYsS1UpDC
 cOOD44Si8+e8Mjtk0TxN9RAF1J+/8MDwndx8qBHQ+fzOZTxqLCyoSU+zACFKcWJ79QA=
X-Gm-Gg: AZuq6aL0zPMugqUSLJadXIJ9ik4fjQ/WVcoEsFIhczrs4jg9UlmWVgbB2WMnlRXuqVj
 8wnu60+fFVJrKC4bvhMpVPCgXwbtsie5+QdJlAjCZBZsOvzn80BsKyAPOTJ2UBbnLwzxXjKPSed
 l9dubpaDD77LY2IzYnKc0JUfrJOYZV/64dE3KRO5y5r3Pc1ctfLpDn42EmgHPGv+3ZREa5WLqHa
 OWVXJtTnGB06Zr4ExYXXtCXz4HRgV5SQDH3//vAxfEbKUnkQQkvUmvLaJAJOzJ7KY3y33bahwKq
 hIAWHV2IwsI+LTHFZ1Q4+Laxm8P6KMpttPpeiVhQYeJUlzUNJP8KBxczCMO5XP2/gHH2YedfzL8
 g/sLSSw4SnoxLz7ZK6BUNg1zTxHtLFu7MYzfmVmKwgb1d3LNHT3t2Lxtm/5/gnpFEiGnKu2kMoI
 6lL5C5GMaPLdnXB7sRXboRNv36DSn/gxiKFEujyuRwgR2iH1BF6m3qYzWhFB8p9ZqnYQDYo99GE
 qKRkVdX1+7vLtqItwM=
X-Received: by 2002:a05:600c:4eca:b0:483:6d4a:7e6d with SMTP id
 5b1f17b1804b1-48379be60camr296679605e9.30.1771575179182; 
 Fri, 20 Feb 2026 00:12:59 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a3e01b0fsm16241775e9.8.2026.02.20.00.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 00:12:58 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 20 Feb 2026 09:12:57 +0100
Message-Id: <DGJMZLFK3YJY.EUUQNSIBR2PU@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Cyril Hrubis" <chrubis@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260205121540.329921-1-pvorel@suse.cz>
 <20260205121540.329921-2-pvorel@suse.cz> <aZQytH7k6pVXqdsz@yuki.lan>
 <20260219202051.GB341772@pevik>
In-Reply-To: <20260219202051.GB341772@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/6] doc: INSTALL: dma_thread_diotest.c: Remove
 runltp from doc
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
Cc: ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 367B41658B6
X-Rspamd-Action: no action

> Anyway, I can wait little longer, but I got already quite a lot of ack to merge
> whole patchset.
>
> Kind regards,
> Petr

I agree, let's finish this PR and make a new release.
https://github.com/linux-test-project/kirk/pull/92

Then upgrade kirk in the LTP upstream and remove runltp one for all :)


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
