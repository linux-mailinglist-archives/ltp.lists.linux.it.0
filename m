Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4734E2F67DF
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 18:38:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A79FF3C6A67
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 18:38:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C5B7E3C288F
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 18:38:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E0048600967
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 18:38:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFA11ABD6;
 Thu, 14 Jan 2021 17:38:32 +0000 (UTC)
Date: Thu, 14 Jan 2021 18:38:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YACBly6oZQqXE0Tg@pevik>
References: <20210107120247.31465-1-pvorel@suse.cz>
 <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com>
 <X/7+vk6WsJ2LDJlC@pevik>
 <dced71df-28f6-056e-9518-338cccce4c11@oracle.com>
 <YABZkHIQmDUnKFZF@pevik>
 <95ee938f-e045-4564-f6b2-952d54d2505b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95ee938f-e045-4564-f6b2-952d54d2505b@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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


> On 14.01.2021 17:47, Petr Vorel wrote:
> > Hi Alexey,

> >> Hi Petr,

> >> Do you mean "sleep $NS_DURATION" in mcast-pktfld02.sh is not needed
> > Yes: sleep $NS_DURATION in mcast-pktfld02.sh and other mcast*.sh tests in:
> > https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/ltp/patch/20201125053459.3314021-2-lkml@jv-coder.de/__;!!GqivPVa7Brio!P0xbdqXlRQX7GPsKJmcPapdEOX5VV4OnkCKv-P9OqIWNcTvY9a9KXhOSjdJ1dKco5YbG$ 
> > https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/ltp/patch/20201125053459.3314021-1-lkml@jv-coder.de/__;!!GqivPVa7Brio!P0xbdqXlRQX7GPsKJmcPapdEOX5VV4OnkCKv-P9OqIWNcTvY9a9KXhOSjdJ1dKjzIVpO$ 


> It's needed because the commands run in parallel in the background
> during $NS_DURATION. Without it, the test terminates them all shortly
> after starting.

Thanks for info. Yes, that's right. I got confused, because on netns it's (at
least on the default setup), that it passes even without sleep.
Maybe we could remove it for netns.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
