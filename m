Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNrNGEKfhWlKEAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 08:58:58 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9291FB310
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 08:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770364737; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=rx4e4SoZNsXLD35zYDfd1d+nYGJkASIM/hQ8nlcdHIo=;
 b=V35LUHjHSRv1HEGXsRBFAcbo1CG37Pm2q6/PivmCVtq4DgvC+h4dN8iqvwjf+okDUA5GF
 xYh+//+XwbVW56WqBZGEWmjyidoAmdIs1e58XQkY32jEx1z5m3dY0IuD+4HYcESZiK9g7jy
 gyF+7SMujD7pzFfvr/gSUklO4gocz+Y=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F29FB3C8EE3
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 08:58:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4D8ED3C19BA
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 08:58:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AC88A1A00165
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 08:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770364731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IVPydbqg6IRjP35tjssEBGhMKeSy+jcxeMHgoN/VDx4=;
 b=PsikpfjryawcYY+c9/TwYqSrPQZuoTZGYpGcD6ECvMLWzbV5HO6a3S3PHLkncGvg+dN8oj
 t0q2oswPVNUHb6adZwRFR8uPiFh+MRqlEU64smWNr7T2tVzds0CJI28WV73uoOwLih19kR
 nTubsixXTX9DpFMNq5kQwIoySADDdjs=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-xgO5CPpKN6yahepfhnNx7w-1; Fri, 06 Feb 2026 02:58:49 -0500
X-MC-Unique: xgO5CPpKN6yahepfhnNx7w-1
X-Mimecast-MFC-AGG-ID: xgO5CPpKN6yahepfhnNx7w_1770364729
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81e7fd70908so4037899b3a.2
 for <ltp@lists.linux.it>; Thu, 05 Feb 2026 23:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770364728; x=1770969528;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVPydbqg6IRjP35tjssEBGhMKeSy+jcxeMHgoN/VDx4=;
 b=DOD/UmImolW93Ni6ONYLT+6M9fUz96hIOr2jNQxL+1Fb4+p2HSM+XI7SUwdSMtygDD
 hZuJtu7Xnwx1zWpR2OMfd01tMln4iB2FoKakVRz1d8NnW9LMQdSmdyETrNg0WhcbJ9Xy
 Mb7a5RMcLlCXnY+iEPky/DxbIFY4o3IGfQSTFiv2cJVOzp466EqSQBWsiKmfyne7CSDN
 +OEiS9vuQqacSSecrK+rVMXa6B3EOJszGePM6TtMeHD9fTG+Suartg9lHqqIFw7nBWHm
 VjGdqV9irUeiEYsnI+xMs9ABRX46qllYKp/6T6wbcaAZDH4/J88JIr8t3WMczQcv4xvM
 VfAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeYHhgFzDOYTSk1vF1isI9ZNFVXVl4jjXKDv/3LrlZkeQx/pGs1a49m8DCOJu+beIo13s=@lists.linux.it
X-Gm-Message-State: AOJu0YwJgPeLJ3iYGAIBQFqcpwfqVBFCrf+a+sLgr0dGXmkrsdCaxD9B
 ifLsyAfsc4SbpNm/YwDvZILClyypjEOH1bC0F0rGh+1kMiW7DprSxCvftl4P5LOIKxw9hMPuGEm
 z+Tk7wBE8VDG9f00CHk5lOSr7toqkPIc5RxfueDvfPdZOjOTeE+yd
X-Gm-Gg: AZuq6aJSOKRf2fdYC3WM2p+NA9I+d/M1evCuk0JynsvoTKVO/l7eIatqh5MqvrA+Ap+
 w4Gm8RELPw7oizZDiYjUlDJK9oURvx9naelLldUmJsySOgQ6vuYrT4P8/8mFCkZ+6/gu/vHnzOz
 1sPpAaLWagIWFR81eus3WfjsPqSCOpLck6ThR34FE+Sp/FSNEoNZrz7jF0unYv22wgaQJMw/Y3q
 rOF//ud+0z6UhvFSwGhHfTL4xVnobJJm5kiTm90e9nSyHp6+8PlE3V00fwoFX0Zq3zcoet35QXt
 Xqo3IWX9Uq5W9CcWxw9lbJRi1k3PavL0x0Yoxh0c7ozmrP6brpRzjRiizaEBoJVNf38ocZVy/Yh
 TnZd1
X-Received: by 2002:a05:6a00:194c:b0:81f:3ae9:3f71 with SMTP id
 d2e1a72fcca58-824416309camr1913134b3a.28.1770364728566; 
 Thu, 05 Feb 2026 23:58:48 -0800 (PST)
X-Received: by 2002:a05:6a00:194c:b0:81f:3ae9:3f71 with SMTP id
 d2e1a72fcca58-824416309camr1913122b3a.28.1770364728150; 
 Thu, 05 Feb 2026 23:58:48 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824418b5373sm1552038b3a.53.2026.02.05.23.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 23:58:47 -0800 (PST)
Date: Fri, 6 Feb 2026 15:58:45 +0800
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aYWfNaJeXqut0Isb@redhat.com>
References: <20260205135724.23772-1-chrubis@suse.cz>
 <20260205174756.GA338897@pevik>
MIME-Version: 1.0
In-Reply-To: <20260205174756.GA338897@pevik>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RsgnLr9XL8vXP-FoXJtpRjI1jPJGMaS7ZRoyeLfVWXs_1770364729
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: tst_kconfig: Add runtime checks
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url]
X-Rspamd-Queue-Id: E9291FB310
X-Rspamd-Action: no action

> > +static void runtime_check(struct tst_kconfig_var *var)
> > +{
> > +	size_t i;
> > +
> > +	for (i = 0; runtime_checks[i].config; i++) {
> > +		if (strcmp(runtime_checks[i].config, var->id))
> > +			continue;
> > +
> > +		tst_res(TDEBUG, "Running runtime check for '%s'", var->id);
> This will not work since Li's change:
> aa5a6fcdcd ("lib: suppress early TDEBUG output before context initialization")
> 
> @Li I'm not sure what "unless explicitly enabled" means, but I guess we cannot
> simple enable it for the test library (following patch). I vote to either revert
> aa5a6fcdcd or change it (effectively revert it, but keep doc and the rest of the
> code).
> 
> I understand having the output in each test is not ideal:
> 
> utsname01.c:39: TDEBUG: mmap((nil), 64, PROT_READ | PROT_WRITE(3), 33, -1, 0)
> utsname01.c:40: TDEBUG: mmap((nil), 64, PROT_READ | PROT_WRITE(3), 33, -1, 0)
> 
> but better more output code than no code.

Well, I don't like that noisy logging style, that's why I did aa5a6fcdcd.

Maybe can we add more levels of TDEBUG log to LTP:

  -D0: no debug logs print
  -D1: only generic logs print
  -D2: more veroes logs include library debuginfo

What do you think?

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
