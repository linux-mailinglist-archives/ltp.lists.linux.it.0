Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGzAAplXlGkXDAIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 12:57:13 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5E14BA91
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 12:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771329432; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=O0QFbCYBAYsloUzz+ZQHOWJiSU7F7imOHMFJ3E6zH6k=;
 b=Yr3UrzuTS/9rdhpuu3kV7KmW35G4KoXucW52qBby86HoD9ajfpkHpZa/GhoqSPoGWIYNs
 8uXrypTr8PrF43G5gKAioCJWR5D4FszoqG3b1HxfbNDH5S81ggPCtuCp6zXXse5hfOs5CFx
 2HoauFvNUvRMi9LUmMew9GD5Ti092tU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DB103CFFE1
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 12:57:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A94D3C2C39
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 12:57:08 +0100 (CET)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BA7B1000378
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 12:57:08 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso57358545e9.0
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 03:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771329428; x=1771934228; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39rPTB30DGtE0ldl9KH//TM8Vn/80pt/48N5CPhDidA=;
 b=bSPD4GUVGl+guzFczWHkLBOTdRonLIwQ0LkWeiQ9zIzPc06ULpBghX1cXRU/xa5qR4
 su+DRxgxU6j76x/RfOlrJ2sPM8bIzfszgL0dIemjohGPZ61q6NsDTw74O4zzrnpFYXy+
 BDHOgbl2h2hn3gjb5oKVupaN5IlMvdDh6cyo3l6dKI2OsJmLc+zHJWexpWj/K1USbGMY
 ftmt7LHVMSqS4kBDjTII4/jFPSt6NrqKKT/iiWd3ZAQCPGlhHccnm/M6zuj+p3QCVAke
 69FkVbWj90bTlGOvC7g0DTznG7Fjn6io0niY+by0KC2oU2Bcuo2Zt9VVSjjUohIhNYyp
 yA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771329428; x=1771934228;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=39rPTB30DGtE0ldl9KH//TM8Vn/80pt/48N5CPhDidA=;
 b=Hc7+ivsxOnsEXOvR1rhcTFOXk1Dq09yjznNTGYoEOtacjglVXLoUPCKf2GU4BAH4I0
 WOusmHsSGInUNDSplS53YSOcGxjlhSfbjT76oLzMPAu/MXUXMjFrakZAZ9qT5/9EELF3
 AGvNJ9SX7NelcaMfaE6toHAI1Y2hYqXeBjtqW5UR2nBypQHEOqMj61Hu7rqZU4n84umK
 /rq/Wbuug/e1CCI/L4yiwkOPHrI+7JtL/5aFj1nNakuV8gggszq8IymwopZFagArnHBR
 Tbkn5GaiIrioWM/izPSmnvrSb58VgAEscttQ8wgZUkKt/CT2UT0n5OSlxP6Dh5G592h5
 jeag==
X-Gm-Message-State: AOJu0YwO6QsBGkkOk0OhC7ZsVYrw7gBO/GODIGrD3rNL9BenilgPdfk4
 vJFIDyKtnuYVUkXITyX1QjY+zYu9w0HsD16PgKiqHwB4+DnlwppFLI2n+CDKn9lziSujR5vGtoJ
 kVmDsDrw=
X-Gm-Gg: AZuq6aIgIuN+LOIcZiQ2S2fzaVdzVPhl9LoICLzRBRu3zRiQVg+MKhQODzfliRq+X65
 aOSbzPM9cxwY/ewF02h6d01Kly7IRITwre91Tca2xdgBotGZExtf0YbiKZCQS69mebqff2uBN5T
 R6qH/dbESI/NPaQOg2xd1aM7hfVi5ZULi72WR+LKjdJ0XyovnH0KzLQUVYVQTTfOlVSJdMycnwO
 8Hx0jsquN++ODK6PdMDnJL1sx3fvxIPI259Qv562CMIT4BHXED/TIrk618cDEvOyKJz59Kql/mi
 elc+9sXf0qwoJXhGmy4K6SfQKNZJhj2wqE0p+HXlAUsw7lm+dJ2eqZnWvDParPBC6rHyKJTTDog
 rsMVUzX+w5aHYaG5ynqAkDQaP0auplaC3OIjBF/rwIOzSIdxPGOsxKGIkjOvb2zc+G9UoNd+sSg
 jY1gdF6n6/SFMzsyrJtM15qGH/8q2E9vr0RGxPJxANNn8Eyk2Mfk8ZxAy/IcQ7vkhNWLgmzcnUj
 eSRZuDfTcp62rWm/4I=
X-Received: by 2002:a05:600c:8711:b0:483:fbe:23dd with SMTP id
 5b1f17b1804b1-48378d9579fmr196505965e9.12.1771329427852; 
 Tue, 17 Feb 2026 03:57:07 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm27671502f8f.15.2026.02.17.03.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:57:07 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 17 Feb 2026 12:57:07 +0100
Message-Id: <DGH7VKZQSQYU.24THA0WH7U4VO@suse.com>
To: "Cyril Hrubis" <chrubis@suse.cz>, "Andrea Cervesato"
 <andrea.cervesato@suse.de>
X-Mailer: aerc 0.18.2
References: <20260217-agents_file-v3-1-fc2e6f97e0a7@suse.com>
 <aZRW0_63iX308HQi@yuki.lan>
In-Reply-To: <aZRW0_63iX308HQi@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] agents: Add AI agent configuration for code
 reviews
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
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,linux.it:url,lists.linux.it:dkim,agents.md:url]
X-Rspamd-Queue-Id: A3C5E14BA91
X-Rspamd-Action: no action

Hi!

On Tue Feb 17, 2026 at 12:53 PM CET, Cyril Hrubis wrote:
> Hi!
> I'm not sure if this exactly the right format, but the content looks
> good to me.

Yes, the format is Markdown and that's the default agents configuration
which is currently supported by most of the modern models:

https://agents.md/

I'm still tweaking and re-organizing some parts, since new reviews are
introducing new small changes to the agents configuration. When I will
finish, I will send a v4.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
