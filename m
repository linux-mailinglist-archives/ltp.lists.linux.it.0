Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F51CF19FA
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 16:26:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E3D43C23F2
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 16:26:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4C5E93C23B4
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 16:26:37 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A935314000F9
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 16:26:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0CC4AE89
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 15:26:35 +0000 (UTC)
Date: Wed, 6 Nov 2019 16:26:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191106152634.GA12403@rei.lan>
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-2-chrubis@suse.cz>
 <20191022141946.GA16121@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022141946.GA16121@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add support for test tags
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
> > +	fprintf(stderr, "Options\n");
> > +	fprintf(stderr, "-------\n\n");
> I still would remove this extra new line:
> 	fprintf(stderr, "-------\n");
> > +
> >  	for (i = 0; i < ARRAY_SIZE(options); i++)
> >  		fprintf(stderr, "%s\n", options[i].help);
> 
> > @@ -424,6 +430,28 @@ static void print_help(void)
> >  		fprintf(stderr, "%s\n", tst_test->options[i].help);
> >  }
> 
> > +static void print_test_tags(void)
> > +{
> > +	unsigned int i;
> > +	const struct tst_tag *tags = tst_test->tags;
> > +
> > +	printf("\nTags\n");
> > +	printf("----\n\n");
> And here:
> 	printf("----\n");

Changed as you suggested and pushed whole patchset, many thanks for
reviews.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
