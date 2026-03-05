Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCFEHNnaqGnGxwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 02:22:33 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD9209C5C
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Mar 2026 02:22:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772673752; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=ymuc8uhrvYca8uC5cHIvs+c16HAcwlrpUZd5sQRwiu8=;
 b=YQS0n0mKlT12uVHA/8KExbEZ7RxDTOysfAe6dVl2JAaCpUlCLyrV8fylJRxJWWGknChjE
 ZxwRu9IodZbrStNKI5PzTZn33YqGakHGjkEWW6mN6JLLflDRONx1EHoYOx+4og8xI765hWh
 hIKuUQWv/Vu8lkMQB/2HVkWxvYxvdQ4=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 832FF3CCB48
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2026 02:22:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8BC883C5DB1
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 02:22:20 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4D216002AE
 for <ltp@lists.linux.it>; Thu,  5 Mar 2026 02:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772673737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2pDKlqRuLyCWTYFYlFhLAg/wViYsapWLjOhPOL5H7U=;
 b=hohLdRAWVr4rr4f2PB9O0lrXxVvORKxTGd3vibL6NeBdnCdypVa44Mc4C8f6oTfSXTzL9l
 quK4Zn5abSU0ui5TQfYfd0jh5c8zoA6joOLgiE0WWcvNtKtw+qra3RKRuaay7pF6oAX+Ft
 MdvnnEkGQ/x9bsh51kJfw66PVJWHHjw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-CNaC7nvXMVauc2oaRSDZRA-1; Wed, 04 Mar 2026 20:22:16 -0500
X-MC-Unique: CNaC7nvXMVauc2oaRSDZRA-1
X-Mimecast-MFC-AGG-ID: CNaC7nvXMVauc2oaRSDZRA_1772673735
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c7385e8fa73so461792a12.3
 for <ltp@lists.linux.it>; Wed, 04 Mar 2026 17:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772673735; x=1773278535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2pDKlqRuLyCWTYFYlFhLAg/wViYsapWLjOhPOL5H7U=;
 b=O9voCviQ//iwo/HBzm6kJ7jGYumGeNrNEw0/yxT9w8Y8UQ7FjHb56iRfmfm4HaV+FS
 7+Est/DJhexC5Apq22H4Q0zml8i+ZkrdJE4+TZ/BBdtWcPO6SRcmqz41puuKatiQzd5l
 zRD2hWTNljox0yZBtzcxAt5OKy8KPSy/nSD3ah3D06MVMoFWb40o+ePxdtwRkr20cf5f
 HfNRLT02VtvL/Agwbm9GiX7HFq043UoBg4JvxQPfHPS35aGvufDPI3gmAcGn+OSApyJA
 BSMdlD5Ubb6b2//ZYHcuO2y105Og6MVV8ujCtZHuKDVwdfllG3wYoGWXJons1NQ7ivR4
 NG6A==
X-Gm-Message-State: AOJu0Yx47kO+aQ1e75Sm5ChkYXyQIvbxLbzoJUS1GeJIOBTxo18NWvIy
 qnUnKRhmkFqOX9IIZKGq/i7tHfe3f1efwA6QZYgb6A8icuCcd4/jVBUDHfu9CZK8pjasojSmna6
 tVdxFzvvbmhLBl5yHA5F2wVrozkpf+3xzm11xe1U6KZKb2QjZzmNh
X-Gm-Gg: ATEYQzy7l5yEBjG5AXEb7wHzSI9b8MArVndxM/Y2gXsINJqxdpn9WWrXgRuZLgMkgog
 +Qr5vx/OaYoQ+xZUkTCOSM3nQh7sMzKjGpP3f1kSdcgZclTfiVb5trsRjw32le6ps5SZ4qlNWsY
 BzAYbtXjCOIFxK9vWyUTCfsbBy73KzuBcZ5OPBnRL1CSJtOErpEv39rdK5bzugD2iiAXJ0wbzj7
 evpfzbAUBpWw7LiQa+8pKZTU6m4m79GWQ5CL3Fvu/HGbvB5SOz/vRhzNYSGJxD41XKX0VjZFdmW
 J6gw0oawmDNH7MVhpvRoR2kFJKQ5KX+bg+VLwHcnDPDssTzFjwFNt3feqjfl9oUY8vt0PK0NK7z
 q7myNh6F1YTXV8lWs
X-Received: by 2002:a05:6a21:6b01:b0:392:e6c3:7426 with SMTP id
 adf61e73a8af0-3982e22aee6mr3831133637.62.1772673735359; 
 Wed, 04 Mar 2026 17:22:15 -0800 (PST)
X-Received: by 2002:a05:6a21:6b01:b0:392:e6c3:7426 with SMTP id
 adf61e73a8af0-3982e22aee6mr3831109637.62.1772673734906; 
 Wed, 04 Mar 2026 17:22:14 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7389126194sm1040892a12.24.2026.03.04.17.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 17:22:14 -0800 (PST)
Date: Thu, 5 Mar 2026 09:22:11 +0800
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <aajaw0f7H-iYqviI@redhat.com>
References: <20260304034034.59303-1-liwang@redhat.com>
 <69a7f940.5d0a0220.27e3ef.38eb@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <69a7f940.5d0a0220.27e3ef.38eb@mx.google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: II-3bXyI6j4Tupy9DRdz0-O037cPBJxTA1LzJIhrVl8_1772673735
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 1/2] lib: Extend -D flag to support multiple
 debug levels
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
Cc: Li Wang via ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: 0ABD9209C5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_MIXED(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:rdns,picard.linux.it:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 09:19:59AM +0000, Andrea Cervesato via ltp wrote:
> > +
> > +Suppress all debug logs if no '-D' flag passed (by default behavoir).
>                                                                   ^
> 								   behavior

Hi Andrea,

Patchset pushed with the typo fixed, thanks for reviewing.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
