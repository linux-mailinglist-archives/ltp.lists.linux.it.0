Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E7180238
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 16:46:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F10313C6028
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 16:46:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2EB1D3C5FFF
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 16:46:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9605060066C
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 16:46:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DAF09AC42;
 Tue, 10 Mar 2020 15:46:34 +0000 (UTC)
Date: Tue, 10 Mar 2020 16:46:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200310154633.GA25942@dell5510>
References: <20200305192716.10313-1-pvorel@suse.cz>
 <5b00a232-d175-9cb1-ba20-ccd5d6e93cdc@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b00a232-d175-9cb1-ba20-ccd5d6e93cdc@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] nfs_lib: Unify testing on netns
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

thanks for your review!

> > There is no need to run tests on opposite client/server when using
> > $TST_USE_NETNS based setup. It's enough just to set lhost IP address.
> > This simplifies code a bit.

> It changes the testcase, this way nfs traffic will go through
> lo interface, the test won't use ltp_ns_veth* and netns.
Sorry, I didn't notice this.
BTW code nfs_setup_server could be run by tst_rhost_run() (code simplification),
but that's a detail.

> We could add the knob for this scenario with LTP_NFS_USE_NETNS={1|0}?
Is this scenario useful? It does not look to me as a real world scenario,
but if I'm wrong let's add it :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
