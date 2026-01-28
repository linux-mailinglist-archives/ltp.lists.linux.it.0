Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HMSET5deWnXwgEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:50:06 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA68F9BBFB
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769561405; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=hap8lkYIaBa0VHvpM6FlfB4awCOYzoDvHL7/61n0GRw=;
 b=HJVamJ7jYFq4tEqrs7YKWiU7CDOwvL1uPDcpLiudBZKkSIX3OykPNHlfpsSiLLndNKYRb
 FK0KjifhWuhe1JU4AwOYW+SakkEiCcqHVcwebpLGokTqWByKPVRtFPC7w/fFNnlhWUoyc4c
 C2aFagyJ7F9at5+l+S3JRBwPMgggJgk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3183B3CA070
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 01:50:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D997F3C4F49
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:49:51 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 14BFC60026F
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769561389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=emTTzAeqH2pcKrKeu0VV+uC6EKOyKQsgHpI2zCyEKFA=;
 b=YXCZADr3bWWAYtUF3P9GzuhA8qFnRvKfpkSI/ZkPbTXJLkM8GazZp2+45z6wsNufux7Dg6
 F8+FvFhcUJi0orAXv7q9sIzTm/Z/g8PLCyEYPVLXVS1VSxHfoRxGu68m54X/Pa9Cyyxmpf
 wj8CE8ndEr3Cb6pFCr8JdUoSRgRxBOE=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-5fwxzXzdOAubeFvK5YNeJw-1; Tue, 27 Jan 2026 19:49:47 -0500
X-MC-Unique: 5fwxzXzdOAubeFvK5YNeJw-1
X-Mimecast-MFC-AGG-ID: 5fwxzXzdOAubeFvK5YNeJw_1769561386
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2b74766fae7so5209358eec.0
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 16:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769561386; x=1770166186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emTTzAeqH2pcKrKeu0VV+uC6EKOyKQsgHpI2zCyEKFA=;
 b=AWJIyrA/B/Igxor+JaW0dYWZDzw/Uc2KVfV4ipkQvt4Q4zoyq74ef67WJpURI21KqW
 0IOeAV3Xv0l8uz3hCMMYqQXmTxNwA9wXuDJepPt/TFxi99iCzF/h1oxEfkLvmgLnBEkH
 D3WKworGqAk3bu/jtkZ2BqEaiV6mrGq3UCq0BYJSrU68WXhm8NdFQVXP5rfALF/R11iC
 sLe9R3uxxTVqGzudV8y/kwiI6r3Ep4L+sMj6GE2L5N4MLvktJHCcEFk3zoH77BJz3yPQ
 wRq8h9xOeexlJyGSqJtaJLbEHQjLQUI4gy3hLzkouc63OAFlt1bQ/7+/6fN7sKNOy1cz
 cQJw==
X-Gm-Message-State: AOJu0YxdpJOo6ODQo3KliAI1Tbn6OFUBRS16Yh7Z28ndfFe9rn9RpwMn
 Atsv4bX+BFjg+RT2GA37mDTLeU7eoLbFWPiOol824HGXWWE6hiJa+OySI19L4ci2QRIt8Xa3Ax8
 jaH3Ue67naP4PZwWxfw39hVY4lqEzqh3Y0Pbruirzll+JkN6HX+25QiD0PI8yMO8qbWpGzFPIYf
 wu1FRcZ0hLR63r+2PavD5EeZIIHys=
X-Gm-Gg: AZuq6aLM/EWpE8xN7D9Rj5enr8uNz8PIKaI3GZoHECXsxmvVW2mtJ0M5JfObujYTnsm
 e7cUBuvfCy1mSeyBawR0RqJDGzwD4hU0//7f8tTi0Qq4GygCR1Aw2ZBfOy8/QyBSM3EObW8zw05
 dq/lEUl+5gdwK8kspUAMTvYtXQYzx8uolySYmA6KETFJ3OLn+L6D4cp2U54CuVkQKYknc=
X-Received: by 2002:a05:7301:1698:b0:2b7:1744:726f with SMTP id
 5a478bee46e88-2b78d8a6127mr2179451eec.2.1769561385931; 
 Tue, 27 Jan 2026 16:49:45 -0800 (PST)
X-Received: by 2002:a05:7301:1698:b0:2b7:1744:726f with SMTP id
 5a478bee46e88-2b78d8a6127mr2179442eec.2.1769561385503; Tue, 27 Jan 2026
 16:49:45 -0800 (PST)
MIME-Version: 1.0
References: <20251113015242.799-1-wegao@suse.com>
 <20260123023635.29692-1-wegao@suse.com>
 <20260123023635.29692-2-wegao@suse.com>
In-Reply-To: <20260123023635.29692-2-wegao@suse.com>
Date: Wed, 28 Jan 2026 08:49:33 +0800
X-Gm-Features: AZwV_QiiHg83CWYHK8JWZujoh6hB8iD6e5NS6UTMNv4bwUSkPrYmU4Jzce0tvog
Message-ID: <CAEemH2cF23DAPeNr1qJ1arOAPjNxUR-ZmQ8ji2odoz6aWM3cDg@mail.gmail.com>
To: Wei Gao <wegao@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uq_StNTkdi0rHPqEh-HqSQIhFd06hopAnkyAK1HCYGM_1769561386
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v5 1/3] tst_filesystems01.c: Add test for
 .filesystems
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
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: CA68F9BBFB
X-Rspamd-Action: no action

Hi Wei, All,

Patchset merged, thanks!

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
