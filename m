Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A/jHfj1lmndrQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:37:28 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2009B15E549
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771501047; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=rFldd2edhXj6irBsBoPXDZtSCxo4gNaCY5a/LWtM5gE=;
 b=P1rxzduKDMR9PwvjG2kDCoTYouHdKAqwYSAPya6u/HNXMFkDrr0hWMCtJOiTwMZ6DAj5u
 lJrltR5DOAsBIqdbJMWKxS0zDttRto2imb0dr+JZDJ1FmX44EaHkICm0MYxI9jJE5zVeMLX
 t238sivYrTAiGuC/b+zoQ950r9Xtql8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 956183D072A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:37:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4DD0D3C634E
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:37:13 +0100 (CET)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F3789600A0B
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:37:12 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43622089851so798699f8f.3
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 03:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771501032; x=1772105832; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyXKRau4Pj/ZC0vj0ErRofWEsr//FFsO2BROI2//fwc=;
 b=al2HM7h8XXMoaC62FbfElY0v4CNBxtOVwHkNRqf2nUzG2cIMAyT0DkMRfcbFCtkobP
 K5FMLhcD/2+11lr0HJ1+bOzfLURtSl5hVUg6fiidjyleIWpWP7rVJaoiryoVqG/SlFZE
 hGYqkt+J6bVARhXK+M0ojV/NUFxENpv4OAJ4meMldfdF895XNdPECRIqm8Vyh7nuS0gh
 d4lfCj3C9JAIu6mUCicrxESZJj+g0Exm+G1ErxHYdln9CdZUpdt9eZP/ciFxXYhN1ZCt
 +OFDn16AUfqU6B1cGWCIkLKYGG63f/otmLvJdOu4YM2gGjiubP6Pn0bFbWVKkOgvnfoX
 RgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771501032; x=1772105832;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LyXKRau4Pj/ZC0vj0ErRofWEsr//FFsO2BROI2//fwc=;
 b=kmTXMtJN0G5K+7VNE4v2ttzKr5S08EFFv7xk8Zn7lB5vvGdznKmf90yngkfNIZyvG0
 HGrtNYj+6B99dqV1sVBfaA8ZR9bE0rUlP3Hjt4kvtQ0KVkvXVgQvkVvBVCWmDwgFgVyu
 fwQfj95MZ+PcWdFZkt2ILOfgSL2kJAa4QvBzuionWJlsboNw6Y2+X46c7u1JEhttvcuu
 JHlClF8skluPPdy18gpsccvpojLoB6vdRc7aSu016SLIXNfGnFUCmrKCWEaO4WlEzPJK
 DJqJGAql0xp3PPHdTOFWoNxyExBquMx6Qleg9shi0qFnPsEbb76twtQljZVQzR51jwCC
 Ux3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbOqwlMW0jDafpJMO3gCXOJLh8HzkcA9G2DGHKODqUe3HAU29XagBO2UWYniYePVu9gIU=@lists.linux.it
X-Gm-Message-State: AOJu0Yzj7jGWXTDfKyfIGo5z8wt4FqcbqvOlGrXrDG5P0CX6Lguyn0UR
 +apiFRtBiCgeeMxfnUDg8CvHS8AjDCU93ufg/ltwip6eWukPcOJu0uRPSVsGideD5c+ggyppHQ4
 ZVpkmBxM=
X-Gm-Gg: AZuq6aJ9zynz36l27RSCWPwOlNKj6kE9cyTqLi4QgAv5jcPjynCXuCF+2TBiQK0Tmjc
 WNNG2Lpe3dKysmm3p3VOtunplOYutwb8tr4T0NLm+G0kFaHev9tOviPpiL0L7zdDtZU/HeExg14
 HGFGBUj3ePyaz4g/5n2DITW75mB3se73TeYMcyHWC0VnA5CfomcOTEXcSSwy4Hs2J8s1fQWCS2O
 HIoFPVECs6WBfPHy20bUOOKydZhQCwdUDaW/DnQbTBqKgTwlbCFDG+bJRLRuzT/Hc1062zEjLzI
 aEGN6fa4ZFmzRyMm9fdot95JEeTphYK2s757TyFxlHh0U73OwSTLz+MTFqkQiYbvAHuqkd4ZNCY
 T9pM+DQ8yZgRdbHiZspSzpIF1TOps8Mo33cFl7PeiPCHv544iSspa+5udszlIIFfM7N1J+DJxr+
 KJh1zK/1ojCPr7Zfk2bqJ0QicE
X-Received: by 2002:a05:6000:2384:b0:432:dfea:1fa8 with SMTP id
 ffacd0b85a97d-43958e500d6mr10052332f8f.45.1771501032335; 
 Thu, 19 Feb 2026 03:37:12 -0800 (PST)
Received: from localhost ([88.128.90.50]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad015bsm49610996f8f.38.2026.02.19.03.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:37:12 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 19 Feb 2026 12:37:11 +0100
Message-Id: <DGIWPEYYBBF8.YF81SUUGP6QA@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>
X-Mailer: aerc 0.18.2
References: <20260218135026.159676-1-rbranco@suse.de>
 <DGIUIYEL9H07.TK6CF1O2WP7H@suse.com> <aZby3eA2UvAnpWzd@yuki.lan>
In-Reply-To: <aZby3eA2UvAnpWzd@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] userfaultfd: Add test using UFFDIO_POISON
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
Cc: ltp@lists.linux.it
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url]
X-Rspamd-Queue-Id: 2009B15E549
X-Rspamd-Action: no action

> Technically all memory is released when last reference to it is removed,
> which happens on process exit. So no mmaped() memory is not going to
> leak.
>

Yes, still, we should make sure that it's released at the end of the
test. Same for for malloc() memory allocation.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
