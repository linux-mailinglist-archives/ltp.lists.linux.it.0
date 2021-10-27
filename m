Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6943CB1B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 15:48:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A2173C6BDA
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 15:48:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1771C3C69BB
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 15:48:01 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 574CE204928
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 15:48:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E98521963;
 Wed, 27 Oct 2021 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635342480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhcinTCVlFP8cQ9Rhq0DoBrVT3SNTBWcrnH+hGRJVME=;
 b=1xzAhVeBy50nS8ZsWYbONbU+EZjQ2rqvmXu6Vv6qxEn7SQ1L+lUTjMucaZSBALbYmStEWT
 h5sQB+mkrARrh8L1I7O5V1eTs+mTP/B+jnQun0vKwqceMgNtT/9aGv0wbRh1fM5Szd4AbF
 IsC8by4kq8p6PQRpq2GaZdZlv8G73OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635342480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhcinTCVlFP8cQ9Rhq0DoBrVT3SNTBWcrnH+hGRJVME=;
 b=ajwzaQy0HlUIgSBDO9BiIpsCywJb1aX/4MMV2YTywRj89rLyWB3kScM2ZANAtg8QNm8uE9
 txCkSgNdeuAgj5DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5108A13C71;
 Wed, 27 Oct 2021 13:48:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gwFGDpBYeWGKNAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 27 Oct 2021 13:48:00 +0000
Date: Wed, 27 Oct 2021 15:48:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YXlYwi7+VUIitM7H@yuki>
References: <20211018154800.11013-1-chrubis@suse.cz> <87tuh2poue.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tuh2poue.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
> It's unfortunate that before starting this effort and the checker that
> we didn't know about tree-sitter (although Sparse may still be the best
> choice for the checker).
> 
> Tree-sitter can parse C into an AST and can easily be vendored into LTP:
> https://tree-sitter.github.io/tree-sitter/using-parsers#building-the-library
> 
> Then we just need to work on the level of the AST. It also has a query
> language. This should allow the initial matching to be done on a high
> level.

The only worry that I have about this would be speed, currently the code
I wrote takes a few second to process thousands of C files in LTP, that
is because we take a lot of shortcuts and ignore all the stuff we do not
need. Full parser that builds AST would be orders of magnitude slower,
so before we attempt to use it it should be benchmarked properly to see
if it's fast enough.

> If we continue down the path of hand parsing C, then it will most likely
> result in constant tweaks and additions.

Well I would say that this patchset is the last addition for the parser,
if we ever need anything more complex we should really switch to
something else. On the other hand I do not think that we will ever need
more complexity in the parser than this, as long as we keep things sane.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
