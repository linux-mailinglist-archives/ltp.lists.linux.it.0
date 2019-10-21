Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D143DEE6D
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 15:53:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01A7A3C23FE
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 15:53:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 683263C2359
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:53:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7712C1A00EA0
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:53:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A88BCB9BC
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:53:47 +0000 (UTC)
Date: Mon, 21 Oct 2019 15:53:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191021135345.GA8999@x230>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-6-cfamullaconrad@suse.de>
 <87h842o2pp.fsf@rpws.prws.suse.cz> <20191021131530.GB18513@x230>
 <1571665264.4633.8.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571665264.4633.8.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Clemens,

> > Isn't it meant to be used just in library (in lib/tst_test.c)?
> > Thus I wouldn't document it here. And in fact remove it from
> > include/tst_test.h
> > (second commit).

> I'm ok with private function. But you need to make it available to
> tst_common.h. We could use extern. But not sure if this is what we
> want.

> On the other hand, we could make it as lib function, so others, who
> need to set timeout in arbitrary way, have a utility to adjust there
> timeout in a generic way. WDYT? But we also could leave this for later,
> and simply change it if really needed.
Well, it's not that important to complicate things.
My point was, that function is used only internally, unlike tst_set_timeout()
and tst_timeout_remaining() which are also used in some tests.

> Thanks
> Clemens

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
