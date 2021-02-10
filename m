Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5A316782
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 14:09:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC3653C6EBC
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 14:09:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6188C3C6292
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 14:08:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7D2B2000D2
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 14:08:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6E41AC97;
 Wed, 10 Feb 2021 13:08:57 +0000 (UTC)
Date: Wed, 10 Feb 2021 14:08:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YCPa6EI4zyGzDEz1@pevik>
References: <20210205151015.7465-1-pvorel@suse.cz> <YB7qefsNWbCJXUEu@pevik>
 <5f9aecc2-096b-6b24-bdfa-f9d361fcbac7@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f9aecc2-096b-6b24-bdfa-f9d361fcbac7@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] net/multicast: Create mcast_setup_normal()
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

Hi Alexey,

> > +++ testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> > @@ -12,13 +12,13 @@ TST_NEEDS_ROOT=1
> >  TST_SETUP="mcast_setup_normal"
> >  . mcast-lib.sh

> > -MCAST_LCMD="ns-mcast_receiver"
> > -MCAST_RCMD="ns-udpsender"
> > -
> >  do_test()
> >  {
> >  	tst_res TINFO "joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of UDP packets at each socket in $NS_DURATION seconds"

> > +	MCAST_LCMD="ns-mcast_receiver"
> > +	MCAST_RCMD="ns-udpsender"
> > +

> Hi Petr,

> Perhaps it would be better to move this to another wrapper
> in the lib along with mcast_setup_normal()?

Good idea, thanks!

> mcast_setup_normal_udp()
> {
>         mcast_setup_normal
> 	MCAST_LCMD="ns-mcast_receiver"
> 	MCAST_RCMD="ns-udpsender"
> }

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
