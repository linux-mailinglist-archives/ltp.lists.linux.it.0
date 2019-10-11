Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A89D3AA4
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:17:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CD0A3C1480
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:17:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3B85F3C1443
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:17:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7E76A200B6B
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:17:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A804AB124;
 Fri, 11 Oct 2019 08:17:36 +0000 (UTC)
Date: Fri, 11 Oct 2019 10:17:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191011081735.GB31207@dell5510>
References: <20190930145916.20465-1-pvorel@suse.cz>
 <20190930145916.20465-4-pvorel@suse.cz>
 <20191009143635.GF7561@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009143635.GF7561@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v4 3/5] shell: Add timeout shell API tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > +DATA="
> > +timeout01.sh||0
> > +timeout02.sh||0
> > +timeout02.sh|foo|32
> > +timeout02.sh|2|0
> > +timeout02.sh|1.1|0
> > +timeout02.sh|-10|32
> > +"
> > +
> > +echo "Testing timeout in shell API"
> > +echo
> > +
> > +failed=0
> > +IFS="
> > +"

> Do we have to change IFS here? It should be set to space, tab, and
> newline by default, so the loop over $DATA should work correctly
> anyways.
Again, thanks for catching this.
It's a left over from prototyping, where I had spaces in some data rows,
therefore it was needed.

> > +for i in $DATA; do
> > +	file=$(echo $i | cut -d'|' -f1)
> > +	timeout=$(echo $i | cut -d'|' -f2)
> > +	exp_exit=$(echo $i | cut -d'|' -f3)

Unless you want me to do else with tst_test_cmds in tst_test.sh,
I'll merge with changes you found.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
