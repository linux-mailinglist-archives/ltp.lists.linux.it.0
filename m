Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD87HG44g2kwjAMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 13:15:42 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5ACE5ADD
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 13:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770207341; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=WltjSCz8VaXD4gwPfbzGRWA+5Bic8jObbUrMruMTWQk=;
 b=b1aPb71AtkClVu5pVHYW7t03T3mTiwJ/DU6KGttk3C/+JaiM6/GkMg54G0zU0IbXHX2Qo
 3/13ZcBrjFY8wW5OT5OXHVNK/Ja0E27NL6o98w5/1VU2nDyAegOI/WQy1LzWbXEPXC7bWXt
 icgL49oKfGq79klT+44MqriHgldZcvw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 878103CE0B2
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 13:15:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF53B3CDE70
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 13:15:37 +0100 (CET)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2DB556008F2
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 13:15:37 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so91364595e9.0
 for <ltp@lists.linux.it>; Wed, 04 Feb 2026 04:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770207336; x=1770812136; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fK5abW1zSssqQY0mEX2shtlHpfFLr1b/CXDfZCI9AvE=;
 b=CW9RULePWhCoX2fhk0eDKfp85gdLFYKCJ+4uUvTsenGq+zgKw0RayVcZzbMvvgHMSD
 ZeOPuYXwRr+d8XuMYcQm5y17IJrv92FQCaZtba63F2TzsvpIstHjdjPDlu7Fd91NMTB+
 hXzFa0Um+6BN/LCz4rGYmf+eMRJTHt6DgNU3Tn9GokwXuUhhQBeljasn0tbEAhg9PAE+
 g+dda/BnJGd21Z+85mixaVxtkdIQeWXUBmOr9e+Aeny6UFPi/1nGBpe1jVxoJvlTgpUB
 x5N/KUFV8hEoh5tb52r0TuzspcBDn9lEKF+P8Qny5iThpMH6GADPBh9Oalu3DYkzTlBN
 6q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770207336; x=1770812136;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fK5abW1zSssqQY0mEX2shtlHpfFLr1b/CXDfZCI9AvE=;
 b=gARjAWAvstYcC4vBPOu8b+I9do+N83dIZsPzdgIEWuuHKZXUFnvGDZBNkZFXSNUsa9
 f29jXtJs+tYaDUNHgwv22/LuhETGlF7izxb6wlt4UtLU5M9FAdV9hnE7x5Xplgk2gBF/
 DDB89qu3lpzCL/KiIXdK3/yep7BdUgzfX9Z0EQHsNvZXSoY6vFOHtx2uCyStSqizrqgn
 NI9QW9d/hpRIcShwnuEBN062JhTTMPhNKS3W5nCvqs9jyVz+gNiwgM0/K42LMu+mI3ZJ
 JZuqbC1QIODJO/by2wb+TCxBlVhkCGjBmVn/NA/Dc9lLlpTolZrt8V4CN4JHFakMBQQV
 M/hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzBeUcjWBJbcfrw6VYHF2QSbHXQ4k77bkQ9E5px0/Dwq2HaC9rpYSNKjONLKpmjZud/Yo=@lists.linux.it
X-Gm-Message-State: AOJu0YxqbPqEpKFF4JGVkRQfd04AEGWGaFRV9qSVc7ozBUznryjm4EWq
 dvfbgdGfAmGLcuM3UmKd6UbUocIQENwxi/O5w6FdbAE9vnkPjgbtrFumKQ5MPQKub4E=
X-Gm-Gg: AZuq6aL86eSBNRFcDZIGSdGSlihp3rGtPnTD9PzY/FlBP16EmR9gxiKxJpaWbyWtUCX
 OWUEnAOUI/W/5qnzNSPm/tda8QlxYBYI31XIYyE21eSeaUnNuB/ODefx6bvKIrkkmy9eqUUM0b5
 fAb9NOKT933Sc1u9h4nv1Zar0hfTy9/iKOeKxncs+OOuHq3Lnfo6FbbMPK2fWUDyzBXLRJPqi3a
 6kQKpQ58SLs9L7YwvVTvPKii79e78bWz15SkCeud84RQ/0FWCpZuMtYHzyWV9L5KoUuQNKZnc3T
 lr44BrlJbU35r8rDnOCbGTlZA5lTd9iDKvMTmZpIk7q61g4AHGh9cspntyVskM3foajr6lyd9SN
 uTMqwH4pa9h0q15dliLfbBPXXh/lWq01ztXGaAerhgCbNBBLxjX+kIUKeE2NX2fq3AOuUieEiEa
 0k2FpGemTeMWs=
X-Received: by 2002:a05:600c:154c:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-4830e92291emr41630395e9.3.1770207336401; 
 Wed, 04 Feb 2026 04:15:36 -0800 (PST)
Received: from localhost ([88.128.90.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831084d7d9sm40418225e9.4.2026.02.04.04.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 04:15:36 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 04 Feb 2026 13:15:34 +0100
Message-Id: <DG664MTNCKXU.10ZGQ5CGF7DC9@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260204115339.224261-1-pvorel@suse.cz>
 <20260204115339.224261-5-pvorel@suse.cz>
In-Reply-To: <20260204115339.224261-5-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 4/4] kirk: Remove runltp-ng symlink
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Tim Bird <Tim.Bird@sony.com>, Julien Olivain <ju.o@free.fr>,
 automated-testing@lists.yoctoproject.org
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
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,virtuozzo.com,sony.com,free.fr,lists.yoctoproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:replyto,suse.com:email,suse.com:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 0F5ACE5ADD
X-Rspamd-Action: no action

Hi!

On Wed Feb 4, 2026 at 12:53 PM CET, Petr Vorel wrote:
> kirk is here long enough to remove the symlink.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  tools/kirk/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tools/kirk/Makefile b/tools/kirk/Makefile
> index 876eb3e2ed..859afde6e6 100644
> --- a/tools/kirk/Makefile
> +++ b/tools/kirk/Makefile
> @@ -17,8 +17,6 @@ ifneq ($(wildcard $(abs_srcdir)/kirk-src/libkirk/*.py),)
>  	install -m 00644 $(abs_srcdir)/kirk-src/libkirk/*.py $(BASE_DIR)/libkirk
>  	install -m 00644 $(abs_srcdir)/kirk-src/libkirk/channels/*.py $(BASE_DIR)/libkirk/channels
>  	install -m 00775 $(abs_srcdir)/kirk-src/kirk $(BASE_DIR)/kirk
> -
> -	cd $(BASE_DIR) && ln -sf kirk runltp-ng
>  endif
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk

This is the only point where im not 100% sure. I'm wondering if we
should keep a symlink to `runltp`, just in case people will have CI
working on LTP.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
