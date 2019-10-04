Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E983ACBB8F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 15:21:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4F1E3C226D
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 15:21:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CF0383C2219
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 15:21:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 14F8710018AF
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 15:20:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B233AF70
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 13:21:38 +0000 (UTC)
Date: Fri, 4 Oct 2019 15:21:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191004132129.GE5442@rei.lan>
References: <20190930115852.21672-1-pvorel@suse.cz>
 <20190930115852.21672-3-pvorel@suse.cz> <20191003114428.GC1858@rei>
 <20191003164347.GA2061@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003164347.GA2061@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] doc: Add user-guide.txt
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
> > >  ```
> > > -$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> > > +$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/bin:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> > >  ```
> 
> > This looks like an unrelated change at best and should probably be part
> > of a separate patch.
> 
> > Also the only thing that seems to be installed in $LTPROOT/bin/ that
> > could be potentially used by tests is the ffsb tool, that we are going
> > to get rid anyways. So I would have avoided including it in the example
> > anyways.
> 
> Yep, I'm aware ffsb is needed from $LTPROOT/bin. I haven't forced to send
> proposal about ffbs adding into separate repository, that why I included it.
> But sure, I'll drop this part.
> Ack the rest?

Yes, the rest is fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
