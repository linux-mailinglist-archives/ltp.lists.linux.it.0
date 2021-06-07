Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DA939DE58
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 16:08:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A81F23C574C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 16:08:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B7973C0B9A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:08:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A9EB6200207
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:08:09 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0F6C21A9C;
 Mon,  7 Jun 2021 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623074888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cv/ljFXdhNxhFBtHDpL4TdLQ2SftPKf5waR43qJrPJk=;
 b=dZwAAgftOxak7Df9h/kb1/iloUkrxh5C3sNv5JUqQ0WlHdQVYS6dggHJsEQHm9MOqMnVi7
 4j7gE3O8FklmZiS+p4pQpLevCihbI6cl/yzq2FQTNf+KQh+mCqRG48pCdwTI25GNHWvM6L
 FJgcrNjSQ3XLGD8uoZICj8GuYThgFVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623074888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cv/ljFXdhNxhFBtHDpL4TdLQ2SftPKf5waR43qJrPJk=;
 b=uDIZvpg2Gew/PFOdShPFZQnieJbhaYwOFg7deKIP4CQkNIAIyo4RjLUgIdwuilrZ8ecclp
 mjYLnyk7hrkMngBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BE49A118DD;
 Mon,  7 Jun 2021 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623074888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cv/ljFXdhNxhFBtHDpL4TdLQ2SftPKf5waR43qJrPJk=;
 b=dZwAAgftOxak7Df9h/kb1/iloUkrxh5C3sNv5JUqQ0WlHdQVYS6dggHJsEQHm9MOqMnVi7
 4j7gE3O8FklmZiS+p4pQpLevCihbI6cl/yzq2FQTNf+KQh+mCqRG48pCdwTI25GNHWvM6L
 FJgcrNjSQ3XLGD8uoZICj8GuYThgFVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623074888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cv/ljFXdhNxhFBtHDpL4TdLQ2SftPKf5waR43qJrPJk=;
 b=uDIZvpg2Gew/PFOdShPFZQnieJbhaYwOFg7deKIP4CQkNIAIyo4RjLUgIdwuilrZ8ecclp
 mjYLnyk7hrkMngBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id cbaRLEgovmBDOgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 14:08:08 +0000
Date: Mon, 7 Jun 2021 15:42:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YL4iOWJj1e+foCNr@yuki>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
 <85bddc61-f6dc-de7c-3a62-daeefcd0a058@jv-coder.de>
 <87bl8i563x.fsf@suse.de>
 <52c808d5-c5d7-3a79-122b-428fe2802957@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52c808d5-c5d7-3a79-122b-428fe2802957@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 0/2] Libclang based analyzer
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
> > IIRC Cyril said the Coccinelle package on Gentoo is not maintained
> > anymore. AFAICT it exists, but it is on an old version. I don't think
> > many people are interested in or want to maintain Ocaml
> > stuff. LLVM/Clang OTOH looks to be very active.
> Right, it actually is removed now from gentoo portage tree ([1]). But is 
> it used by the kernel developers?

I guess that some people use it, however the choice of programming
language makes everthing much harder. On some distributions it's hard to
install and requires manual steps and when you hit a bug it's impossible
to debug unless you know how to debug ocaml. I've tried to fix a simple
bug in coccinelle once, but gave up after a few hours since I wasn't
even able to gasp how the source code is structured. And for the record
I used to read and write lisp and haskell just fine during my university
days. So even my skills in functional programming are rusty now I did
not expect that ocaml would be so alien to me...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
