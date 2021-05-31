Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72112395805
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 11:22:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 223523C8051
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 11:22:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FD9D3C2907
 for <ltp@lists.linux.it>; Mon, 31 May 2021 11:22:43 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D58DB600101
 for <ltp@lists.linux.it>; Mon, 31 May 2021 11:22:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 152831FD2F;
 Mon, 31 May 2021 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622452962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUUhW9Xc5FqUMF0qY4TRlxDMvOe+VGaeUQ5RIGIiPU4=;
 b=WTqhe1x2MDJSKpoOmd3rgWzQeMKwh3OjIJuyZ6eRSpiHi+7JUUa8FVP1FNznPo9rz+cDma
 mM7qjlZhRDxbIMzgyJeVU7AKrX4u5p9Ibnul/+Sc/nELxKop6o/Yz6+ketGatUTSBEykD2
 Plq0etr8lojJnLQ1VLfMydQ9Wub2NKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622452962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUUhW9Xc5FqUMF0qY4TRlxDMvOe+VGaeUQ5RIGIiPU4=;
 b=KHEXMtUNxfn5mYantKG7lb8Mw6Pl35nWfoqLgBlF2+r6p4BcW+VCiFRq1MI9FJ6yeamyLv
 XTBPDIaaWlJ+FICg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 82109118DD;
 Mon, 31 May 2021 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622452961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUUhW9Xc5FqUMF0qY4TRlxDMvOe+VGaeUQ5RIGIiPU4=;
 b=1+DXMxanyW8EVsO+/jaBCPFnvzmpwgPZoJ06AQGioIilqVkIp5OGVDCi/2FbGthFzIn6sv
 A95NbMD20Fup1U1Xv2PcpHbhSA/jypl7YILH7uWAqTYTAzAAqWKuxELavmW1XEXQP0fYy2
 wtVYJC+ysgwTe4XeQxGSGATKzEbqOso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622452961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUUhW9Xc5FqUMF0qY4TRlxDMvOe+VGaeUQ5RIGIiPU4=;
 b=R50pDE8/QlbaEkJgPBwXWjsA7llmjo6BN8NZJWCIJviMMD5T3vxFXh7rmf/QerVJ2n1Gf1
 J0XswpOMCrDd4IAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id lhWHHuGqtGCpVQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 31 May 2021 09:22:41 +0000
Date: Mon, 31 May 2021 10:56:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLSkz6OUbgwuB7my@yuki>
References: <20210531032910.6739-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531032910.6739-1-pvorel@suse.cz>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; REPLY(-4.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Drop uClinux support
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> some shorter form could be added to 3. Test Contribution Checklist [1] as well.
> 
> Kind regards,
> Petr
> 
> [1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#3-test-contribution-checklist
> 
>  doc/maintainer-patch-review-checklist.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
> index 5420fa933..81ed61ddf 100644
> --- a/doc/maintainer-patch-review-checklist.txt
> +++ b/doc/maintainer-patch-review-checklist.txt
> @@ -44,6 +44,9 @@ New test should
>  * Docparse documentation
>  * If a test is a regression test it should include tags
>    (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2238-test-tags[Test tags])
> +* When rewritting old tests, https://en.wikipedia.org/wiki/%CE%9CClinux[uClinux
> +  (??Clinux)] support should be removed (project has been discontinued).
      ^
      I would just use u instead of \textmu

> +  E.g. `FORK_OR_VFORK()` should be replaced with simple `fork()` or `SAFE_FORK()`.

+ and all #ifdef UCLINUX should be removed as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
