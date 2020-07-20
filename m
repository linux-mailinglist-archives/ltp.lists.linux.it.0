Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 467FB225A46
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:43:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16A7D3C2932
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 10:43:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9EA7D3C223B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:43:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0744C600699
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 10:43:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AD1CB817;
 Mon, 20 Jul 2020 08:43:37 +0000 (UTC)
Date: Mon, 20 Jul 2020 10:43:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200720084329.GE11397@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-3-pvorel@suse.cz>
 <5F155335.8080901@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F155335.8080901@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/7] tst_net.sh: Use ssh in LTP_RSH
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

Hi Yang,
> Hi Petr,

> Some very old stress tests use check_envval(instead of tst_net.sh) to
> init LTP_RSH,
> Do you think if we need to change it as well:
> --------------------------------------
> # LTP_RSH
> LTP_RSH=${LTP_RSH:=}
> if [ x"${LTP_RSH}" = x ]; then
> LTP_RSH="rsh -n"
> elif [ "$LTP_RSH" = "rsh" ]; then
> LTP_RSH="rsh -n"
> fi
> --------------------------------------

No, I wouldn't touch this legacy code. The goal is to rewrite this old code,
there is a ticket for it:
https://github.com/linux-test-project/ltp/issues/440

> Thanks,
> Xiao Yang

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
