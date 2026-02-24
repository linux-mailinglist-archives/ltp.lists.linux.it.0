Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKbZIZF8nWmAQAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:25:21 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A401854A7
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771928720; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=B0xkG7D3PITqplcFDMEdRWvu/jqPZtgpjyXl6ggGLmE=;
 b=pXu75BSLCo5fdMzpplHwNHGke4xs97Pp3zclG033Uewn+0+XqvSSmOoqe2zFU2XVWu7iO
 g5lwUNAqOIdGmna8IUlh2sATxriX26kzbqBAOZlS9WwTDv9CsZ0l40VkwI/3Nhtf+JLFKIg
 7j7ubhFM0W4pkZ8LZxaV8MEJLE6qr5Q=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C53D53D0F8B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:25:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 123533CA177
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:25:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 79BCC1A00812
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771928706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=K/APggTSF7gAEh04FH0/93Ci6+KLo/QZNMNaK620mmBtUJGfd8pMIkPtaGeRrwQpBYzPZO
 795fIX+HL5jXze/me8n9stSf5WUYq0fx80T/M1wz6kPVzJtuF5N90blwphATLwdwRYuA+O
 Yy43lkMZoRTXsU0O+4vdnXHK2ZnBGu4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-a0dBfnPsPkuDU14HOgFlUA-1; Tue, 24 Feb 2026 05:25:04 -0500
X-MC-Unique: a0dBfnPsPkuDU14HOgFlUA-1
X-Mimecast-MFC-AGG-ID: a0dBfnPsPkuDU14HOgFlUA_1771928704
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c6e18b8fe1eso3936087a12.1
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 02:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771928704; x=1772533504;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=m0z33A7lKctF22R+ZcPAyUTbs53trEwSY86fHV3Fv8iI/nhvUklSDPI0byQ48+M7fg
 KXkx9yx/6DPJ8R8YbYKzGw7dzrsms3uznJfpLf83PSOSShrW3rPYom8/dqoyAc5VXvjr
 IuYOAzaP1aRshfvNrUjq3M1VJUx+EZLRwHZeaD+uqYVozJqo6yg5m72xYwgDlU2idagP
 uYnXEQWTcNT3NiFuoX5IF2gyLAfZmVZ1KVp8j2ptQJ4kZb8W95ZSlZiaJ/LyrWy5Ys+J
 qzW8btBiqhFmtMmNRi5hRrPBG3ug7etVyMYoyPny2WZ5yw8bJS+EJqTNiHGXgwteZc8I
 tDBw==
X-Gm-Message-State: AOJu0Ywg+v7L9YC1uoRYooGeA/XyfdJTQKK/sAlz8L9+BLTzoMIBODrd
 H32mphrvgU5z2fY5B57g9loikk2S6BJtpf3eeSertpAA56rXDfoo90vMdfMgNwS7rW9jXLTvous
 aawo+SkvhlU5s9IcVHEp0ef4OyamI3IEkmsYlgbOteU+cgZns24mC
X-Gm-Gg: AZuq6aLIp6Bj4nOmq066R3+oesaBMGuv30Ug/jUP2qnwgDCFzdW5HLnECAP9xrHyzHS
 J+Yr9e1bOxxbOrqAXY17M02/2q13Wvq41BoNr3ERTcpCpOtd4u5qw3ONyhTYQrP0D+c1hjdjlEm
 nwCftSNEHMvJqO6v7XBsUV3y4n6GJDxIi6/lzRaX1IIUstzWpu5kRAPjmOK2mcy9xkjqN+Gtn63
 Cduf1/YdRAel9TUJm1yLtFlzy3MOxRMJRsAHKfiJEsNEqkCjSsmarTCg5Z2WRySOCO3/zsIHJs+
 fsr5qbM0wiKG0D/X+ZOPTiJIOkv9LjZJAHMbTuvg2XTOj5FHA2rZ43RCGcVni9KHdeJRis6wZ7T
 91ixBoFLkKeXdnC3w
X-Received: by 2002:a05:6a21:6c86:b0:38e:9e19:6c6f with SMTP id
 adf61e73a8af0-3954617968cmr9946976637.35.1771928703874; 
 Tue, 24 Feb 2026 02:25:03 -0800 (PST)
X-Received: by 2002:a05:6a21:6c86:b0:38e:9e19:6c6f with SMTP id
 adf61e73a8af0-3954617968cmr9946964637.35.1771928703500; 
 Tue, 24 Feb 2026 02:25:03 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad97d6132asm20468765ad.68.2026.02.24.02.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 02:25:02 -0800 (PST)
Date: Tue, 24 Feb 2026 18:25:00 +0800
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <aZ18fMD8JFYo2i1a@redhat.com>
References: <20260224-remove_runltp-v4-1-75483a655894@suse.com>
MIME-Version: 1.0
In-Reply-To: <20260224-remove_runltp-v4-1-75483a655894@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gA2RMga6Rmd_kCHXXcpl1sI5aAdkc02fOgMjMoV8C-E_1771928704
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] Remove runltp `scenario_groups` leftovers
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
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
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 32A401854A7
X-Rspamd-Action: no action

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
