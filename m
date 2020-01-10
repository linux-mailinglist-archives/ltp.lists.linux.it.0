Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A4E137150
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:32:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B61E23C25BB
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:32:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E73FD3C24E9
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:32:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4E9DB601CDD
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:32:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E005B184;
 Fri, 10 Jan 2020 15:32:10 +0000 (UTC)
Date: Fri, 10 Jan 2020 16:32:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200110153208.GA219598@x230>
References: <20200110151443.212842-1-pvorel@suse.cz>
 <20200110152607.GB23359@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110152607.GB23359@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_device: use raw syscall in the
 tst_device.h
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

Hi all,

> Hi!
> > tested on
> > https://travis-ci.org/pevik/ltp/builds/635305638

> > Please anybody ack and merge, so we can move on with merging other
> > things before git freeze.

> Acked once and if the travis run finishes green.
Merged. As I wrote, 3 broken Debian testing jobs are related to bug in libtirpc
1.2.5, which are fixed by following commit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
