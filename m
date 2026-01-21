Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH2hEeaecGlyYgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 10:39:50 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D12548C1
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 10:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768988385; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=fmNFjywVexUtpQaycESNr90RXxCHWEaLeZ0Hm5wXca4=;
 b=ISfO9OicJwUKRYTyhUyLSTQ9IncHr/sC82L6KZUzaNzH5qGYQi+E7VqZm+d+yNHro2vqs
 JL6pYMcVKRSsFv/1Qqi3Cbo/C+4v6rCiXcqs9TvXJU+kt/VKLqFHRLIvEJiYjOEBvFHh9d0
 dsCjh3tG8mSzn2Tc9/If8DNkdx4mYrA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F9C93CB23F
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 10:39:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02ECC3CB17D
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 10:39:32 +0100 (CET)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 187E91A0098A
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 10:39:32 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so41904055e9.2
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 01:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768988371; x=1769593171; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RvCQngK8poODVt8Fel7tM2hJJd7fLD6Vl4nHcf9q+/c=;
 b=HSRjPFQlaQXkc4HOxv1FDdItfe/o2YH2/ZhTqXIBrvQpEfHNJDjT3uIUNFOvEpkGiO
 mbF0eMYlkkdFUMqDMztGzS0581fFhaEw31N2z+dp6yQK0K4GvT1AqiXFz2XRor1GmtaA
 mWwFNOyHjXhftQL2SfUq+nHYhfzTiPsYxwieLtrVNZ6kIasVUmUAsdZX+8aJRJYivSoB
 aOHlHKbQ2IpVq0tQJMhCBErgvtIu8S1YVegBegb/zPi6m4oCk2A04+MFmo3arTzvR8zZ
 drmCNup03/J+vDj2H048b+RMts+6V1OEsDQDWasnqTtU6wOEzW6tdiVYm2sS9VJ6XeBi
 8AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768988371; x=1769593171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RvCQngK8poODVt8Fel7tM2hJJd7fLD6Vl4nHcf9q+/c=;
 b=qEy2D3VBqjjQMjxxcawkKy5x/v2e7GwohsM1HqOvMChOdZX0+IX3vqCt8tXp3nEDsH
 1K69VjwEnz/1auDNUKPPSCwG4FuQOwRImtt/r6SEcGZycQ73t9fXYj3qLYt+QkRrB16V
 l4RF4VJjKBy8sqofz7AmC1nYMx79NSxa6tezJwQWaRd9xHGYYyx0xf5P4lV/qgUWNphA
 un9yeQIdSuyeIY07lyoT6u6A2YRmTJ3e+oZVCr78m17krUjKviAz3g2SQwr4gI2XiVz8
 OgR7ke1UARP66ScFSUB0HIumIm7GzUpts0wFeWP6rCqrXIyqQgwdWNlIpFYFYjAj8MzX
 Mh6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI6mfur+OdhQLQA7DfVWx0Tc+nFh1drZfnp9A0VbpyJiXUT/YFxthAcve1YwqY5BJlnQg=@lists.linux.it
X-Gm-Message-State: AOJu0Yw+f2UJhaDhc7hOZ8zC3fBMDQDykt9DjnYFY48SRh2ogDRty7Rq
 T9F3n0Q4SIhohCUl18+027plmqhxSf3P6DuKwkyO5FGucgWQmltLlvQaPSHxFhr3GI5KMUHnnhq
 00yI=
X-Gm-Gg: AZuq6aKb9DBRuWza8qLEluRH+mMag12+8Yg5M28W0tpkq3eGsb7kztJiMuoyESeJ0uO
 8AVCRDFpJlXH3/cm4zVWrm5j9aAXeEmXY9Lfwh9yE/Zv5SkKrCG7EhNvW5adzPkPRsRFCJBtuqs
 ZgUs2PPDTyh+aOUZSuDWoD5Gto2z8Jum2LiB3EKrHynDcTtA3s/Zx7UuYMuxpaQq1x78NFAvFVx
 CVlwX06dEt5rdZQd6Db6oqrBUrQwcdp9DrDf8V2xNrPoMPXWAOpIwhBX4NderSWcg/H0nbM03xm
 VhCG7Lhzo/SFErvXXDRF0SXpRz+8AIg0naPj8svWLyyFhwb7hWIXNGjq2vT7cUu+Acz5KjSl+Id
 7cK1/eHOKfWxZhcdMmhSXftYyqEVwgQZ+iGXSs+Xzq7pWD6LFbmL/K2rFzkjS42O9PHBk7MSv92
 4rDiiJKyQRgFOxakVh6ZLk1zeJFpbB
X-Received: by 2002:a05:600c:354a:b0:479:3a86:dc1f with SMTP id
 5b1f17b1804b1-4801e3503c2mr215761305e9.37.1768988371189; 
 Wed, 21 Jan 2026 01:39:31 -0800 (PST)
Received: from autotest-wegao.qe.prg2.suse.org
 ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042b6a3e2sm17479975e9.1.2026.01.21.01.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 01:39:30 -0800 (PST)
Date: Wed, 21 Jan 2026 09:39:29 +0000
To: Li Wang <liwang@redhat.com>
Message-ID: <aXCe0YhCt21xMU44@autotest-wegao.qe.prg2.suse.org>
References: <aWmqFAzdtsR0t5aJ@autotest-wegao.qe.prg2.suse.org>
 <20260116070708.GA556902@pevik>
 <CAEemH2foRNfQZt2mFRdR364=xB8db_qjd36pM_ce+EKpJOAhkg@mail.gmail.com>
 <aXBSqvZ8OVP39wd9@autotest-wegao.qe.prg2.suse.org>
 <CAEemH2f=YMZOmHJAzDUSxekzZ1Um9tJzFQ_d3crMZ51L5aKJ2g@mail.gmail.com>
 <CAEemH2c5H=w2odXJc8=a=ynNubMV85QTLvSweWTSz0gjfvCduw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c5H=w2odXJc8=a=ynNubMV85QTLvSweWTSz0gjfvCduw@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
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
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,linux.it:url,picard.linux.it:rdns,picard.linux.it:helo,lists.linux.it:dkim,autotest-wegao.qe.prg2.suse.org:mid]
X-Rspamd-Queue-Id: E3D12548C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:11:05PM +0800, Li Wang wrote:
> > > Yes, i guess we are still blocking on i386 scenario. But we can rewrite
> > > parent TLS's base_addr instead of switch new TLS, this way is correct
> > > base current kernel's logic but still need further implementation.
> 
> Oh, sorry. You mean only rewrite parent TLS base_addr.
> 
> I guess it can work only if the new base_addr points to a valid TLS
> block that matches the runtime's expected layout. And, we need to
> construct a real TCB+TLS image for the new location.
> 
> However, it is also over the goal of the CLONE_SETTLS test for clone10.
Indeed this way we fake too much things :)
> 
> 
> -- 
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
