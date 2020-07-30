Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC5232DEF
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 10:16:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37C973C2617
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 10:16:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4EE443C0515
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 10:16:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A4E032016DD
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 10:16:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0F68B698;
 Thu, 30 Jul 2020 08:16:48 +0000 (UTC)
Date: Thu, 30 Jul 2020 10:16:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200730081631.GA26795@dell5510>
References: <20200710172044.21592-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710172044.21592-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/7] tst_net.sh: Remove rsh,
 update docs add debug & test
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

Hi Alexey, Xiao,

...
> Petr Vorel (7):
>   tst_net.sh: Remove rsh support
>   tst_net.sh: Use ssh in LTP_RSH
>   net: Remove rsh, rcp, rlogin tests
>   net: Update README.md
>   tst_net.sh: Drop 'sh -c' use from ssh in tst_rhost_run
>   net/test: Add basic testing for tst_rhost_run
>   tst_net.sh/tst_rhost_run: Add debugging

I merged all but these to patches, which I'll resend:

*   net: Remove rsh, rcp, rlogin tests
@Alexey: I'd like to get your ack.

*   net: Update README.md
I'll fixes package and service names (Xiao) + move networking related doc from
INSTALL to testcases/network/README.md.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
