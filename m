Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGenF2NLpmm1NgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 03:45:55 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF1F1E8296
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Mar 2026 03:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772505954; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=gM8NRimZm1FM8zlQeiAeMoNStTfFhfiQc7uWzI6g1zM=;
 b=XKj8yJKM8y1ILVVoXvxuN+W2Ve4fNnWt4Usen1yvk/hKeQWdKkFFF7be9K6/yDs8P5Jw5
 iDYK7WiZhM2Pgjp+2lhADrggoCzYTE3N/ND3NckjnuHdweUqbg31Im6tJAxiRWfFETMo95F
 bcAPwXLMob+rKAV3oil2iE/+adhyiP0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96D273D85B1
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2026 03:45:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9FD93CB27C
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 03:45:40 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1D2EB200351
 for <ltp@lists.linux.it>; Tue,  3 Mar 2026 03:45:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772505938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZPCfaj81UUApkKpMPmcXx1tNCajhmui+YwFMENc/9o=;
 b=Xhcj6JgWa/Ob1524hReuG5yB5rlLv6Itbfhu4ub0LgYU9nDOOQP0NAGZVdNmzz4i1mcbPG
 6DZEWdx5Z19imdYWIqUrW/5jpQXmrubAfwxzGzW4USNS4XT8MZ5innQBW3j7r0RYY+sz1P
 cymzb18Oij1x48/2UOcAEVALIVQo3xQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-MHNxoO7MMYWDXKq6ve1uFA-1; Mon, 02 Mar 2026 21:45:36 -0500
X-MC-Unique: MHNxoO7MMYWDXKq6ve1uFA-1
X-Mimecast-MFC-AGG-ID: MHNxoO7MMYWDXKq6ve1uFA_1772505936
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a90510a6d1so36180515ad.0
 for <ltp@lists.linux.it>; Mon, 02 Mar 2026 18:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772505936; x=1773110736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZPCfaj81UUApkKpMPmcXx1tNCajhmui+YwFMENc/9o=;
 b=BUfLMicgSgIak4Uagu8E3Fy8XztM4/zpX+YbtI/kuMsWf3vd6qJaNoyxvatQjehhi6
 wq7+w17jU06B2Ls9u/W9MFwzqjn2YHFQZd2MGU7QI5pXNL6Yn5LDkcheID+jWZ3ZsCMT
 0YCMeqV5foE7MGKzvIOPrm8q1sVSK6706z5MOcdvZGDKObV6ha3Rw3Ui09eu+EEJiLhm
 fhhyYHUMtR9wLg8tMzfxzTu8uqra+fcJWTLumO5IftDjhb3l9c+QGHVw27HUlUVorR1Q
 glteWNB7UypU6gUXKaQWk+FjGbKCrer4QDMVVKw4A9Hnm51Wxw15zNcfaqyILasmD/so
 XylQ==
X-Gm-Message-State: AOJu0YzWmOmFfh0uhgi7esIWswduct/7iqNLwTW+ByRVXmflz0dgTHgg
 eZldMX6+KSTSAN8OBqlkHe6EGGGHUdVi7sAG6rqI6v7r1RbClJfF24l1i+bBQUL95U2Onc+M73v
 OB/SQVPnuUpFzURcML3r9vsEnjoS1JJe6JwqYYLDu7dideoJsf4tP
X-Gm-Gg: ATEYQzynNqmfg7TQHgbBIkpn6DczkvePqknA/sXqGoYPoAqvBctmImlCrevLJXg1nAw
 +jUsY+eqfi4r46GaIWFiJkIKFfLhXCsHtaRHkc4Z6nu/bV9FU3CrgfkcxlLWzLSQcNh8F26raxW
 TonrMaEungOZhqX535JBCTJfb9FQnlrlnAETNHRxgNjc8i5G5M2c0mPpbcDQYsMeXMxUDnYzUQF
 Ds4gxNw7rnXkO9UI6uLGYiSRXtVSCoWLRipnShFAo5IG5P1aplLvxujXYUWuUrlcqeB29CZQoD0
 770wAuWZNLuRgjHaKjBNhhHOr1df1Wes1FwROJCzKR6iwOxgl/wp9d/WJrNEJuOc2SO8aM7tqoS
 enT++iOrAuCgAEZqK
X-Received: by 2002:a17:903:380b:b0:2ae:5628:a180 with SMTP id
 d9443c01a7336-2ae60dc150amr6086935ad.25.1772505935880; 
 Mon, 02 Mar 2026 18:45:35 -0800 (PST)
X-Received: by 2002:a17:903:380b:b0:2ae:5628:a180 with SMTP id
 d9443c01a7336-2ae60dc150amr6086815ad.25.1772505935433; 
 Mon, 02 Mar 2026 18:45:35 -0800 (PST)
Received: from redhat.com ([209.132.188.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb69ef1csm162640015ad.53.2026.03.02.18.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 18:45:34 -0800 (PST)
Date: Tue, 3 Mar 2026 10:45:31 +0800
To: andrea.cervesato@suse.com
Message-ID: <aaZLS0XUd5z-0HmM@redhat.com>
References: <20260301012808.15588-1-liwang@redhat.com>
 <69a5a89c.050a0220.1f2f98.0f58@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <69a5a89c.050a0220.1f2f98.0f58@mx.google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TmwUNjPhQtmZhW9Dygvzs0_W_7mOYpjZQiiVR4Qh-tY_1772505936
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: Extend -D flag to support multiple debug
 levels
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
X-Rspamd-Queue-Id: ECF1F1E8296
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:rdns,picard.linux.it:helo,lists.linux.it:dkim]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:11:24PM +0000, Andrea Cervesato via ltp wrote:
> Maybe we should also apply the same approach to the LTP_ENABLE_DEBUG
> environment variables, otherwise we might support only 0/1 while using
> it.
> 
> WDYT?

Sounds reasonable, LTP_ENABLE_DEBUG now should support '0, 1 or 2' and
drop the 'y' option.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
