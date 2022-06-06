Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989253EF9B
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jun 2022 22:33:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E817D3C8E7C
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jun 2022 22:33:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CED643C051B
 for <ltp@lists.linux.it>; Mon,  6 Jun 2022 22:33:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CAC8E6002D4
 for <ltp@lists.linux.it>; Mon,  6 Jun 2022 22:33:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D772A1F45B;
 Mon,  6 Jun 2022 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654547591;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CfUBQ6IrTStAHlxEkhuvPRkMC2bsC5udvWZ5n2olO4o=;
 b=Otj/Fjy8DHGoWQIJZr8QSJuRNu97IYmwy2axrB0Q1L1bHYrMIT1yroG3QKGoL0Tw8HS6A3
 eELhNz7PhmsCgEKBZvdOOSTwVhO2TSblDDRa463jC8dyyZ5lAnGH+B075YgbGAJB5GBr9/
 9DCzM/Kpi5vFLydXwNCM6oa9+lBeM/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654547591;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CfUBQ6IrTStAHlxEkhuvPRkMC2bsC5udvWZ5n2olO4o=;
 b=8O8aBQfS7TbST7HS8HehxPMcOejlw5M9/XxKqp5lbptLaFN10JH/1GDaaIpJOmP4KmvTQ/
 D5ujj/NE+8hj7ICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E48513A5F;
 Mon,  6 Jun 2022 20:33:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0ZRREodknmL8TwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 06 Jun 2022 20:33:11 +0000
Date: Mon, 6 Jun 2022 22:33:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
Message-ID: <Yp5kg2W62o/FpR4G@pevik>
References: <20220606100034.169493-1-liwang@redhat.com>
 <20220606100034.169493-2-liwang@redhat.com>
 <Yp5hlrqtwtE0r4Bj@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yp5hlrqtwtE0r4Bj@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] lib: extend .request_hugepages to
 guarantee enough hpages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > diff --git a/lib/newlib_tests/test_zero_hugepage.c b/lib/newlib_tests/test_zero_hugepage.c
> ...
> >  static struct tst_test test = {
> >  	.test_all = do_test,
> > -	.request_hugepages = TST_NO_HUGEPAGES,
> > +	.hugepages = {TST_NO_HUGEPAGES},

> Also comment at the top should be renamed:

> -Tests .request_hugepages = TST_NO_HUGEPAGES
> +Tests .hugepages = {TST_NO_HUGEPAGES}

Except this very minor issue LGTM. Thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
