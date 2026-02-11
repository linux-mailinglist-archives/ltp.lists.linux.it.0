Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNf9NFY+jGlyjwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 09:31:18 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5212240F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 09:31:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770798677; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=Qa/Shpf+tSoXQsS1Ej5e1IwpM7USC3V+c1fW88iH/Fw=;
 b=agI0b3o57B4t0p9RScckHjMX3pUnBlBoUcbLWod+QRnxD2u/m0DbMuB18mpQ1d2LVh+Bp
 gvM3WVqZFmgKlwjvh/Y1Oa22WaBRc4tvs4N7inKV1oE+0i6kilXnc065uI/EIsOq9P9fryO
 +V4KXIDYeCbGL6Qkqy/1Y1cWdUK52Cg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 524863CC351
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Feb 2026 09:31:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2678C3C4C25
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 09:31:15 +0100 (CET)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 89226200ADC
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 09:31:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso5663765e9.0
 for <ltp@lists.linux.it>; Wed, 11 Feb 2026 00:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770798674; x=1771403474; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mCG10rRVpEAtdFWdaBF+BSnf2VI/A4l8/lz2oFzsm4I=;
 b=S1LaJVKxbgOrug6nkdODqoliss2mLbV7jv4UntgX2JyT4uVEchsEsMoNtfWEdp8PUC
 NLtv2vS5KsMdf1QnqciIjorO+3fDzA348BEgWLfxaQneGogh8w2PbfxMDcMF6UwrcmK/
 mq7rLyxh7gM415MpV9DYgME0nJu5frG9M/ay4dyYkUQro2Bkvi6gsdjb1tKlZUidmBrX
 egcsGw7LG66xaWV6mBz8fQW1xkk4rwG1Ld48JAFMHhrAUbENDBCzvYEFNgPZlVTUG2yy
 YvsyftStI3ghSeCYQ8I6sYLkAGwO26ZxcYZNWX1moQ3Wvz8xlDbSG2GMfSnv3wAI3+NH
 1I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770798674; x=1771403474;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mCG10rRVpEAtdFWdaBF+BSnf2VI/A4l8/lz2oFzsm4I=;
 b=bNmerlmdwMUWTciGu/k+z4ldHs260YxGFVUtoYvCmKJ8nYwwLeDDPZJKk3ckOxC4I0
 /2ATC5Q0prVlxndnDi8gnITa5XjkHvtvCFBkYLnwWEWSe8Rp5b6FhWzlFA3F+P9Hmp0g
 rOOjVtGd8fQKmvRxVC7JjId8iAvTjx670cAlIqcR7H7cJxhUPjiMX5emQDakysCzgzr4
 pVX9Ir+kz/NMfkLtDDU3jeJd+KSC6pXmWe/fzlaKY2rFB6W1VroUjBem25hX2jNHs7AY
 sP7orN0eSX29jKgcjav8888TyKdZgDU1eIKWg3bkqoMoDXFddR+HFY+3BOXxnlc2WGbn
 2DFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVE4oa75U0MKV1LmOLm+vKZRaQUvHTLhm+syrB0yxeZmyMV6w+J1GQ2ckzXz/MAtVYj2U=@lists.linux.it
X-Gm-Message-State: AOJu0YxfuYjn7j+ntTVmNs40nH+TtQcpPHjVYq/rfzkP3i6zO8T9QggD
 REkQDEvujPUkjtBA3B1w24MngkkwP+2E1ysmvXFxkh5TzyLXJ5AAC+W4yBJrB8WCyGM=
X-Gm-Gg: AZuq6aKaHVHlVFDbwe/si7pAkIceh/odluZuwIy+cghv1u9gylRsuIC7l95NErXmugJ
 m/wYZ6ezb+hjfRf1Xdi1OSc6phXVa3nSCxhVl8y/P/aKiONLyxYWy9vOrOx6ULH7kQJAQ5op6aB
 UPzboO3bHK3w/5YsID9BALucTS/IBRmngx/llkUmvbAxvFaNeVv2xhqusRqLDw5gMryRTtU07JE
 +gaLuDP+mmq5tbsbmeZaFM5B1pFG09HkhwXryVHogAvHNUggzGwWHnFg2GggXCUhz25Rekf8St8
 kMno7nJqXfLWW5sa68ewXIVlSD9TM/+mWj9MHjaJHk0YE2p0f3rXbw519suBqt81RTKwxe75WKe
 1zJcb8TAo3okqQh3U5qaDwcA+abtTsyl/VODjNVs0ekAw7n6vO4RRJxiTPDBJc21TyOtLpPt00V
 mvTMhjSaac5P4HXcLjthvgLRmzvpbIqLinbN+XaY5fD8AdzJRhA+0t+vZ6KfTQjW9U9gITTV5FV
 1eEBHG30QEt+3nRyTrA4BkajSbIbg==
X-Received: by 2002:a05:600c:548f:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-483505451c0mr69670545e9.13.1770798673687; 
 Wed, 11 Feb 2026 00:31:13 -0800 (PST)
Received: from localhost
 (p200300ef2f4fc9009ff26ae1d4042002.dip0.t-ipconnect.de.
 [2003:ef:2f4f:c900:9ff2:6ae1:d404:2002])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d9894f8sm25780225e9.3.2026.02.11.00.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 00:31:13 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 11 Feb 2026 09:31:12 +0100
Message-Id: <DGBZQNUV1V01.2NQL451V7SP5Z@suse.com>
To: "Stephen Bertram" <sbertram@redhat.com>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20260209192812.2763299-1-sbertram@redhat.com>
In-Reply-To: <20260209192812.2763299-1-sbertram@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] Harden parallel worker execution for
 cachestat02.
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
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[suse.com:s=google];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,suse.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:replyto,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 6BF5212240F
X-Rspamd-Action: no action

Hi!

LGTM, but we also need a commit message. With that included,

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
