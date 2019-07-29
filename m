Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4E78E70
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 16:53:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BF0A3C1D4F
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 16:53:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 38D223C1D28
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 16:13:57 +0200 (CEST)
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8C1FF1A00F2C
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 16:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564409635;
 s=strato-dkim-0002; d=hartkopp.net;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bJHqTONXYp006eOkJA1v0tEzHaPsPs7ladTfwDG0Q4E=;
 b=ol2SZzPt8eYVwyRwmKWohtk23Fz+SyAsCD/NqVmdtysZpwKTU1B7j2fA4tHRJ3H3Lv
 v1T9qKWTHJ7C5GIHSwziMviIahyxVv6sx3MuQRbHmjIgytHIDMk7BZyTjsrBZ3ERKK+o
 Ugdn/oYx7djRMfY6m8oA2nI4rgnEXaOKZqnBnNHtLSpHo17dr4DbwzwM2uG8nEb7xAev
 16+qVsDHjFIZ8VkTfv8TrQspRbAAjLS1Tp4z2g4AjnFmTLWjo/eo0YFrmhGhkdreiVcY
 6k7H6dDPs1Z60jA+W2bt7uuAqt98qqxJSLNBHLJk4SIzmllFqNSB1Bacsr78OqcYPkHc
 kvjg==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3PMaViOoLMJUsh5k0mJ"
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.177] by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
 with ESMTPSA id k05d3bv6TEDNuAl
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 29 Jul 2019 16:13:23 +0200 (CEST)
To: kernel test robot <rong.a.chen@intel.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>
References: <20190729094112.GM22106@shao2-debian>
From: Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <786568d6-bd24-327a-8367-319efbe2cccb@hartkopp.net>
Date: Mon, 29 Jul 2019 16:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729094112.GM22106@shao2-debian>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 29 Jul 2019 16:53:07 +0200
Subject: Re: [LTP] [can] 60649d4e0a: ltp.can_rcv_own_msgs.fail
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, lkp@01.org,
 LKML <linux-kernel@vger.kernel.org>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Marc,

On 29/07/2019 11.41, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> 
> commit: 60649d4e0af6c26b6c423dea9c57f39e823fc0c5 ("can: remove obsolete empty ioctl() handler")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git master

the kernel test robot is right.

The patch ("can: remove obsolete empty ioctl() handler") leads to a 
return value of -EOPNOTSUPP instead of the former -ENOIOCTLCMD.

As we can see in socket.c ...

https://elixir.bootlin.com/linux/v5.3-rc2/source/net/socket.c#L1041

         /*
          * If this ioctl is unknown try to hand it down
          * to the NIC driver.
          */
         if (err != -ENOIOCTLCMD)
                 return err;

... we need to return -ENOIOCTLCMD to pass the SIOCGIFINDEX ioctl to the 
NIC layer.

Therefore the entire commit needs to be *reverted* to restore the 
required functionality.

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>

Many thanks,
Oliver

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
