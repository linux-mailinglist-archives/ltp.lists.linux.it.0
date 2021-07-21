Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DCE3D12B5
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:43:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C57E23C8193
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 17:43:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B1963C61CD
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:43:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 05B471A0021F
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 17:43:47 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BFE11FEC2;
 Wed, 21 Jul 2021 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626882227;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ckWNaTEaKAhUCedfoIye0gHL61DlFjHtadRZcXnn+6Y=;
 b=kveor0C3pY7iAvjiUNWCOo21uRt4nxO/PdLFeoj4CKEgKxvHmMUSeqass5CzVIh5ONv3LE
 GRBLeZBPlIbHyZ30OROYt0kYalqAJDbjPOHvLKr9+5nE4OZvyVRGz0Vlyc9Q1KAWS4jvts
 vbRTuD0Nw66qlmDew+yrY4GI0+vzKOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626882227;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ckWNaTEaKAhUCedfoIye0gHL61DlFjHtadRZcXnn+6Y=;
 b=qZwyNGjFmMFL+29RC+9jPLVvjTxzOVqM+7H5EHE05JabIiaNYekn778ScjOxo11VkCCE6i
 HXvXNFsK2c61upAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1137313C02;
 Wed, 21 Jul 2021 15:43:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id acJnObJA+GAFOQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 21 Jul 2021 15:43:46 +0000
Date: Wed, 21 Jul 2021 17:43:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YPhAsSXIE3c0C7O7@pevik>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-4-rpalethorpe@suse.com>
 <YO7BQjUuCP3ah5wu@pevik> <87v95dniii.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v95dniii.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/8] doc: Add rules and recommendations list
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

Hi Richie,

> Hello Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie,

> > obviously correct.
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> >> +++ b/doc/test-writing-guidelines.txt
> >> @@ -10,6 +10,11 @@ NOTE: See also
> >>        https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API],
> >>        https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].

> >> +Rules and recommendations which are "machine checkable" should be
> >> +tagged with an ID like +LTP-XXX+. There will be a corresponding entry
> >> +in 'doc/rules.tsv'. When you run 'make check' or 'make check-test' it
> > nit: I'd make 'doc/rules.tsv' as link (for lazy people like me):
> > https://github.com/linux-test-project/ltp/tree/master/doc/rules.tsv[doc/rules.tsv]

> +1

> Although I was wondering if it could be formatted and displayed inline somehow?

I'm not aware of it :(.

Kind regards,
Petr


> > Kind regards,
> > Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
