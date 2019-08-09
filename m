Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6B876EC
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 12:07:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 870DD3C1D2D
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 12:07:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 798243C1441
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 12:07:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5ED10201343
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 12:07:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92A9BAC9B;
 Fri,  9 Aug 2019 10:07:03 +0000 (UTC)
Date: Fri, 9 Aug 2019 12:07:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190809100701.GB27030@dell5510>
References: <20190806164523.557-1-pvorel@suse.cz>
 <20190809093354.GA13178@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809093354.GA13178@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/4] build: Move
 -Werror-implicit-function-declaration from make to build.sh
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

> > +CFLAGS="${CFLAGS:--Werror-implicit-function-declaration}"

> Shouldn't this be -Werror=implicit-function-declaration ?
Yes, it is. '${CFLAGS:-' part is POSIX shell substitute (${parameter:-[word]}
from [1]), the result is '-Werror=implicit-function-declaration' when CFLAGS is
empty or not set.
I might change it as

I might change it to more readable form:
DEFAULT_CFLAGS="-Werror-implicit-function-declaration"
CFLAGS="${CFLAGS:-$DEFAULT_CFLAGS}"

> Hmm, looks like both variants actually work, but the gcc manual speaks
> only about -Werror= one.


> Otherwise it looks good, acked.
Thx! Although I plan to send some RFC for moving ffsb as a subproject, it has a
low priority. So I'll merge this with your ack.

Kind regards,
Petr

[1] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
