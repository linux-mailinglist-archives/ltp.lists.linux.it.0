Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B7396C01
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 06:03:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84CE93C90C9
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 06:03:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48A343C5A13
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 06:03:18 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 646D71000D0D
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 06:03:18 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64C9721922;
 Tue,  1 Jun 2021 04:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622520197;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZdPONxn1mmWtQkhgYmZae8Tsqjd5tCEy0BcX4lDi8c=;
 b=jjSU0GcPyY6fR9r94f5f66hdhHTjEeL/CbqF++hcZWetOQecXNUKrcWwAiOujZqGrYDnFX
 wCQfqVNxZEjJWUaHdtRi/Y9z103WhDRe4bZOzCWKMKQhVOvK68HhzjY6MYdkBvSZA4C3cQ
 8GPUooWNcjSePYl863s5XHdZDg8ujOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622520197;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZdPONxn1mmWtQkhgYmZae8Tsqjd5tCEy0BcX4lDi8c=;
 b=KqBJOViAGUm4d2eSjEzK/HUfExOq/r1Zd7KmqXe5KWJaDDfssKhXo9hpmngmz7Zgd5MH4+
 zsJHyj9IpErxa7CQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A75E2118DD;
 Tue,  1 Jun 2021 04:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622520196;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZdPONxn1mmWtQkhgYmZae8Tsqjd5tCEy0BcX4lDi8c=;
 b=fyF+1HlNBCdgFoHyMVxjUxXV/EAR9WOlyZOb1+kLwJiQMBNr0qi9jXsxQHmeqHti14UcnC
 RLLLOj1sIGL/Ne2mV9WRrsl9SaFgVVsXOF2SwxnSIYJmebiBdApWSAjDdt9qrLVkRbq2sK
 iHGUSngBBSGZO8wOQmtUzm9Ch90cl4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622520196;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZdPONxn1mmWtQkhgYmZae8Tsqjd5tCEy0BcX4lDi8c=;
 b=9agga+serrFxBFyuNW/AJsQGDOvIc5y8/IrtGPr5FSOmQasp7qnQC6pO7UNIMuOwHZBLjA
 12JHpT/GOSe9E3Dw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 8QYiJ4SxtWAoTgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 04:03:16 +0000
Date: Tue, 1 Jun 2021 06:03:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YLWxg0t9xyLshEHS@pevik>
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com> <YLTbXU1ZF4ZiXKdt@yuki>
 <20f87781-e66d-e8c6-1ac5-de208667a7f2@jv-coder.de>
 <YLTdT3v4AscW1PIE@yuki>
 <CAEemH2dCBG6VqncBCG=SmRbC0kHaxpwfXpAU4ovPe8RcYd6D_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dCBG6VqncBCG=SmRbC0kHaxpwfXpAU4ovPe8RcYd6D_A@mail.gmail.com>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.50
X-Spamd-Result: default: False [-0.50 / 100.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; NEURAL_HAM_SHORT(-1.00)[-1.000];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, all,

> > Okay. Let's go with this version, it's simple enough and anything that
> > would behave better would only overcomplicate the code again.

> > For the patch:

> > Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> Thanks for the review, I helped merge the patch V2.
> (tiny updates in v2: 'add comments + remove trap' from timeout03)

Thanks a lot for finishing this, sorry for late reply.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
