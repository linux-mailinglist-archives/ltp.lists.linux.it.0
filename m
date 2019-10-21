Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B9DEE01
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 15:41:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7E7B3C23E8
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 15:41:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 54D5E3C22A6
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:41:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 37221200BB5
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:41:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53DAAB15A
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:41:05 +0000 (UTC)
Message-ID: <1571665264.4633.8.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>, Richard Palethorpe <rpalethorpe@suse.de>
Date: Mon, 21 Oct 2019 15:41:04 +0200
In-Reply-To: <20191021131530.GB18513@x230>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-6-cfamullaconrad@suse.de>
 <87h842o2pp.fsf@rpws.prws.suse.cz> <20191021131530.GB18513@x230>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 5/5] Adopt doc for TST_RETRY_FUNC for
 LTP_TIMEOUT_MUL
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

On Mon, 2019-10-21 at 15:15 +0200, Petr Vorel wrote:
<snip>
> > I think the function tst_multiply_timeout also needs documenting.
> 
> Isn't it meant to be used just in library (in lib/tst_test.c)?
> Thus I wouldn't document it here. And in fact remove it from
> include/tst_test.h
> (second commit).

I'm ok with private function. But you need to make it available to
tst_common.h. We could use extern. But not sure if this is what we
want.

On the other hand, we could make it as lib function, so others, who
need to set timeout in arbitrary way, have a utility to adjust there
timeout in a generic way. WDYT? But we also could leave this for later,
and simply change it if really needed.

Thanks
Clemens

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
