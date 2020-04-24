Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EE1B75F3
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 14:53:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A13E3C2908
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 14:53:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9CC433C28F6
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 14:53:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C6B66601AE2
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 14:53:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B900AC5B;
 Fri, 24 Apr 2020 12:53:50 +0000 (UTC)
Date: Fri, 24 Apr 2020 14:53:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200424125349.GA31142@dell5510>
References: <20200421180002.11351-1-pvorel@suse.cz>
 <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/sendfile01.sh: Check with timeout
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

> > What bothers me more, that TST_NEEDS_CMDS does not check command on
> > rhost. Do we want to have something like TST_NEEDS_CMDS_RHOST or we just
> > don't care?

> In general, yes, we need to check if a command exists on the remote host.
> Yet another variable, what about checking what in TST_NEEDS_CMDS on the
> remote host? Though TST_NEEDS_CMDS_RHOST looks quite well.

Hm, looking on the implementation. tst_require_cmds() and tst_cmd_available()
are functions, thus not runnable with tst_rhost_run(). We can add this code to
custom shell script which checks or C code (shell has dependencies). Or any
other idea?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
