Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8A6D9436
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:46:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 737983C22C7
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:46:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 545E23C1452
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:46:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 20C4360165F
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:46:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72322AE47
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 14:46:25 +0000 (UTC)
Date: Wed, 16 Oct 2019 16:46:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191016144624.GB19517@rei.lan>
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-2-chrubis@suse.cz>
 <20191016133039.GA6842@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016133039.GA6842@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add support for test tags
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
> > +	if (tags) {
> > +		for (i = 0; tags[i].name; i++) {
> > +			if (!strcmp(tags[i].name, "CVE"))
> > +				printf(CVE_DB_URL "%s\n", tags[i].value);
> > +			else if (!strcmp(tags[i].name, "linux-git"))
> Not sure if it's worth of defining some enums instead of "CVE", "linux-git"
> (would catch typos).

I wanted to avoid enums because they are not flexible enough. The plan
here is that docparse would do sanity checks on test metadata and fail
the compilation if it founds typos there. With the checks in the
docparse tool we can easily check for tags that looks like typos, i.e.
check the levenshtein distance from all known tags and print a nice
looking error message...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
