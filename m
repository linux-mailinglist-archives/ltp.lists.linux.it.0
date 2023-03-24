Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D06C77F4
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Mar 2023 07:32:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 564D53CA62B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Mar 2023 07:32:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2CE03CA4F3
 for <ltp@lists.linux.it>; Fri, 24 Mar 2023 07:32:57 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ED334600A4A
 for <ltp@lists.linux.it>; Fri, 24 Mar 2023 07:32:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 299C6339D0;
 Fri, 24 Mar 2023 06:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679639576;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n+nLM1LjNHR616meLpassBKDpSYPELSTUjuIfbrVjrs=;
 b=xkLmy4YgaW5rSIkhgcFslQtsf2Z7lwJgJ0v7dSrruwtKg78wMz7ulkO2uw9M9Sg5/Nd4I7
 fQaBSSvKgrXNOLDmLLcqaG92kvO8KakZJ2hG58zsgmMIgmUL8ts29b+mNbFTXJdBRPFEtn
 sO0VR20X+8AFWy8RD53D/pEVOaea0E4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679639576;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n+nLM1LjNHR616meLpassBKDpSYPELSTUjuIfbrVjrs=;
 b=Faz4FDxww8rVO3gxYV3MuNHnVFyUmS9Ehzn7VwOssEWbo45am1kqOwERXJmPpqA5/JQvun
 jD+FowBX8lQiTnCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1BFD133E5;
 Fri, 24 Mar 2023 06:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jFdoORdEHWRNRAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 24 Mar 2023 06:32:55 +0000
Date: Fri, 24 Mar 2023 07:32:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <20230324063254.GA520087@pevik>
References: <20230226003526.8733-1-wegao@suse.com>
 <20230323092655.GF405493@pevik> <20230323121757.GA30319@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323121757.GA30319@localhost>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] clone3: Add clone3's clone_args cgroup
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Wei,
> On Thu, Mar 23, 2023 at 10:26:55AM +0100, Petr Vorel wrote:
> > Hi Wei,

> > Do you plan to use this somewhere? Otherwise I don't see the point to just
> > add it.
> Sorry i need add another commit above this and start using new added args, will
> create test case later, maybe you can put ChangRequest firstly, thanks.

I'd prefer to merge them once they are actually needed. But Richie might have a
different opinion.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
