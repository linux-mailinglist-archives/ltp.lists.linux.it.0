Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734E44193F
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Nov 2021 10:58:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5938F3C70FB
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Nov 2021 10:58:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EE1C3C7002
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 10:58:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8811F1000944
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 10:58:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F9692191A;
 Mon,  1 Nov 2021 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635760722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2j8uZSd5xBRzKkULUmwTtoHNa1jPKYDifCOgp4QA3Cc=;
 b=MfLkhr9jExQRN+1/vdXrqm/u3D2h/rcyz9k3F89Kp5c4HyR2GMpS2Mkq7CKG98005wgvjF
 drNn3baN1bC4m6LFucjxXG6l+GWNY5z3zm/rd1pHOzUSdiCRYj0FUbzSF92VLel7OPqpCZ
 0gpKnj5IEGExxPxmX1xX7SvCCF4PWCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635760722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2j8uZSd5xBRzKkULUmwTtoHNa1jPKYDifCOgp4QA3Cc=;
 b=r6hZFn3Y/nwxjyooPOdrK+rSHXq6Hh26Q+hOYIgm59QEwI7WApDI/fxuMTpDbc8m3kS82g
 CgmSZdtSi6W3ZEBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ABEE13AA9;
 Mon,  1 Nov 2021 09:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WgCZIFK6f2HEQwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 01 Nov 2021 09:58:42 +0000
Date: Mon, 1 Nov 2021 10:59:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YX+6iWEzwaTqbYua@yuki>
References: <20211018154800.11013-1-chrubis@suse.cz> <87tuh2poue.fsf@suse.de>
 <YXlYwi7+VUIitM7H@yuki> <87pmrppj9u.fsf@suse.de>
 <YXu2q1Uj4xIJvO7G@yuki> <87h7cwp5x6.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7cwp5x6.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/7] docparse improvements
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
> > Still working on a prototype based on tree-sitter would take a week or
> > two worth of time and I would like to get the metadata fixed now, so
> > that I can finally move on with runltp-ng. So I would slightly prefer
> > merging the patches for the current solution first, then we can have a
> > look on tree-sitter in the next LTP release cycle. What do you think?
> 
> I think there is a small risk
> 
> 1. It turns out that with tree-sitter it would make more sense to use a
>    different meta-data format.

What do you have in mind? I do not think that we should dramatically
chante the json structure we do have now.

> 2. Someone starts building on the current solution without realising it
>    might change
>
> Of course this can be mitigated by saying that the implementation and
> format are subject to change.

My approach here is to build the runltp-ng as a set of reusable
libraries, one of them would be a parser for the metadata that would
provide interfaces for the common queries. That makes the metadata an
intermediate format that could evolve over time. On the other hand I do
not expect big changes in the metadata format.

> Note that in general I think it's best (on bigger projects) to have an
> alternative branch for big changes where one needs to "rush" to an
> end-to-end solution. Most likely we need an alternate branch for
> integrating runltp-ng and the executor.

We can even do this in a separate github repository or whatever works,
but still we have to agree on general direction.

I still think that the best solution here is to apply this patchset and
put the tree-sitter on TODO. Unlike tree-sitter this is neither big nor
radical change and it would allow us to proceed with other stuff that
has been blocked for several releases at least.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
