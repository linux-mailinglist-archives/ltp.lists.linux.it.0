Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGRdJ1Aod2lzcwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:39:44 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39210858B4
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769416783; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=y0p7xz5p6gHKZyjIp1B8YvwwJ88R2oKSvQzLpv50jIM=;
 b=K21JBUyNBR1fxvVunPgIeMIvgaXpNZt5yTZE472oT8ZB1GvMrLcI7BpAiYW9uwPty51J9
 TB6n4rGmTL8T/2t8l5da4if8nw5e+lNf5l97tG79c825h6IykzBZetk7f33cCYWVw9Kgqo4
 tYv93aPCOB5NCaT2T2PvYOGb/8itrHQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66CE23C2BF5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:39:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F380E3C096D
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 09:39:32 +0100 (CET)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2E773200761
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 09:39:32 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so6141935e9.0
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 00:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769416771; x=1770021571; darn=lists.linux.it;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9rhhBZto6YhQQ8u1C34o+S2mN42ueKjNviFG3wsds0=;
 b=FYygaLOylcwlmQFzJusis6fGZV64Pqe/1GQFahI7f2SZQWuOYHWg46cbIxTZhjf8ow
 OwaGVKeHJL2OleIvO3hkX1QobTW0aovrYoNKSq8uWy0R9z0jiqNlmXQGqEY68PJneXYy
 CuQGf8YoIW83A818JGBW3V3DRKe9MBP1V8Ccq6l2N30ceZ+OWujVAAz+Y2ve0IMVDi1I
 cvXIrRqb5MX4A9Felv0nb0CPGdSyOwi+5tsGiGEFcKHoPvfIR0CrCcoui79o1Knk9UDi
 gMeyWgRUQ+QckK8rTsjoWhaI9fxKtyJWCxOnORzN9/ey88qenLj8X5TsGMEis6gienCf
 4gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769416771; x=1770021571;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9rhhBZto6YhQQ8u1C34o+S2mN42ueKjNviFG3wsds0=;
 b=RQQ7Za9c358MOWefT/s/EtQkuZsOGlnCLHUx/DvszwuCi29EwwdeVxvCBW3MI8LL6F
 FWq0nN8jrdJTgGSNwGb5J/v3ldqlf9VoxtTweNI2B6NOlasHyi01hTGrdRiptoGwQWmd
 UGfOOIFyiY7CG9FHcNb1bAu2Ccn31ErLEwnD9t7Xab1DbOWsoQlp6GdvZy1o5bsF2PiD
 ezQmHVXrf5qwQp9cyH6NIl4+IoyDyHmHkSc5wiUEwBPSx81beN5MmN0LgG9po8a+8kHv
 oR9sBjifEZLnqzpYV66LJEb++s7iPeLG/KnHI4Emr6f7EItKzca8y8qmfISrTqfbISaf
 VXOA==
X-Gm-Message-State: AOJu0YzjStyFfYiymGA49nZrxQUB7vRGpXkdnsQqTjcWcgAuquBFWWME
 hwIdV0XOp9yxoHDs+9n182UdrUDPPyqf8mGW+SV3OuDKzKHttLUZjj9n4BoLFrjrCzA=
X-Gm-Gg: AZuq6aI5Ep8haaipR45ZImn8dpXyF/5XQW+JTVDnh4OQFD7KBEDYzwnSBsv/3vG8xLn
 y1AXQ6hcGZEYCZfNbobVUGxy1p+Yv5my1thUAp4yydexvh1QmizWg0xmaatf9jdDgQgCFA6ujsw
 OCz2sUEfN2DWxsp+m3C5ALBHoeFyVLfitbPyLh7OMkT/ltrOVn8w6ytMzPhC+SGqGzgYnRqs2FL
 SFY3RpKr9HEsNMgBNQ0w431T/qWS1reCZ5h1Z69la/qidhJtWvNzE8juoq4e6RhMBZzBe6iHSSO
 oIm+9zWYxS6pjf0Di8FmdqnwzZIZwymfKAQLdzaJohfKziIT/8QlmGFipE/6b2yM+xqOftJPJDo
 VUBvZkrgaYOIcBnanYyezVQjUOJUJFRY7l9KtVD4p0I3YSBjiU/YjlhmFG3oc7hv0MzR4ZF/J5x
 8pAaxCKbltsP6Dqv4gqioACLzrZVAvpXP48GsPF3PQOm6AgUxYVeLgGVGIhwPDJDT97XTfiQ/G2
 DWNUL4=
X-Received: by 2002:a05:600c:310f:b0:475:da1a:53f9 with SMTP id
 5b1f17b1804b1-4805ce4253cmr58517715e9.14.1769416771493; 
 Mon, 26 Jan 2026 00:39:31 -0800 (PST)
Received: from localhost
 (p200300ef2f1649001c626999955e52c8.dip0.t-ipconnect.de.
 [2003:ef:2f16:4900:1c62:6999:955e:52c8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm461925485e9.2.2026.01.26.00.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:39:31 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 26 Jan 2026 09:39:30 +0100
Message-Id: <DFYDWAQTUSSA.PXU6P9MZPDRW@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Andrea Cervesato"
 <andrea.cervesato@suse.de>
X-Mailer: aerc 0.18.2
References: <20260123-fix_dio_sparse_slow-v1-1-65bd0dc0d52f@suse.com>
 <20260123175629.GA358728@pevik>
In-Reply-To: <20260123175629.GA358728@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] io: fix really slow dio_sparse on certain systems
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
	R_SPF_ALLOW(-0.20)[+a];
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
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:replyto,suse.com:email,suse.com:mid,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 39210858B4
X-Rspamd-Action: no action

Hi!

>
> LGTM. IMHO good for a release.
>

Should I merge it with your review tag? I also noticed that I forgot to
update the default value in the test options. I send v2, then we should
merge it if possible because this issue causes test to complete in 4
hours on certain systems.

King regards,

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
