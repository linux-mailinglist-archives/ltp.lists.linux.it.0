Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDMoIhdZjGm9lQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 11:25:27 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F131234B8
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 11:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770805526; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=7++zoYcKs22/29tsSYRYELsis7ixe0Xxb8pxCs8NTfg=;
 b=KRktSU3tjLRkgwhBJI4TG+yxvJdXiBGOr4A6mKWYbvbgXmiYDAJPkECM/zduQgNBp4EMG
 PFPPOmiY3LAtBCaK6hFjryOPMfKhgNjrsl7lMtrXq4t+UsXrZc2kBjKGqSUaEMiUPQhEDFj
 prrhzlBPOiZ9vktJ+LQmx+sgIcYHU48=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFF5A3CCB7F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 11:25:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 592FE3C4F59
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 11:25:24 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A717D1000772
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 11:25:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-482f2599980so19617505e9.0
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770805523; x=1771410323; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ognb9K8cW6vgkBnOj3DvV32zodozFFUMSd2H6PaImbw=;
 b=VJ1WifRKmotahShDKsjLg28FW/l747euW+4acojOW1TbYLHzCmP7QdE8GiCZ4hRjho
 nzpeVpogl3G0rWiCo0lANfEKRf6lmOIvOA1rvRLUZBu6oo8Nr9gpk51AGK+op7UW+Wan
 4GszMglFD1BOZsk/1RnrlO0ezfvBQ50Fpbk5+gA1sLG07LyQAeb+ClUMd6ks5bB4RqtS
 YKkoPQim9oMm/iam3bFXl/Ba9IejOGQ5u6gVzZJqB/fFxm6y8kURoqNAuPJEyKXAypDJ
 ylZX2De7rqJRTBM8CH51gIshPcVvawHWG7kBvZZjS+qKP4XmoR3DIrZzYVtTm672oRYm
 Hhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770805523; x=1771410323;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ognb9K8cW6vgkBnOj3DvV32zodozFFUMSd2H6PaImbw=;
 b=UtyvGMfVhEFme1ZLWNw0Qf61fz/21l1r6sAyfoWjImgZv362qyOLJ+kfb9bVWm+mk/
 7xw2RJHnvaZA0+X4B+i2P8IMabZoGCSKPnp8dMS5SDNChPm2TUWNIevCfapobB5hAVEW
 ATZvPGNDVj0wvZ0KeaW3GUKbUnb/A9PElUV1O2W5cnrwD2XGeAy0kvz/iO1P3irtJtHe
 sKEviZYM6+0dW+Z5fwx+BzAFwQ7p9XlwPROPEwe8Uqkf1wpfJi1DJsyz9ezRODWLHZxY
 qXZQ/tPvEX8mMzD1usMHh7P5ZTDJPD1j+R3/xh5NbI+hiImssXOfmj1YCIIb2NVTJKAm
 TURw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmA50KyUPtC+JheXTWbz2/q6BxUerDtpRJuAOMIKrz5C4gucxqUS/qzfos/oS71Wn6lVQ=@lists.linux.it
X-Gm-Message-State: AOJu0YwVvQFKZo5sGc0MNQENUDtHtFsvU/3JpBnG8TnBYQBkR3AH8Dkc
 pOyzogI5IhZXSNJndgK96b9Hltlu2HFYbT7sfl0yCy1J2bIW8ByXMNLeWMe/KNy168Q=
X-Gm-Gg: AZuq6aIAETB4p0LUsGP7DHC0OJR8Wh+0dikS268Makj0tqWtYQ+OV5xOCK+32Q9yODF
 LFq/LdGc37P8GMV82o+3Q6le0JV0b1hmVxQ+Mh6yHbQ8CxkwNo9bpoNUT5EluDYPaDs+zKNNG3b
 X6Am/EOfnj3oRf82FqJJSdUHLhkWztQx9LwM4NpeXmxIk/zB+1aVtiVX3StYLjvsGqtLgKZdF3a
 0hhLXASixkEbAE9iBaOuq9OlsYI85Dq4St+9oap7okoW8pLTfhMcOsLMiVt+3+RE+pMqh9pg6m8
 WAJNXuGkFse7ulutexPevwWpqoY35n9V/1qizq4BVEUuhqV1kFvD5b18GrVl8FstzSsyd/zPpWe
 IR+lDMxi/zidgRZph/G97XxMaBKo1XK5bPZT7deSfZL1SCO2j56H90D0ulfCA2ldJ3vNyJHFXzD
 oOjBV69fPURWSgOeAveHpe6RFXHxzaExh5YvG6cCLe+HfNrcQjJuYatvMd0NO18m/H/3eVYljgl
 l6uknBvaN6J/clDWELGm1hiDzbCxg==
X-Received: by 2002:a05:600c:35c2:b0:483:54cc:cd89 with SMTP id
 5b1f17b1804b1-48354cccf81mr60765755e9.9.1770805522910; 
 Wed, 11 Feb 2026 02:25:22 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d3464csm4445483f8f.5.2026.02.11.02.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 02:25:22 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 11:25:22 +0100
Message-Id: <DGC262DZPMFP.10MLIF7OXIGS4@suse.com>
To: "Jinseok Kim" <always.starving0@gmail.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <DGC0LPS5JBO5.DEZE7CY4YTHU@suse.com>
 <20260211101328.1180-1-always.starving0@gmail.com>
In-Reply-To: <20260211101328.1180-1-always.starving0@gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] inotify: modernize with SAFE_ wrappers and fix
 minor style issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.it];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 21F131234B8
X-Rspamd-Action: no action

+1

This patch will be merged when it will receive a second review tag.

Thanks

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
