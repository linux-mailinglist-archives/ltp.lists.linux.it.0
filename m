Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8E79A5AC
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Sep 2023 10:11:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E8DE3CB3C3
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Sep 2023 10:11:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6EDC93CB383
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 10:11:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C9C40601463
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 10:11:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40B8C211C3;
 Mon, 11 Sep 2023 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694419865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/XA6RWrkX5Nuz6Bi63EUf8SnjabX0jGPBn2MJ3D4GE=;
 b=EPQtd3UY90XAijT3CXrgwph3qLcy2j1x5x2pBFBj24PT8MnJ6Q7FtvfZVAofd6/H0gL4+f
 JYddZec0W/qbLQpGBEbRyeSgDtG6kByZx4MNOXb0FVC2j9QJB4Emm8vZ80DPIypsP3+I2c
 cykI9Enoq7Nui5a5vlzL3yLXUCV4iwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694419865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v/XA6RWrkX5Nuz6Bi63EUf8SnjabX0jGPBn2MJ3D4GE=;
 b=WJMD+cJ0Az3H3lUdQKNzBptlkKQJW8NPg39aUqE6jYp/37imj/A0lZ7aDxGT8AlHeAAiI5
 wg+ib1k5oPnwkRBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27FBD139CC;
 Mon, 11 Sep 2023 08:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ADQCJnL/mRzfAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 11 Sep 2023 08:11:05 +0000
Date: Mon, 11 Sep 2023 10:11:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <ZP7Lxe_2NqAaZhb7@yuki>
References: <20230524093930.43971-1-liwang@redhat.com>
 <20230524093930.43971-2-liwang@redhat.com> <ZPm0St324pYfmCzj@yuki>
 <CAEemH2c0-bQ1+G6NaQGjh2KAO8qfPLvKh7UmiC2ETH1T__NL2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c0-bQ1+G6NaQGjh2KAO8qfPLvKh7UmiC2ETH1T__NL2w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] hugemmap33: Test to detect bug with
 migrating gigantic pages
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
> > > +     if (tst_taint_check())
> > > +             tst_res(TFAIL, "Test resulted in kernel tainted");
> > > +     else
> > > +             tst_res(TPASS, "Test completed successfully");
> >
> > tst_test.taint_check ?
> >
> 
> We have to keep these check sentences otherwise it will
> complain with no reporting results.
> 
>   tst_hugepage.c:103: TINFO: 2 hugepage(s) reserved
>   tst_test.c:1562: TINFO: Timeout per run is 0h 01m 30s
>   hugemmap34.c:107: TINFO: Runtime exhausted, exiting
>   tst_test.c:1394: TBROK: Test haven't reported results!

Right the .taint_check only produces TFAIL when kernel taint flags
change during the duration of the test.

We can as well do the same as we do in most of the CVE tests that have
this line at the end of the run() function:

tst_res(TPASS, "Nothing bad happened, probably.");

Or we can keep the tst_taint_check() in the code, but I guess that we
are missing tst_taint_init() in the test setup(), or am I mistaken?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
