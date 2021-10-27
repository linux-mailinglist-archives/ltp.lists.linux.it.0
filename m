Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2343CADE
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 15:41:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 862273C6A12
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 15:41:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 916933C69BB
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 15:41:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9E6546006FA
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 15:41:20 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1A93D218E1
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635342080;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iyp061MkxH7m/TuPv79Fwd6UV7UrgdQykeYIO5xWOUw=;
 b=pI/aJUl71OuidTg1fEKsaD226P0Fr6jtN3uvNVKZ2MI8UBNb7zZyHRjWixYu9x5PFSQ/BD
 7X+8YlX8Q4rbGMwIutLesT0J76stHBOD/mywQylHCzScDzcHJnp1BRaA55KwWGk0XQeVgB
 JSPVsFj7osuvr3O8jDC4MO2+/wp98y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635342080;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iyp061MkxH7m/TuPv79Fwd6UV7UrgdQykeYIO5xWOUw=;
 b=/aLwKW04kkd0wW7S0jOZX9AzbeFqCTluYmDies8qWbbhhwsMZKWr7gJX5ISYQwbQRaqEsn
 l9VeOZgzSFRQdlDg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DB6D4A3B83;
 Wed, 27 Oct 2021 13:41:19 +0000 (UTC)
References: <20211018154800.11013-1-chrubis@suse.cz>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 27 Oct 2021 14:22:25 +0100
In-reply-to: <20211018154800.11013-1-chrubis@suse.cz>
Message-ID: <87tuh2poue.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Implement support for various missing bits to the docparse tool and
> enables it unconditionally so that the metadata.json file is present on
> all builds.
>
> This is first part of bigger effort to get the metadata useful for the
> testrunners, expecially we need the .test_variants field to be properly
> parsed in order to compute the overall test runtime correctly.

It's unfortunate that before starting this effort and the checker that
we didn't know about tree-sitter (although Sparse may still be the best
choice for the checker).

Tree-sitter can parse C into an AST and can easily be vendored into LTP:
https://tree-sitter.github.io/tree-sitter/using-parsers#building-the-library

Then we just need to work on the level of the AST. It also has a query
language. This should allow the initial matching to be done on a high
level.

If we continue down the path of hand parsing C, then it will most likely
result in constant tweaks and additions.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
