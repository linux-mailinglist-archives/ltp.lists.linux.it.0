Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F4455AC5
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Nov 2021 12:41:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C9133C8855
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Nov 2021 12:41:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D3DB3C08C9
 for <ltp@lists.linux.it>; Thu, 18 Nov 2021 12:41:25 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DB3316010B4
 for <ltp@lists.linux.it>; Thu, 18 Nov 2021 12:41:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0DE1F2177B;
 Thu, 18 Nov 2021 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637235684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yuolOSp9iFI7Q6IqwEufRD8zxhFeRZg8TpgZM/2grEQ=;
 b=mNr5WlkiELO6KFzQH7n40YbU2rKi8MSx9nH8lKVWgrdVMVzZkj3ASFQTHGUDscqAHQkNkF
 Sr4yLSK4YWDV5c7/pSqHRPL/vbTKBISQgoQB7jIYAzNkAEaopva3qsEXtTciBXFsL4e+wk
 uKcNBKk4Dl/UjYmgLSN2VX7obuT4dY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637235684;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yuolOSp9iFI7Q6IqwEufRD8zxhFeRZg8TpgZM/2grEQ=;
 b=dIrzzbGY2ZY8Jqu2nruIWk1f+mutbyKnTVh+VifZa3Xp99hA4oLBrnIt2+wl/p0UWqSqUl
 30hl0/ectqKMwvCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E26C913D00;
 Thu, 18 Nov 2021 11:41:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v6NuNuM7lmGkMAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 18 Nov 2021 11:41:23 +0000
Date: Thu, 18 Nov 2021 12:42:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YZY8JQlE2EEVEIKX@yuki>
References: <20211117070708.2174932-1-liwang@redhat.com>
 <87zgq39j2b.fsf@suse.de>
 <CAEemH2cYn6XmsL+5m20aiadUrqWDwoE_+KQ5pm5rT5p34-Omug@mail.gmail.com>
 <87mtm2amkd.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtm2amkd.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: adding .supported_archs field in
 tst_test structure
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >  These are not valid arch names AFAICT. There is no mapping from these to
> >  x86 in the tst_arch table above.
> >
> >  Perhaps we could replace them all with x86?
> >
> > Yes, that is also the unsure part I was concerned about in patch v4. 
> > Because x86 is also an invalid arch (it is just a conventional name),
> > if we use it in the arch_type_list we have to recognize it as a valid arch
> > name in test case as well. I'm not sure that will be accepted by other
> > people.
> 
> The folder in the kernel tree is arch/x86.

The x86 is basically a wildcard where the x could be substitued with any
of {3,4,5,6,7}. Also I think that 786 was last 32bit intel arch ever
released.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
