Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4679A525E
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 11:00:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F4933C2125
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 11:00:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8A33B3C20C4
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 11:00:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9A4041A00F41
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 11:00:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEEBDAEC4;
 Mon,  2 Sep 2019 09:00:08 +0000 (UTC)
Date: Mon, 2 Sep 2019 11:00:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190902090007.GA21733@dell5510>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
 <20190809062000.8671-2-yixin.zhang@intel.com>
 <20190809141354.GF32115@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809141354.GF32115@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp 2/5] runtest: rename gf*** and rwtest{1..5} in
 lvm.part{1, 2} and scsi_debug.part1
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
Cc: ltp@lists.linux.it, Yixin Zhang <yixin.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Hi!
> > There are lots tests with duplicated name gf*** and rwtest0{1..5} in the
> > 3 runtest file but they are testing different fs. Rename them to
> > distingulish.

> > 1. Change gf*** to gf***_lvm/gf***_scsi
> > 2. Chagne rwtest** to rwtest{1..8}**_lvm/rwtest{1..8}**_scsi, which the
> >    code 1..8 is the code for the target filesystem

> I'm undecided on this one. On one hand I do not think that maintaining
> unique names across different runtest files is feasible.
+1
> On the other
> hand this case is probably fine since it's unlikely that we will change
> these files frequently.

> Does anybody have strong opinion on this?
Not really. At least adding "_lvm" is quite descriptive (unlike AD00{1..9} =>
ADA00{1..9} in 3/5 patch).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
