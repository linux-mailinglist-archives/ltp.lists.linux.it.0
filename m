Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B9RAnZKg2m0kwMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 14:32:38 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B40E6735
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 14:32:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770211957; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=HdkhghlvFaVNmdGUlvTbU/UAgn9IHfuCGgz66w4sErY=;
 b=gKJglMXf1rlJZlamROlqNgkiHOt+40Q8TFcC2aL13DL12Ir0oXLK48yeq0lxKRdq+yUZQ
 ehk21dhQ4IM9YCuEPRLB3hkULDKd8kmKTaVsUWBitFGUQ2950Dxd78V+sClRgQTtKQvP/Y7
 swnwq9niODiq6Okig1MCKdP7HdwDNnE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BB4A3CE0C8
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 14:32:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 849423CCAC3
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 14:32:34 +0100 (CET)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8FE791A00358
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 14:32:33 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so64911705e9.3
 for <ltp@lists.linux.it>; Wed, 04 Feb 2026 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770211953; x=1770816753; darn=lists.linux.it;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MC7s1KxVMa92/a5k+vaQlO1gFaVY3WfXZgNcfAdS5mY=;
 b=HYJdtreQRbjR8gUgcfeyOoijHmwvb3jii8whoTeC3vRu7C4FfTuexaPcoHwWhWv+9b
 NHmT0uRduHlUFg43guUaOo3ycFJB3jl6sshqh56z/oTQnj0B8g8X6si7O4F5FAnZ1inh
 Z0wWVR/ckB2GSgiQKfX/fcKuLZct+o3S74ZEV3qEl0aJ6cBasCEFLPB/5gcRMo9ZiGdx
 oZnYa1CoffVRei0v31w0KxJr75PVzw4EWP0vKCxN3XrEvK38GljZr4QhPV+FF5thlfkj
 N758GHBmMrzhNW7DByl2gA1KZFXaqJ+JNAn+EFmUQ9ePoxezoteE4r2+GMDEeJP2i2sA
 aMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770211953; x=1770816753;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MC7s1KxVMa92/a5k+vaQlO1gFaVY3WfXZgNcfAdS5mY=;
 b=auII27cB9rsJO2UkHIFkyYGGLy8BRS6LDFponYaA/1sAWCZJedCBEP7DMnG5kQUAK+
 Qn26KkKHvBhrRr5FMs1PXaqhljjtwAanrgW8FjYh2v0Zt8EDhMniUXJXNT0l9PeU3YRZ
 UFJ1iLyCNTcz9hA5fKWIhPROlUFALa0Iy8K+kQDRopUTJiOPDwH/mek2E8LOdIT5VUar
 ozBZoe59yIkjGwClwSiy7Esb4ODvR8lpoGeGuBs0gvX3mC17cKrPIFukgDEQS5SjxHNi
 bZ1Rc1roBehcfx301hlqi2iAKTXXKlc8zAGuDKXYP55ALOviFFuA2M4B+eu5E6lAQ6Ke
 SLpw==
X-Gm-Message-State: AOJu0YzqFUrqgvEq+GVJr02nn7qLBi/WxKZ9zHmBqvHohfCr3Vsn05+H
 Z1B575bAKSeXgxdJTVfwDrLTLVUom2WPEcBc5qHKLl28/9mGnu3hJDFhpgP8bqDydh4=
X-Gm-Gg: AZuq6aJc+Sz/hQ8qtYntJ8LEOWJErVlToLwNjiAtNqX7gtzFnZYoK8sfaxAx1mhLQyf
 jBWPFbMFOE63DDlz/eRds2xKzOdfZGty8M33Xz0fceOZdX9rRL1qFhoGV/o4A9amGc86f/Juy1P
 cSUdxFXvJpUg4mCB8J3Knli81pCFVb01VX/OV9JyjkqZwWd16nqjawReeS5owq0CD+AgCCSafIK
 8yn/XBSIiAgJ0FWnC9FXEfn4NVL3HQuPVM4hADE5Mmul+M8tN05/WIRDahh4iTFaGqQMjsYfsMY
 Nf01T2AiFBdjccWajH06l3GRWQ56C51Fd1Ey29/MciYmdVNltdasvlT5s4O/U+ofWNF4hzSMs2v
 LaJSp1gFi8k1ysdtN2f+kUwNqIiPmsmBxkLmictemRk+YUpUGddVSs+S8tP4AupgGLYcvsCIBg5
 QA6nw46MUblF0=
X-Received: by 2002:a05:600c:3552:b0:47a:94fc:d057 with SMTP id
 5b1f17b1804b1-4830e923ff0mr39624155e9.2.1770211952885; 
 Wed, 04 Feb 2026 05:32:32 -0800 (PST)
Received: from localhost ([88.128.90.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483108d7b1fsm62475975e9.2.2026.02.04.05.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 05:32:32 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 04 Feb 2026 14:32:30 +0100
Message-Id: <DG67RJLMIP39.2SKIKS7ESMSWF@suse.com>
To: "Li Wang" <liwang@redhat.com>, "Petr Vorel" <pvorel@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260204115339.224261-1-pvorel@suse.cz>
 <20260204115339.224261-4-pvorel@suse.cz> <aYNGgCJmEhv5nXYL@redhat.com>
In-Reply-To: <aYNGgCJmEhv5nXYL@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/4] runltp: Remove
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
 ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
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
	FREEMAIL_CC(0.00)[bootlin.com,virtuozzo.com,sony.com,free.fr,lists.linux.it,lists.yoctoproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 97B40E6735
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 2:15 PM CET, Li Wang wrote:
> Petr Vorel wrote:
>
> > It was replaced with kirk.
> > 
> > https://github.com/linux-test-project/kirk
> > 
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  Makefile |   2 +-
> >  runltp   | 959 -------------------------------------------------------
>
> Perhaps we could create a symbolic link in the root directory pointing
> to /tool/kirk/kirk-src/kirk?
>
> Otherwise, people might be confused because they can't find the LTP
> runner in the root dir.

I wouldn't use symlinks, they are not reliable. It's better to have the
current setup with a script in the home directory pointing to the
libkirk library.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
