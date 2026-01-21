Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOIZOzeKcGkEYQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 09:11:35 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A73534A3
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 09:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1768983095; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=RFnmAFvgAtM8+b2xILSWg8cOw8top0/4Kqin9dKQsKU=;
 b=SKwAD74egl4ZZFNZjy5mXRCKYNjyw9i+qtc/f8IMAQy0M1mhhQheNaQU1VfltEOcE6/8z
 TrStDHR6vrbpy1ySX9zyHz7+BWMfKTr+IozN9XJ1ksvCfiKfTt6D5Sj9ySXnPNWjyoRkGEa
 F82nwAAGbt+ohnEsMFHyZPYjCpa6bv0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 011923CB263
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 09:11:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C80D3C4E26
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 09:11:23 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DD07B2005F1
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 09:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768983081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lR+ZsMvTcy676j2gVaj1t1NYc9D7Tn4URB67zLsA/Y4=;
 b=jEpM+QTbjPET55H7xCqtWMnV/xsZiLwNbqvxkEFYn+e+bgd3rkCp+Msj2+GhuIgWK1uinC
 AyLn6gGhpo/T82GfeGgcWZzuzzIR0BKGNqbkXZVaFFNA4X52Tvi/f1PYeZm2yHgdz7LxcY
 1KsBQXjWttNCileSk3nJncTvkkUBsK0=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-_cUSnehNOE29rlCzyPI0XQ-1; Wed, 21 Jan 2026 03:11:19 -0500
X-MC-Unique: _cUSnehNOE29rlCzyPI0XQ-1
X-Mimecast-MFC-AGG-ID: _cUSnehNOE29rlCzyPI0XQ_1768983079
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-123377038f9so2283600c88.0
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 00:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768983079; x=1769587879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lR+ZsMvTcy676j2gVaj1t1NYc9D7Tn4URB67zLsA/Y4=;
 b=n6Il9h54RB5GrFk9JjGuqvE2Vy7vsbSvSg68G5Doemdd03wQbx0hM0xIEPuFaMf1v1
 OVhlLFwqhn5UxLPPdhlVYCTQ9SqHMPcueHL2fDlU9gE9Xfd30nayYqvo354STfrl0HBU
 1+J5GKDbGPAZqHbt2tTeukv1VA1hxsdE+CHYDtVQUrAzqRdcN+USbe5dt8QnxBNhPfRQ
 w7iL5fadtKthreeOxApReXc7TRIwXFnrjDmpzd3NUmhncmFg8OM1aq+wu4Q2wkS3EFM2
 JfHxLjo/wTTnJ4H/MAGKHnmG/CU/fCUVKoBqRP06kALxiE4ykdLS6Epoe6e/j7eJca/Y
 ZNmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx8wRE+W7e5lqQG2EME1AadmgYc9dUVE6vkoWwqM8YT+MnOMn3jUKOMDNYHXAspPu/2G8=@lists.linux.it
X-Gm-Message-State: AOJu0YypoHe35u9nQVV6aSOa7HGj7t7I6N1QbB2nNw/aHOTjRIIl8DzT
 mMIm+jymhpfppCkV3lVh1H5jutzv0DLK6JXYaC/qeWfdJG9BK3oZeK4C/CVQONWF+q8dUmnnKib
 B+qKy6qGsu1VnyyJpgjdL0Sn2ery0xNIDI9kI8I11zRRNGUZo9/57B56qLsCZGx2XSmcuMavurm
 VmWIr7FL8nX4W8zv3v7IcTbnX/jcM=
X-Gm-Gg: AZuq6aLKVwXC/KRlAgZGAroC2fK6uWs+S48jjs37wl+IQ5ga5CQi8dD7jsmoEcQy6nD
 NnmoPHCP7eBNrS+lcw4jqHp7tV4PcswjnecWQJx8embcyHFS8MydNgWRwLZxmiyFORsDWRT4CzT
 4P4jJZW5lEpUKNVkxGG8o3qGDfKl3PtelMJCzAe7LLWlBrZGcx8izGzb9jYDde1ZnTpmA=
X-Received: by 2002:a05:7022:48e:b0:119:e56b:c762 with SMTP id
 a92af1059eb24-1246aadce8cmr3001741c88.39.1768983078656; 
 Wed, 21 Jan 2026 00:11:18 -0800 (PST)
X-Received: by 2002:a05:7022:48e:b0:119:e56b:c762 with SMTP id
 a92af1059eb24-1246aadce8cmr3001735c88.39.1768983078289; Wed, 21 Jan 2026
 00:11:18 -0800 (PST)
MIME-Version: 1.0
References: <aWmqFAzdtsR0t5aJ@autotest-wegao.qe.prg2.suse.org>
 <20260116070708.GA556902@pevik>
 <CAEemH2foRNfQZt2mFRdR364=xB8db_qjd36pM_ce+EKpJOAhkg@mail.gmail.com>
 <aXBSqvZ8OVP39wd9@autotest-wegao.qe.prg2.suse.org>
 <CAEemH2f=YMZOmHJAzDUSxekzZ1Um9tJzFQ_d3crMZ51L5aKJ2g@mail.gmail.com>
In-Reply-To: <CAEemH2f=YMZOmHJAzDUSxekzZ1Um9tJzFQ_d3crMZ51L5aKJ2g@mail.gmail.com>
Date: Wed, 21 Jan 2026 16:11:05 +0800
X-Gm-Features: AZwV_QgT7sO9eMJaXOePW3PUhLOUbuezDP6V9TJIGyowUkEPuhf81vFai31v6OM
Message-ID: <CAEemH2c5H=w2odXJc8=a=ynNubMV85QTLvSweWTSz0gjfvCduw@mail.gmail.com>
To: Wei Gao <wegao@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VddY_Inv_IC78G2a1Cl5tyop3a7DnUBEAopD5QuJmMM_1768983079
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,picard.linux.it:rdns,picard.linux.it:helo]
X-Rspamd-Queue-Id: 50A73534A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > Yes, i guess we are still blocking on i386 scenario. But we can rewrite
> > parent TLS's base_addr instead of switch new TLS, this way is correct
> > base current kernel's logic but still need further implementation.

Oh, sorry. You mean only rewrite parent TLS base_addr.

I guess it can work only if the new base_addr points to a valid TLS
block that matches the runtime's expected layout. And, we need to
construct a real TCB+TLS image for the new location.

However, it is also over the goal of the CLONE_SETTLS test for clone10.


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
