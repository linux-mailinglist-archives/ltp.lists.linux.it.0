Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 978623C9E35
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 14:07:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 688263C7AB4
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 14:07:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1F8B3C7496
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 14:07:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4AF79601B12
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 14:07:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D1E11FE16;
 Thu, 15 Jul 2021 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626350864;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=chY4LAf5EwEIxo0MpRWHEjWJ0TR8QilztFLUVce1IgE=;
 b=MFVj1qy+Ojf+NqhSl6kGf87oWzmdhYnd5qDuYkKUUOynTLJl0EWKNnrDI4AWhEak98XH9/
 jGBL9o5p1fVI8/Dr6Qzu5maFjNVQF6EJwXGp2j3/qRxzZiE7fEquUf0QnY45y7JCMP2S/X
 QQ1kL/3t+cFU8jsDX1ML9wiODM/vWxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626350864;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=chY4LAf5EwEIxo0MpRWHEjWJ0TR8QilztFLUVce1IgE=;
 b=uuE8cLuUbpv+LCxlmOYf2PAcLimuHWCw87JSn1Q2KxJ4n3tC/gswvjrlDLF4XuZNU+pnDC
 YvBP+HdIwWaMJWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6835B13C32;
 Thu, 15 Jul 2021 12:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2KoSFxAl8GA2OAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 12:07:44 +0000
Date: Thu, 15 Jul 2021 14:07:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YPAlDpkrCoxt5o0q@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

...
> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV6_ONLY=1

> +TST_IPV6=6 won't work to fix #843?
Sure, it'd fix it. And TST_IPV6= for broken_ip-ihl. That's a simple way to fix
it. But I thought having TST_NET_IPV{4,6}_ONLY=1 would be self descriptive + it
could be later processed with docparse metadata documentation (I plan to
implement docparse for shell).

So it's more a question whether we want to manifest this info.

Kind regards,
Petr

...
> >  TST_TESTFUNC="do_test"
> > +TST_NET_IPV4_ONLY=1
> >  . tst_net.sh

> >  do_test()

> The generic version looks fine:

> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
