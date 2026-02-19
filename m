Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOr5I6POlmmooAIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:49:39 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52615D1C1
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771490978; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=JLpYpNrXbu/Szu6uYC9t8riG0bcS0Ss0Abt9nIw0+gE=;
 b=pzDzeerxEBjwQlQX46x66oC1Kg/KJWteeWiWeMZUr5VYOtgu9ET0A1C6gwQpYvRNCA3xd
 thA3xu3OJaS8RgQdWJkMw2sefxwXgDBtOUJ2E5p94T7HljcLQmGvY/Ndhcs6jaRUqiZd6Fq
 aprzyzL28jzqQjJcPh/7/OTcthVucoc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 976643D0652
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 09:49:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29EBB3C58A2
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 09:49:26 +0100 (CET)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7A9B5600043
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 09:49:22 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43638a33157so642643f8f.1
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 00:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771490962; x=1772095762; darn=lists.linux.it;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVs6Fli/Pymie10FNAa2BenZy1hyNhJHvpjZqRSQsz8=;
 b=WNY0jm3dnS+s96SVV3Vryuo+Fh27fsktTavWUEUhvVxaZaWH7DFdiyGooVla7CFT/6
 yDk49BdL9rnZFfqsXG36mFsxqV8AB3CMnuYNMkAWPFqhXEPv0QD4WgmnoaoM8qJqxJd2
 7FVdxApEyjN6OuHO0bd1D3Q4LAvA1463/87Yo68iSFFAAUjG+Zdit88l0ApekXD+8ESr
 60QIc6scViOU9TO5/8RNht8vEC/IT7BdeViam41wXZqTqV6j6J2tYAkSbjXi+56U6yeq
 yZuzdYQmi7NajKuIlOJOiwvbIkz9wlfm6PQ0WKJUYk8LUNB3G5s5yALZaFcQ/HjC1n18
 /wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771490962; x=1772095762;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVs6Fli/Pymie10FNAa2BenZy1hyNhJHvpjZqRSQsz8=;
 b=DQQFmcB+ap9as7GrEgnUcIF2Bi3jMfennEwSxRyR5rADv1R/zQduMesv6ts7agZLOL
 W7ZDTd+wU+n8/r8KKDDsBAR4gcXuiZuMG3Qj6Usesi84LhkTAyk6SxpbTJAPZ6LODMtX
 BGpTcecStmahMZEFm3M+JEtuQCDTUr4FO66fgnWPX40zXj69nb/TJMekUo+ansihnOws
 JZSYO1L1tgFhXLnA+GqYXCmL7k5bmblS+rueOWykCFOlmZGBE9WzjGHw8wgxK3GzGXJd
 DMhGLtezouLFM7KJRIT0AACZdFYye4oHBt7+ZuA6+jXqbVCiqw6KO6icFOZPgQ8ykSzB
 rAqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4nle/J6ZEaKli3dZPjd4GMQS3B+IL4yFxCccSJ8mMK92nSk8b/hahwK3br17RJGXJaDo=@lists.linux.it
X-Gm-Message-State: AOJu0Yx0rwZQNqY4TBN+5HQvxATjXGXPe3NXSxy6cfBo9DXFsns73MNR
 Mjxn2K30gp0f1RMkJSLt36G0CGbdRUsyQ7glGHDbld+CNWKE0rmfCsEDjxN2ujvss6wBZBWMVtQ
 i34sy
X-Gm-Gg: AZuq6aIlj9gxZeIkUI0yN1SKLxKeMrWKsjlHM6lWHFjZnRstsIWziEZ2kKML2p/75eu
 iYiYzg51NOxEO3r4KNJyz2gFLxC3iHLGWVdplOi2Fj++gfQ31h/GPyibVl4tqEne+Guk6tBBO8P
 PfZ2KcABReb1UzpjaZMVTMV3SEcQxhcETio0Gs8aunP6ddlGVqqCZnEBeWvYKH4u4bAAqMtMSIv
 4+EhcIbZ4gtNxqhZS1s3CJZHl0c/Cuz/HIEBn3nLmj1sah/NZbUTzTjG1iYquRau/7+CTYbKACw
 6ABGyQYqMlOZqEK74YAXff2n/EwAIulS1e/TWdCCs909fL3NVUfqmZpslUG4No0WgfheaNKRfI4
 YbUUBPlvAZIu89vtmJ6DREZUwiWgVe0VcTIT8k5joHiB7Foo+5eVYc8ZrU6p9EiGyfIiiHqTETn
 8SaZJ1IYd/maNzqmytmWdGn8vHnHX3Boebibuwu5zKu+1PUrSn1dzGtshWc0wtic7vA7P7x2H5p
 Hp7/6SL8kAmqLO1la8=
X-Received: by 2002:a05:6000:250d:b0:435:96b7:e0db with SMTP id
 ffacd0b85a97d-43958e0088dmr7902128f8f.17.1771490961763; 
 Thu, 19 Feb 2026 00:49:21 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abe3b3sm53833646f8f.18.2026.02.19.00.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 00:49:21 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 09:49:20 +0100
Message-Id: <DGIT4WLL781W.28IHUB1N66A0D@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Jan Polensky" <japo@linux.ibm.com>
X-Mailer: aerc 0.18.2
References: <20260218190230.53759-1-japo@linux.ibm.com>
 <20260219081914.GA309124@pevik>
In-Reply-To: <20260219081914.GA309124@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 1/1] ioctl_pidfd06: expect EREMOTE for
 PIDFD_GET_INFO across pidns
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,linux-test-project.readthedocs.io:url]
X-Rspamd-Queue-Id: 2E52615D1C1
X-Rspamd-Action: no action

Hi!

> We are usually not that strict and accept both errnos (i.e. using
> TST_EXP_FAIL_ARR()) without bothering kernel version checking if it's kind of
> new feature. Sometimes it's even complicated to check the kernel version,
> see a2ab37459a in bind03.c (FYI if it's required to check kernel version,
> we usually detect it in the setup, e.g. 2d066ead3d).
>

This is a tricky situation where we might use both approaches.
TST_EXP_FAIL_ARR() would be my first go, but it's also true that the
syscall should not fail with EREMOTE for un-patched kernels. We should
expect that kernel fails with ESRCH. And we don't want to hide bugs.

Anyway..

We also don't have ways to verify if the underlying kernel has been
patched or not, so we should assume that any kernel might receive this
backported patch and TST_EXP_FAIL_ARR() remains the only logical
solution for this test.

> Your approach (single errno) is used if the change is a real fix, which is
> *intended* to be backported to the stable kernels (patch usually has Cc: stable
> version, unlike other commits backported to stable due Fixes:). But in this case
> it should use "linux-git" tag record [3].
>
> 	.tags = (const struct tst_tag[]) {
> 		{"linux-git", "ab89060fbc92e"},
> 		{}
> 	}
>
> Here I'm not sure myself how severe it is. I suppose it will be backported to
> stable as a fix, maybe really just add linux-git.
>
> Kind regards,
> Petr
>
> [1] https://news.ycombinator.com/item?id=34979591
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=05a5f51ca566
> [3] https://github.com/linux-test-project/ltp/blob/master/doc/old/C-Test-API.asciidoc#140-test-tags
>
> >  		exit(0);
> >  	}

Also, since this is a new feature which has not been merged yet,
we should tag the patch with [STAGING] tag in the git commit subject as
per:

https://linux-test-project.readthedocs.io/en/latest/developers/ground_rules.html#kernel-features-and-rcs

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
