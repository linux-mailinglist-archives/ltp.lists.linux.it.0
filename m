Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN16F6YjqGl3ogAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 13:20:54 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0D1FFA05
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 13:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772626853; h=message-id :
 to : in-reply-to : date : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : mime-version : content-type :
 content-transfer-encoding : sender : from;
 bh=WcTapzwqSgvv9OKcJDfG5pU+vweE+ilX/PoGkJTgUec=;
 b=cMdFezChETAM7S7CBdctZg/O+2gO3u2rX6T/oLj7BVnUgRCdDl2ajJAN9TcnmdpRVBV2y
 e15D7+MHayV3VySdcPSUH8PDNQMFC+Kb86+8w0qXxUFNQ06zyGt/krVLJCpczymAczhpU3g
 NLhcPt9iSy6Il9tVDgBBjXr3WL3YXIw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BD583DADA4
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 13:20:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEB263D0722
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 13:20:40 +0100 (CET)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 62050600A75
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 13:20:38 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837584120eso50314995e9.1
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 04:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772626838; x=1773231638; darn=lists.linux.it;
 h=date:content-transfer-encoding:subject:in-reply-to:cc:to:from
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qSCnLV1cuiBFLi2Vm+AZaC5rczr439vt6oI1MVIoj7Q=;
 b=GnrhaByWMiegfcPGfnW1khtULAghY9bmYV6hmGzg3qPNOtS28b0BIW2oX7SW6PbAly
 igUSS1Qu/ghbKUbcYGdrmqZq6vqYxhC4sTTWNo5DkQPXPNx3fjyxgL6rJxO9koTrSGgf
 uzieucXnJ3DM52f65hEOWrnX0nEjNFIBhYNTrMhfgf+XWHQ3RJGN9hp7NtaghdC4i8BA
 WUV8OcRrDF+IWol7pbFSerwS6MEt5V6JxWn8mju1Y2ciq+vfedxA+pmmfKnEJQ4Lkb3e
 cm7hm79I3NNaoBHU9jd0K/di+ryEleXsudGuKWPkSdwRkzuBCAxrm+FIkXXgdaGNrtDs
 H//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772626838; x=1773231638;
 h=date:content-transfer-encoding:subject:in-reply-to:cc:to:from
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSCnLV1cuiBFLi2Vm+AZaC5rczr439vt6oI1MVIoj7Q=;
 b=FL56BPWWjjmE4EZPXk64vouD7CoKRyGaV/Hk8yZsJn1FFv0qXVT5G5MHLHXce2wRUj
 qY7J8C4ecQWTqnZ/nOkFpnft4pUTeTfAOOo30ev0+A34lFcSF93Q2tZDmkCczUU3ONYS
 rZNMpCxDvRwlwN8Fsr88M+/otQQe6V4WwVh+L0hLHMWT0p/KbnBLZQJhMFNZMgjqw3zA
 kqGfpc1jtYqzl2hF/qfA0cmEJo0nTx3ecWcXb6wspaRBLdSgu7Uitk+QoFUatR5IGEeV
 x1ThP8St4E4ndQVy5spk0iptREfOx969UgcLbbafD3A82tXPXjp4Pt7Arvo4ekWGZzgu
 2UTA==
X-Gm-Message-State: AOJu0YzaJrHwea0+fHnwTs4qINHoqJTTasoABXk0/xzD4526RmdTqbfZ
 Hk89AlOcot0qIB/aOMvPYVVmn0Zurjhc7QCK094fgPB0PlcHM0HNuD1vjxc+Lj+z8kUiixPoUFZ
 aWtzK
X-Gm-Gg: ATEYQzwqTYxGudYtXdjNST5gXNa3hEdzVr9+KngWrZqe1QUW4gIcvTHoDrWdGYqSW9o
 hEVnqjCdRbLeWDjJPgmWBZHRhQOScCl3zpPuEbyXjnMiL6qe1euu8YWHwLr2GRD5doWZkDTf7Q4
 d79W3xjRkCs4aTBUHCe6ub/n4v0FuLoXeHQE1hC6xkHucZH9LMWN7burDiSuoLRhQkOAXR7Mo58
 p1pBlVWg/QYCQlmOIUeYbVKOhAPKwXSaF3qlYZtnfnBs3ZYWNcMhcUpCX8eiXNahecROtgzsAV1
 p8aRKgk8KTH9uEZ64/6DCR+OwP3Y6rAn32vGjbEoZWMIIplRVfmfJ/7yijcV7mECYE6tVwyZsyz
 I7Xxn211Iuj2YuSZcR3qKu8MmvQyEh6SnFcSCePOHjS3g2BOsZNJCrrJXLMr3IuLMyCGDWbgYJQ
 TCBt3xRoj7C4rVR8UGrKVn56YWGdul4rDIZU7D57hf
X-Received: by 2002:a05:600c:8b4c:b0:480:1a9a:e571 with SMTP id
 5b1f17b1804b1-4851987fdbamr27880925e9.22.1772626837688; 
 Wed, 04 Mar 2026 04:20:37 -0800 (PST)
Received: from localhost.localdomain ([88.128.90.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b1b97927sm27896704f8f.28.2026.03.04.04.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:20:37 -0800 (PST)
Message-ID: <69a82395.5d0a0220.169c6.3c45@mx.google.com>
To: "Cyril Hrubis" <chrubis@suse.cz>,
 "Andrea Cervesato" <andrea.cervesato@suse.de>
In-Reply-To: <aZcCrH2i_KFhonAG@yuki.lan>
Date: Wed, 04 Mar 2026 12:20:36 +0000
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/6] Add safe macros for stream testing suite
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: EAA0D1FFA05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,mx.google.com:mid,linux.it:url]
X-Rspamd-Action: no action

> 
> Otherwise: Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Just one thing about the tag: be aware that `b4 trailers -u -S` command
that updates all tags trailers inside commit messages will use
`Otherwise:` as a tag (lol).

The best way is to keep trailers in a new line.

--
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
