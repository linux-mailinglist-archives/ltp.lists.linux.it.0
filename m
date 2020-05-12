Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED811CFEB5
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 21:50:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E83D3C2465
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 21:50:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8B9503C0944
 for <ltp@lists.linux.it>; Tue, 12 May 2020 21:50:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 29C451A010A6
 for <ltp@lists.linux.it>; Tue, 12 May 2020 21:50:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3207BAC96;
 Tue, 12 May 2020 19:50:38 +0000 (UTC)
Date: Tue, 12 May 2020 21:50:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200512195033.GA3784@dell5510>
References: <20200512152701.23625-1-pvorel@suse.cz>
 <d011a55b-a5b5-049f-9037-235d1f18cf1b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d011a55b-a5b5-049f-9037-235d1f18cf1b@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] rpc: Warn when tests aren't compiled
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

...
> >  rpc_parse_args()
> >  {
> > +	local err="LTP compiled without TI-RPC support"
> > +
> >  	case "$1" in
> > -		c) CLIENT="$OPTARG" ;;
> > -		e) CLIENT_EXTRA_OPTS="$OPTARG" ;;
> > -		s) SERVER="$OPTARG" ;;
> > +	c) CLIENT="$OPTARG"; tst_cmd_available $OPTARG || tst_brk TCONF $err;;
> > +	e) CLIENT_EXTRA_OPTS="$OPTARG";;
> > +	s) SERVER="$OPTARG"; tst_cmd_available $OPTARG || tst_brk TCONF $err;;
> >  	esac

> Perhaps this one, to write about the missing command:
> tst_require_cmds $CLIENT $SERVER

> or just $CLIENT because it's always used, and if the hint is needed:
> tst_check_cmds $CLIENT $SERVER || tst_brk TCONF "LTP compiled without TI-RPC support?"
I prefer to have the hint, so I'll merge this variant.

Thanks for your review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
