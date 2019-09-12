Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A82B14E3
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 21:46:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DE763C20AF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 21:46:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6484C3C0428
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 21:46:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3C45460084B
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 21:46:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4ECCAD44
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 19:46:52 +0000 (UTC)
Message-ID: <1568317611.3621.36.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 12 Sep 2019 21:46:51 +0200
In-Reply-To: <1568306963.3621.34.camel@suse.de>
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911165225.2122-1-cfamullaconrad@suse.de>
 <CAEemH2fy0hQc0yXJY0BXf8-9nnzkDW9LEsydyhtHC3Jboc_tFA@mail.gmail.com>
 <1568278363.3621.6.camel@suse.de> <20190912145539.GC22246@dell5510>
 <1568306963.3621.34.camel@suse.de>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2019-09-12 at 18:49 +0200, Clemens Famulla-Conrad wrote:
> On Thu, 2019-09-12 at 16:55 +0200, Petr Vorel wrote:
> > 
> > BTW: I haven't finish patchset doing the same [1]. Feel free to
> > include docs
> > from [2].
> 
> Thx for that hint, was aware of that patchset [1].
                        ^
                        not (important detail :)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
