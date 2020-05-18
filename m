Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C31D8A2A
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 23:43:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61AE63C4F46
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 23:43:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AC94D3C042A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 23:42:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A2CD01401AB0
 for <ltp@lists.linux.it>; Mon, 18 May 2020 23:42:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F0CAAB99;
 Mon, 18 May 2020 21:42:57 +0000 (UTC)
Date: Mon, 18 May 2020 23:42:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200518214253.GB22879@dell5510>
References: <20200512201416.8299-1-pvorel@suse.cz>
 <5EC287EE.9070508@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EC287EE.9070508@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] rpc: TCONF when tests aren't compiled +
 remove kill warning
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

Hi Xiao,

> On 2020/5/13 4:14, Petr Vorel wrote:
> > Without this test failure was wrongly reported:
> > rpc_test 1 TFAIL: tirpc_rpcb_getaddr 10.0.0.2 536875000 failed unexpectedly
> Hi Petr,

> Do you know which caused this failure?
Certain tests compiled with TI-RPC on glibc (not on libtirpc): rpc_pmap_set,
rpc_pmap_unset, rpc_svc_register. NOTE glibc implementation is fading out,
nothing really important.

Before I just disable these tests, I've asked the experts [1] and posted
patchset to show some debug info.

Kind regards,
Petr

[1] https://sourceforge.net/p/libtirpc/mailman/message/37014386/
[2] https://patchwork.ozlabs.org/project/ltp/list/?series=177741&state=*

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
