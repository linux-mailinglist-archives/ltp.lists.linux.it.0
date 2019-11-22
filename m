Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EE1071B2
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 12:49:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00CAC3C2266
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 12:49:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 84C713C2241
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 12:49:45 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 482FD10013BA
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 12:49:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B84C7B131;
 Fri, 22 Nov 2019 11:49:42 +0000 (UTC)
Date: Fri, 22 Nov 2019 12:49:41 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191122114941.GB19146@rei.lan>
References: <20191122100508.21265-1-chrubis@suse.cz>
 <5c00ffaa-c639-52d9-6305-edc7790e1769@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c00ffaa-c639-52d9-6305-edc7790e1769@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] network/sctp_big_chunk: Add linux git
 tag
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
> >  testcases/network/sctp/sctp_big_chunk.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/testcases/network/sctp/sctp_big_chunk.c b/testcases/network/sctp/sctp_big_chunk.c
> > index 4ebdcb20f..ceb91c5b9 100644
> > --- a/testcases/network/sctp/sctp_big_chunk.c
> > +++ b/testcases/network/sctp/sctp_big_chunk.c
> > @@ -182,5 +182,9 @@ static struct tst_test test = {
> >  	.setup = setup,
> >  	.forks_child = 1,
> >  	.test_all = run,
> > -	.options = options
> > +	.options = options,
> > +	.tags = (const struct tst_tag[]) {
> > +		{"linux-git", "07f2c7ab6f8d"},
> 
> And {"CVE", "2018-5803"}, will add to the tags.

Feel free to push that change, I had no idea since there is no CVE in
the test description either.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
