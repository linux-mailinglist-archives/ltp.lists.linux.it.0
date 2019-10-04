Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7ECC154
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 19:05:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36A813C2266
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 19:05:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C78AD3C04FC
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 19:05:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A2357601000
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 19:04:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3937BAE5C
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 17:05:22 +0000 (UTC)
Date: Fri, 4 Oct 2019 19:05:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191004170520.GA24112@dell5510>
References: <20190930115852.21672-1-pvorel@suse.cz>
 <20190930115852.21672-3-pvorel@suse.cz> <20191003114428.GC1858@rei>
 <20191003164347.GA2061@dell5510> <20191004132129.GE5442@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004132129.GE5442@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> > Yep, I'm aware ffsb is needed from $LTPROOT/bin. I haven't forced to send
> > proposal about ffbs adding into separate repository, that why I included it.
> > But sure, I'll drop this part.
> > Ack the rest?

> Yes, the rest is fine.

Thanks, merged, with simple change:

-For more info see `doc/user-guide.txt`.
+For more info see `doc/user-guide.txt` or online at
+https://github.com/linux-test-project/ltp/wiki/User-Guidelines.

(I created that page in wiki).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
