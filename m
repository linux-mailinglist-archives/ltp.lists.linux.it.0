Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C25598208
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Aug 2022 13:16:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19E003CA1B5
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Aug 2022 13:16:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 07D003CA0C6
 for <ltp@lists.linux.it>; Thu, 18 Aug 2022 13:16:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 378611000479
 for <ltp@lists.linux.it>; Thu, 18 Aug 2022 13:16:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 304FB20F8A;
 Thu, 18 Aug 2022 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660821401;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bG6wuYdC/zt/96T+C7daPM4586zII6xmpZDWC2O/VAQ=;
 b=ZML7uLw64ZxpWiBrYPX6QJRCOWsjyeAzHmNWlLWj+DwnFYeMtYQXJBMCltPsZty1dWR57r
 xS9jYOv2nI0qQLsPUJxk1/yyTvqZf6mGVuE1JjJfT2XzzCckNHw+/ksa8QyrXr1K/dG7nc
 ID6HF33mSESz4aLMCSFU3DxYESEVLEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660821401;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bG6wuYdC/zt/96T+C7daPM4586zII6xmpZDWC2O/VAQ=;
 b=+DH5oiUuV12h9g/c2MladcB1I0aUtFKDlHLPSjQeHuEfqz9X3GQ4FTusSbJU7WzmG/9Krb
 vr+5E5PgekN18wBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA3B4139B7;
 Thu, 18 Aug 2022 11:16:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AfEeN5gf/mKkJwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 18 Aug 2022 11:16:40 +0000
Date: Thu, 18 Aug 2022 13:16:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Yv4fllRUrfmdjcgg@pevik>
References: <20220818100945.7935-1-pvorel@suse.cz>
 <20220818100945.7935-2-pvorel@suse.cz>
 <CAOQ4uxhvf11FxVJcGiy_GpVHALXNnC4qFc0azTi2Qn_FS3oqyw@mail.gmail.com>
 <Yv4dons8AYcqE9gU@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yv4dons8AYcqE9gU@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] tst_device: Increase DEV_MIN_SIZE to 300 MB
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
Cc: LTP List <ltp@lists.linux.it>, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > Previous default 256 MB was not enough for mkfs.xfs since v5.19.0-rc1
> > > [1] which refuses to create filesystems < 300 MB. Although the
> > > limitation can be workarounded by setting three environment variables,
> > > it's better to increase the variable.

> > > [1]: https://lore.kernel.org/all/164738662491.3191861.15611882856331908607.stgit@magnolia/

> > > Reported-by: Martin Doucha <mdoucha@suse.cz>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > >  lib/tst_device.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)

> > > diff --git a/lib/tst_device.c b/lib/tst_device.c
> > > index c34cbe6d1..8419b80c3 100644
> > > --- a/lib/tst_device.c
> > > +++ b/lib/tst_device.c
> > > @@ -44,7 +44,7 @@
> > >  #define LOOP_CONTROL_FILE "/dev/loop-control"

> > >  #define DEV_FILE "test_dev.img"
> > > -#define DEV_SIZE_MB 256u
> > > +#define DEV_SIZE_MB 300u

> > Subject is wrong - it is saying DEV_MIN_SIZE

> > It really looks weird that DEV_SIZE_MB < DEV_MIN_SIZE
> > What am I missing?

> The DEV_MIN_SIZE macro is used in a LTP test library API test that
> checks that test can override minial device size so it has to be greater
> than DEV_SIZE_MB which is the size used by the test library when
> loopback devices are created.
Tests in lib/newlib_tests/ are tests which test the LTP itself,
maybe use some prefix for these constants would make obvious that it's not part
of the library (i.e. not visible in normal LTP tests).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
