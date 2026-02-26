Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPKiCmkqoGlrfwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 12:11:37 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B27071A4E00
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 12:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772104296; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=B0xkG7D3PITqplcFDMEdRWvu/jqPZtgpjyXl6ggGLmE=;
 b=hhScMobs60DEaLlJtoNZsfpJtlmmu8x4sn4z7XMBOgvZRvw3xgtnK59qiVMZXrHHaGoRv
 adxRFIISPqFhTohw7vSt121RpuhYdalEvq1IAt+AYgv0tqNYfAfeT/nWo0NY3bshBuK1C49
 xvz+9KXmVlt0tWH0/0owqQDjGY+bHrU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 289A83CBB45
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 12:11:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A75E53C29FF
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 12:11:25 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2421B100074D
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 12:11:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772104283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=gl4Gs51LN/C8WCS0mS0tmzLRedZWq8mWwY1RLcAmDG2+zKN41EcHcBSnWkfHEKQudPQdTE
 2B63IRxKGYS2IK6/IFmj2rLmXy91NJU0Vcsurr9EGi7PU31sfNseqPI9AzSg6O65C8/ug6
 rp/rDVLBRA8vvzWkgjBJp71Igi7IfVs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-bSbh7lT9NF-Nc0x8BsUUzw-1; Thu, 26 Feb 2026 06:11:20 -0500
X-MC-Unique: bSbh7lT9NF-Nc0x8BsUUzw-1
X-Mimecast-MFC-AGG-ID: bSbh7lT9NF-Nc0x8BsUUzw_1772104279
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2adae76a9d0so8578855ad.2
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 03:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772104279; x=1772709079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=iWuLDjEuwLsXerVfQrsxzQpG0Czd9BI7w6QkRKyWb75MEQeT+KD/o4V7aLzbg4rlWp
 k5K5DLk7ApR6y57gA1sKlUk/KITuu42KEIxQhaphISFD73RwpEnQYcFmNWaSCuABfjQl
 baBktJ2NC4q8r3DxqSzTv2Ux+Rz0y+iKBT3wfdcSQLRZ/Mx8a/kuz5IWIcJc8iyWj47j
 7Tsy/f86+1T1seEuG3XRHMgFgbbEFlf0kbtwzlTkMqdVdQ+qu70UWfB9zLNDfp4ELCzE
 oxzq6CHEeQdR7GwgcoOF70AGzyxe9VJ+ALGse3+rj7X8k4xedhhEuJrnby5G+D6IpX/g
 1bvA==
X-Gm-Message-State: AOJu0YyMDXSG5iIEUKiBPPeZ+AmSKylnpGeZe7M1gGpI0sldum963ZaG
 BUUDprAeNRwcgdejciT6X37S0bHQqQA3hujiY2od3GRCz89xpXp+y07+W5Ri7Rc67wOIK3MsmSz
 Cc/wrfMobS+uLksyFTqzxodSohyvyzbMDXqrDdDD0VdgOu1IiM/N0
X-Gm-Gg: ATEYQzwUlDpREtDplMWsGm8d1Dbl9eH2Gvv50mULwNTvpehNuRkt1f1Hn0SCikc9kYz
 rT9wcXgmw5T99IXH0Urq6Y2r8cxzBesDhNYVURy65kDka818pn4LoO4zj/eodzVvrhg/AA8p4zF
 ncVra2TzCQN6445Hs+S1XjE7fHrCT801/k0xcmKnFDQfIWoGbphdh1N0isuggUC+Sxs0qaOWWiq
 LDk/QJirpMWTTBByGKHKNp4Ab8112LaoXHnweYc38+FdixSHT7P5rfNtxImohSvq5/XwNFlcN9i
 irIXMWiE9Ydpz8NvPtoE9QqepgTD2SrvjetRAK0kf8gKTJtDu0I9m7G1R9wp2fEritw0iPrbUnx
 ZuiMpCE4xdSO63DPj
X-Received: by 2002:a17:902:e5ce:b0:2a9:62ce:1c0c with SMTP id
 d9443c01a7336-2ae0305f1bdmr19787425ad.6.1772104279214; 
 Thu, 26 Feb 2026 03:11:19 -0800 (PST)
X-Received: by 2002:a17:902:e5ce:b0:2a9:62ce:1c0c with SMTP id
 d9443c01a7336-2ae0305f1bdmr19787235ad.6.1772104278824; 
 Thu, 26 Feb 2026 03:11:18 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6e261dsm21153585ad.83.2026.02.26.03.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:11:18 -0800 (PST)
Date: Thu, 26 Feb 2026 19:11:15 +0800
To: Changwei Zou <changwei.zou@canonical.com>
Message-ID: <aaAqU5KFsAFCnMdG@redhat.com>
References: <20260226103502.70043-1-changwei.zou@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20260226103502.70043-1-changwei.zou@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kO0r5CdfmiDS8w9AOnxRpXu5gZedBGucDKp__mEfrOA_1772104279
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] clone10.c: avoid using the libc thread memory
 model in touch_tls_in_child()
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com]
X-Rspamd-Queue-Id: B27071A4E00
X-Rspamd-Action: no action

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
