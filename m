Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D923A7D36
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 13:32:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 038923C721A
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 13:32:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 250FD3C1C51
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 13:32:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 80FF4200240
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 13:32:04 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E30471FD2A;
 Tue, 15 Jun 2021 11:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623756723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USUwmthWidrAD7UlERm+RgPcys7IEWEDgEELt7yA5jQ=;
 b=Bj2p5BIXmbai8lBqjJZHDH0CQbtX5hRhBhcjoa1uACzm9ovd/6oMTj34tXDW+rzAcs7ec6
 3HTUvihTrPe1IyVE+oC5coePSQm/eJjx0co3NhU/1JGTcijqqXkCDnasr5gPABnDvWvyP2
 JX8k5HnLgufxCOPmVKnOOW/q1EMKYqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623756723;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USUwmthWidrAD7UlERm+RgPcys7IEWEDgEELt7yA5jQ=;
 b=eGnMhf1PVfgLdp+4bt9szakjtSy/c70+mckDwMD+i7Ze1f1o6Unm7drFUm9epMhXWNEuo5
 +kJuLMBU7ILQ7CDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C628E118DD;
 Tue, 15 Jun 2021 11:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623756723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USUwmthWidrAD7UlERm+RgPcys7IEWEDgEELt7yA5jQ=;
 b=Bj2p5BIXmbai8lBqjJZHDH0CQbtX5hRhBhcjoa1uACzm9ovd/6oMTj34tXDW+rzAcs7ec6
 3HTUvihTrPe1IyVE+oC5coePSQm/eJjx0co3NhU/1JGTcijqqXkCDnasr5gPABnDvWvyP2
 JX8k5HnLgufxCOPmVKnOOW/q1EMKYqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623756723;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USUwmthWidrAD7UlERm+RgPcys7IEWEDgEELt7yA5jQ=;
 b=eGnMhf1PVfgLdp+4bt9szakjtSy/c70+mckDwMD+i7Ze1f1o6Unm7drFUm9epMhXWNEuo5
 +kJuLMBU7ILQ7CDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id mz10L7OPyGCSRwAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Tue, 15 Jun 2021 11:32:03 +0000
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210615075104.24870-1-rpalethorpe@suse.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <6867b219-5591-ec12-47a7-e9f0b525a76e@suse.cz>
Date: Tue, 15 Jun 2021 13:32:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210615075104.24870-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] icmp_rate_limit01: Require CONFIG_VETH
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
looks good.

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 15. 06. 21 9:51, Richard Palethorpe wrote:
> The test fails with TBROK if it can not create a virtual ethernet
> pair. So add it to the kconfigs.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
> 
> Just thinking about the config meta data and embedded users. Functions
> like tst_create_veth_pair could check needs_kconfigs for the required
> config and TBROK if it is not there.
> 
> Alternatively (or in addition to) static analyses can be used to check
> (or add) missing config.
> 
> In either case this may be wrong when a function is only used in a
> branch. OTOH then the test needs splitting otherwise the metadata
> can't be known ahead of execution.

I'll mention the need to check CONFIG_VETH in the docs.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
