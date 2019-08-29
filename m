Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADBA273C
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:25:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9EEC3C2017
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:25:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4DE673C1CFD
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:25:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D8D5A600F06
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:25:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8856FAC94;
 Thu, 29 Aug 2019 19:25:19 +0000 (UTC)
Date: Thu, 29 Aug 2019 21:25:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20190829192518.GA1197@dell5510>
References: <20190829190709.30834-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829190709.30834-1-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_net.sh: Move variable and link setup to
 separate function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> When using LTP with netns ("Single Host Configuration"),
> init_ltp_netspace before running test which performs checking for
> TST_NEEDS_ROOT=1, therefore adding it is not enough.
> It fails on adding netns:

> RTNETLINK answers: Operation not permitted
> sctp01 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

> NOTE: tst_restore_ipaddr is called before running tests only on netns,
> in init_ltp_netspace, therefore tst_require_root_ as a check is enough.

> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Rejecting it myself, as it's not an improvement.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
