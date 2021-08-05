Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7483E1155
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:34:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58F503C7EF6
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:34:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A78533C56ED
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:34:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 100611000F4A
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:34:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3EC5D222B6;
 Thu,  5 Aug 2021 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628156043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPK5f/A8kUsobsZrpRvify3cnZLk95YyhIk3l0NhvtE=;
 b=OV4e/RvdrjLLE+qQTUv8VdgQcSEnJhSoE6VNDNnEb41QRlqd9Jb2pUc4e3JTXa3SYte+AJ
 w2nKZjTtkgVc7/yRhcodSR5kaWob0hkNXGaZQQxqpGPxVGbDPE80jxoOzRdESkPLlM3STu
 6YO2TWP7Pg2fBNLsrhtbCPJGL4ChewA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628156043;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPK5f/A8kUsobsZrpRvify3cnZLk95YyhIk3l0NhvtE=;
 b=ucacVKbJfRJj5FVnEuRXTyW5wL9+wFjHd3sqNrKkOzVr9Bsl67DbkgA29SfEihF0yO8gyY
 +JAxEYiSL1sq9gBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E268B13BF0;
 Thu,  5 Aug 2021 09:34:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HnzaNYqwC2ESEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 09:34:02 +0000
Date: Thu, 5 Aug 2021 11:34:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YQuwk0xbFV1VZU/l@yuki>
References: <87czquna4l.fsf@suse.de>
 <20210803125252.16214-1-rpalethorpe@suse.com>
 <YQlhQa/q55F98Gui@yuki> <87a6lwmm6c.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6lwmm6c.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] API: TST_EXP_FAIL: Allow passing when
 errno is not checked
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
> >> This is also less surprising than giving errno == 0 a dual
> >> meaning.
> >
> > But I do agree that the current if (ERRNO) branch is confusing. I would
> > be for dropping the if (ERRNO) and checking the TST_ERR against ERRNO
> > unconditionally.
> >
> > Also note that the TEST() macro clears errno, so if a syscall fails but
> > does not report any error TST_ERR will end up 0 either way so there is
> > no need for having special handling for 0.
> 
> There is if the errno is set, but is undefined. Like if the resulting
> errno is platform or config dependent.
> 
> In the present case though we can just check for EINVAL. That is what
> the setsockopt man page indicates. Initially I wasn't sure if EFAULT
> were equally valid, but it seems not.

There was also an idea to add another version that would take an array
of possible errnos if that happens, but I fear that the complexity would
be getting out of hand if we keep adding features like that.

> I suppose we can fall back to using TEST() if the other case arises.

Yes.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
