Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24543F945
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Oct 2021 10:53:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EADE3C6E9E
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Oct 2021 10:53:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B29CF3C1A97
 for <ltp@lists.linux.it>; Fri, 29 Oct 2021 10:53:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BD5E21A0025D
 for <ltp@lists.linux.it>; Fri, 29 Oct 2021 10:53:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD96221979;
 Fri, 29 Oct 2021 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635497591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vApW0pMaKc4jTdagGJkFSURXAJu0/XdmU/WGfj+j28=;
 b=PveAVNJ/gBNJWWhEli1kMsUleNZcXfCXBcPXMQlgFR/iY0DGrS7s7ZCBFM8clUputLlR7l
 frquwyQ0fAssw6UAxGzZXMFpjRFLyK/anXuKHzIFHmFI8FNH2pWDtFWWgwFn0HR9EzZYf3
 a5wr/KckjIaqAkGq1LwXImQqi+Fjmn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635497591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vApW0pMaKc4jTdagGJkFSURXAJu0/XdmU/WGfj+j28=;
 b=ZF5tHirC90QZzwcKqtcDmOYBKvB8mtBtieQWgAsNkEeIgPz/M1pnuXDg8w1xmGyZXxzW74
 mqPP+q/IwAGwkwAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C612E13B70;
 Fri, 29 Oct 2021 08:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /H0uL3e2e2EAHQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 29 Oct 2021 08:53:11 +0000
Date: Fri, 29 Oct 2021 10:54:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YXu2q1Uj4xIJvO7G@yuki>
References: <20211018154800.11013-1-chrubis@suse.cz> <87tuh2poue.fsf@suse.de>
 <YXlYwi7+VUIitM7H@yuki> <87pmrppj9u.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmrppj9u.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
> It's incredibly fast, it has no trouble parsing the entire kernel.
> 
> Weggli uses tree-sitter
> 
> https://github.com/googleprojectzero/weggli
> ________________________________________________________
> Executed in   49.35 millis    fish           external
>    usr time  110.88 millis    0.00 millis  110.88 millis
>    sys time   87.44 millis    1.20 millis   86.24 millis

This looks like it's about the speed of grep, that sounds incredible.

> > Well I would say that this patchset is the last addition for the parser,
> > if we ever need anything more complex we should really switch to
> > something else. On the other hand I do not think that we will ever need
> > more complexity in the parser than this, as long as we keep things
> > sane.
> 
> This closes the door on a lot of options for no upside AFAICT. We have
> two tools (Sparse and tree-sitter) that can be (or have been) vendored
> and will parse a large subset of C. Sparse goes a step further allowing
> control flow analysis. The usual reasons for reinventing the wheel are
> not present.

Still working on a prototype based on tree-sitter would take a week or
two worth of time and I would like to get the metadata fixed now, so
that I can finally move on with runltp-ng. So I would slightly prefer
merging the patches for the current solution first, then we can have a
look on tree-sitter in the next LTP release cycle. What do you think?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
