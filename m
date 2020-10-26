Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2D298E5A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 14:45:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 528173C313D
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 14:45:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0FEDC3C0B87
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 14:45:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B5C65200AE1
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 14:45:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00E51AAF1;
 Mon, 26 Oct 2020 13:45:48 +0000 (UTC)
Date: Mon, 26 Oct 2020 14:45:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201026134546.GA9542@dell5510>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-4-alexey.kodanev@oracle.com>
 <20201026084939.GE21306@dell5510>
 <34dfc67f-5234-a06b-c824-066bc70ecc8a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34dfc67f-5234-a06b-c824-066bc70ecc8a@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] network/virt: add wireguard01
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
> >> +	tst_net_run -s "ip route add 128.0.0.0/1 dev ltp_v0"
> > Out of curiosity: why is IPv4 enough? (we test also IPv6)

> Hi Petr,

> Looks like no need for additional route table setup, and overriding
> default route... tst_netload() uses addresses of wireguard device.
> Will remove it.
ack.

> >> +}
> >> +
> >> +wireguard_lib_cleanup()
> >> +{
> >> +	virt_cleanup
> >> +}

> > Why not use just virt_cleanup() ?

> Yes, it's just a wrapper, but it is used in wirguard01/02 tests.
> In case we need additional setup/cleanup we would have to change
> both tests too.

Sure, no problem. Looking forward this patchset to be merged :).
Thanks for your work!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
