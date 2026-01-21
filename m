Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGOGLblScGlvXQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 05:14:49 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6D50E4A
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 05:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768968889; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=R+eX2/QsWK1sYvtwX1/ZI7Pm8NaX+PiPPGdYqX7KCPI=;
 b=cbZw49qLQHHMH6opshq8H8W3bFPVuvc2uvryUsM7z4Jiz3zuIuu+OGqOhIuT6DVj7Wlvk
 Kj/3Av/GBYao/U6j6qBW/qPQMxu1FPBFnZ9VgaA//uIyMiG6E+F9fU288KdRZS4QqB68z1b
 PI5tUH68VfR+4914TzYMfj14r3tKDOw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE8D43CB1C8
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 05:14:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0B0F13C99DA
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 05:14:37 +0100 (CET)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6597E1000403
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 05:14:37 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so198904f8f.0
 for <ltp@lists.linux.it>; Tue, 20 Jan 2026 20:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768968877; x=1769573677; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3AofvspUHCWuZnwBYeM/tBP6Y4ww0Q6MC3fu/+4k4nA=;
 b=eXoB/kzkfNLTtxeB9O04lPwdWMHxD8OSaXSHmXD/w+A/7H0L7DVbQAybdeBtt5cdTu
 KAqiMok45aYK1ysEvD9GFtafrIRwtXCsmfX95Nf56XE7U8OLeKAvvAQQO3563pMWJaBG
 +QOO+zFEoVGesfC5K0OnGzCeXbIMjoEalzoNNlgse2rUogcK6LhOl8jJbeOW8dJ1rrSN
 3lirwXt0qqK+90yc5y56uHhXFGmQA+Kc5b4KTLASXRJcimpCw+fMMhyLlck8jIWabk5F
 rQ7zke5rOZFEoUC9PeEEmJyiNJfF24l6YiLt/IXIkQoa0SAQ0baBlgVOvJAZUQFWvKGS
 GqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768968877; x=1769573677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AofvspUHCWuZnwBYeM/tBP6Y4ww0Q6MC3fu/+4k4nA=;
 b=OeCxYbK1ZM3UqNTy0yIakyQnZAMPrZwvyc6FYvuJiKnE24P0tslNtsqlfpxXrXui11
 bukasIgeKqN3mV+xxT3CW9Tux7rGsfJsKqhlleRKpSiPt8v0df0uiTI31gvf5SO5kma2
 gC4+Qaz6LccQgSo9XDw2i5NtROfOA1VqutnHm2Ch1v/oAwt3741wi9Tul2ubUq4KfMRh
 oeNVygslRPtfh5PE9YcUPi3iOaIzXN4W/sC1R7e1h0y4HDx+ItphGOcf1zYO7ZtlNAeY
 u7hx2kAv7Xovtl7CMQmU6QnxNn7ydyr+Yitg/o+/Hnh5v045j1NIUYBNH1lkngZ7V2J3
 vzWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxN8pUpW6e4SUNcWdvYZelOfPMI6caUqOXw0XZ/f6PXjTsXEJvsXX76wB+qfBgMtOrAf4=@lists.linux.it
X-Gm-Message-State: AOJu0Yzx1aPQxAskSq2UBMMqAxfM90O9hOZAs4EJVcyf2CnU4+KCcbGd
 5mMG4o28ze6LwG/0cZfGgb65XZ5SbDflRA8WbE8SND/1a+TAqkXVPfEGwsEVyPzjQA==
X-Gm-Gg: AZuq6aJHRwQiYg6nGndknXwbtZnInxA7dOsI5sXlu8uRPa1GJ/c0opeVydCOHQIcMI9
 JDIVLT7lRAJCXYi/pximVhQ2Y13D9aCEG789/U0/eLYyi6wL7pIeukePXvrdWK6+iAmmalPbId9
 O+MfoTdPJQINi6UGGpdepDKia3pNO8ItenrWFdaV0wcQv0FlA73UaBtlk5SZELij4DMgeAScJkY
 hK5y6XhDm2+mJJd0YQBFairg9vIFvGW5J7AoMdWvtvi7AMhrBeI//1Gr9H9dbgy0kVo1gddFYXa
 dh7SEKMwGCguWhPNYZJsgbIji4vZ+mrafSgNnH4vDNkEdDXfATOZmu2OcXJmD6FnEb3EQoxw7FF
 O80aLd68vmHnVEtrVvhZ5y5uE5/rdMiwG4VfqHC5CC7Byv1eEcSY4kJlcnLO7bWTOO82tekBJ3O
 vI8H7jdqulr32fA22wlCB0pBkuEgQD
X-Received: by 2002:a5d:64c3:0:b0:432:8504:befd with SMTP id
 ffacd0b85a97d-4358ff56818mr6138514f8f.32.1768968876770; 
 Tue, 20 Jan 2026 20:14:36 -0800 (PST)
Received: from autotest-wegao.qe.prg2.suse.org
 ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996dadbsm33169509f8f.21.2026.01.20.20.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 20:14:36 -0800 (PST)
Date: Wed, 21 Jan 2026 04:14:34 +0000
To: Li Wang <liwang@redhat.com>
Message-ID: <aXBSqvZ8OVP39wd9@autotest-wegao.qe.prg2.suse.org>
References: <aWmqFAzdtsR0t5aJ@autotest-wegao.qe.prg2.suse.org>
 <20260116070708.GA556902@pevik>
 <CAEemH2foRNfQZt2mFRdR364=xB8db_qjd36pM_ce+EKpJOAhkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2foRNfQZt2mFRdR364=xB8db_qjd36pM_ce+EKpJOAhkg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] clone10.c failed on 32bit compilation
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	HAS_REPLYTO(0.00)[wegao@suse.com];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,suse.com:replyto,suse.cz:email,autotest-wegao.qe.prg2.suse.org:mid]
X-Rspamd-Queue-Id: 61B6D50E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 09:13:25PM +0800, Li Wang wrote:
> Petr Vorel <pvorel@suse.cz> wrote:
> 
> > FYI the patch is invalid. It should have been:
> >
> > diff --git include/lapi/tls.h include/lapi/tls.h
> > index a067872e0f..eee77899e8 100644
> > --- include/lapi/tls.h
> > +++ include/lapi/tls.h
> > @@ -64,7 +64,7 @@ static inline void init_tls(void)
> >         tls_ptr = allocate_tls_area();
> >         tls_desc = SAFE_MALLOC(sizeof(*tls_desc));
> >         memset(tls_desc, 0, sizeof(*tls_desc));
> > -       tls_desc->entry_number = -1;
> > +       tls_desc->entry_number = 13;
> >         tls_desc->base_addr = (unsigned long)tls_ptr;
> >         tls_desc->limit = TLS_SIZE;
> >         tls_desc->seg_32bit = 1;
> > @@ -72,7 +72,7 @@ static inline void init_tls(void)
> >         tls_desc->read_exec_only = 0;
> >         tls_desc->limit_in_pages = 0;
> >         tls_desc->seg_not_present = 0;
> > -       tls_desc->useable = 1;
> > +       tls_ptr = tls_desc;
> 
> @Wei, @Petr, did you get it to work after trying the above diff?
> Which kernel did you use?
6.19.0-rc5-gb71e635feefc , above diff can not work, just some try.

> 
> Unfortunately, neither of these methods (including Wei's method) works
> properly on my kernel-6.19.0-rc2 platform.
> 
> And no matter what method I try, the child process still cannot switch
> to the new TLS. More details see I posted in the pre-thread.
Yes, i guess we are still blocking on i386 scenario. But we can rewrite
parent TLS's base_addr instead of switch new TLS, this way is correct
base current kernel's logic but still need further implementation.
> 
> 
> -- 
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
