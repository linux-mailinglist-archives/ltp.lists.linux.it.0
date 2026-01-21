Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE6yI0/XcGkOaAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 14:40:31 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97257A39
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 14:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769002830; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=iq3uaiTorGm/JloeU1edALHfc3Vm4GAMrlF2knFvZ+4=;
 b=jSSKxW9EbC1kwKh9qe6QQPWI97ZWForZz8El0CSnr5FYKXKr8+wXvzoTu0Wg0bBAjTmmm
 uBbrgKLpiNBBpr9u+Pj+eusaYeVsrBHLWdfm9rOSG/7KbxboPQHaeB7aHbghmKmiLqM+WoW
 TPxiLVDUjMpoQ4L6XVeHTZNcHsUHYY0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1E3E3CB296
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jan 2026 14:40:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E3CE3C1455
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 14:40:18 +0100 (CET)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B165860056F
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 14:40:13 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b86f3e88d4dso1142014266b.0
 for <ltp@lists.linux.it>; Wed, 21 Jan 2026 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769002813; x=1769607613; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlqsXJ9m/h89hQyKHasQS9Fl+V16b5BDXViVkzTxXRM=;
 b=GvIT+eTjjU1uP1cBNN68rjyNVJUyEYYFm46cNThxdYk+CKD7orgSLEbbHv91a/sLt0
 RFVBa2YGraM860bYArXTUs2pAXPJwzHSvpIeAkIAPsHC4FXFMbY42yvqLC7BchznB3lt
 4HFGWifjumKTaa8fQECg5mfLJXOqof9e9iILcyFcaqwOQM4BTw3AvhuQiW9CBKE4OtNT
 xzc5uR8hD6QiqCu08H5wE9bDXyYJvkYAJ9jy5ZJxCKNRM5ovVzx2UChQLBEeVYw617G7
 uO95wr2/gLdm+yMURf7HAx9qDSkmL8rUm94ndOiOCot791M1qmAzm8O/7tzM/+N7HVlP
 uIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769002813; x=1769607613;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wlqsXJ9m/h89hQyKHasQS9Fl+V16b5BDXViVkzTxXRM=;
 b=oRkHdkYNdHg/xDxdiE+r90CUbWxEWG1L+Ktou0AXGZUzPmbU0Ionx2wfgaqmNL1JC5
 +sVhAjJNTKD28asahSs0SByCelLkRy2rk/RS4qCEbpl7X+Dw9PtKxmowznMT07+hsnEQ
 gtcde/9koB6PwNjj5heCN/vOmOvOi/ATY2rPMv9B0O57QSR65M2o/Z6D4Qo7DAh1S3OC
 OjU9fxWMX48WDrFUDMGOwb9v4PpuL2+3T2VF7MSFvbskDVFNjgNR7r6gFlUoRPKhtdxO
 ltORhaSoo6Q6+/KdDqyUDS5I9iSzqA59BHvuW9d2GO3ve/q4padEbCy37vraeruRr6EA
 7OGg==
X-Gm-Message-State: AOJu0Yxi2d6oeZdjZhWWkupk9UKKLoEDtAzVifj0LYHJKyUEvZzg/WyR
 UBt7ziEy1q+UmAB2/UUsTVzoumy1khDnEvxaCEt3ln10dedsHvWW5ClcYPF2US3vHug=
X-Gm-Gg: AZuq6aJpUPtw74HRqr1X+Rd3aS2L4IPGEX6Dqdci0VoH8Owov4J29UJREH+du2L2ECH
 YhcqNm0dcW5M1yEvqBdMzo463gaAmwgYG+IYPefvv2N/LV6MtcQyirNQzIPpxqaSJXuGytmV90L
 9yq87UGWVSHjah3SWlfssyMVyja6SNCq/9Ap2WHJEHfk3I9M/ERlYydWweshnWO1QZA4fdt2Juh
 kQA5C/c220an7CDYU2/E4b5//J4KVqqbhHN3OF5QG7oRdqCNe6/jqmQitLLFmMC+yxCa4XxOA7e
 jTLl5mprty+MgsLkOVeF1fuQIK3/yoDpxpxZnfXLoHdtuKueKW8FKGvoHwXYDA1gmKjpCCjsxv6
 v2Xq/YiXeWZDO8osL8utZGvAQ7E9KPJYSoGhqkBoDBXAkiJN3vsrcMjL9thZM5EzQpEo8RJhItS
 ZaHadNh0TRWvYxy2hBd14oMUU7qZZM3Yr8E8cNbvJsOZDbsvlhjv/wjFK6s2ME0UJqysPtneXeg
 JCw
X-Received: by 2002:a17:907:846:b0:b87:6f2:a486 with SMTP id
 a640c23a62f3a-b8792f79ecdmr1743526366b.31.1769002813041; 
 Wed, 21 Jan 2026 05:40:13 -0800 (PST)
Received: from localhost
 (p200300ff0f0b7b017e458f16f8082810.dip0.t-ipconnect.de.
 [2003:ff:f0b:7b01:7e45:8f16:f808:2810])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a43679sm1554904966b.70.2026.01.21.05.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 05:40:12 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 21 Jan 2026 14:40:11 +0100
Message-Id: <DFUB5SSVMTV0.2LQBMY1Y0VN8H@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Andrea Cervesato"
 <andrea.cervesato@suse.de>
X-Mailer: aerc 0.18.2
References: <20260120-file_attr05-v4-1-7cf444e3c7ea@suse.com>
 <20260120185847.GA65442@pevik>
In-Reply-To: <20260120185847.GA65442@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] syscalls: add file_attr05 test
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:rdns,picard.linux.it:helo,linux.it:url,suse.cz:email,lists.linux.it:dkim,suse.com:email,suse.com:replyto,suse.com:mid]
X-Rspamd-Queue-Id: 2B97257A39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 7:58 PM CET, Petr Vorel wrote:
> Hi Andrea,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> > +static struct tst_test test = {
> > +	.test_all = run,
> > +	.setup = setup,
> > +	.mntpoint = MNTPOINT,
> > +	.needs_root = 1,
> > +	.mount_device = 1,
> > +	.all_filesystems = 1,
>
> > +	.format_device = 1,
> testcases/kernel/syscalls/file_attr/file_attr05.c: useless tag: format_device
>
> very nit: please remove it (.mount_device implies it).
>
> Kind regards,
> Petr

Merged with this small modification. Thanks

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
