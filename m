Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4A3138CD
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 17:04:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 858B33C69A7
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 17:04:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B52F13C6926
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 17:04:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4B1041000A2F
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 17:04:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71AA9ADE3;
 Mon,  8 Feb 2021 16:04:51 +0000 (UTC)
Date: Mon, 8 Feb 2021 17:04:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YCFhIs/lyRGTh8IR@pevik>
References: <20210205142051.32055-1-pvorel@suse.cz>
 <20210205142051.32055-2-pvorel@suse.cz>
 <c5322d13-c69d-aa4d-193c-7c047a405d9a@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5322d13-c69d-aa4d-193c-7c047a405d9a@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] if-mtu-change.sh: Lower CHANGE_INTERVAL for
 netns
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

> >  # The interval of the mtu change [second]
> >  CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
> > -
> >  TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))

> > +if tst_net_use_netns; then
> > +	CHANGE_INTERVAL="100ms"

> Hi Petr,

> What about adding the option to change this value too for netns,
> for example like this:

> TST_TIMEOUT=1
> if tst_net_use_netns; then
>     CHANGE_INTERVAL=${CHANGE_INTERVAL:-100ms}
> else
>     CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
>     tst_is_int $CHANGE_INTERVAL && TST_TIMEOUT=$CHANGE_INTERVAL
> fi

> TST_TIMEOUT=$(((TST_TIMEOUT + 30) * MTU_CHANGE_TIMES))
That's indeed much better!

How about allow to overwrite CHANGE_INTERVAL even for netns?
i.e move tst_is_int $CHANGE_INTERVAL && TST_TIMEOUT=$CHANGE_INTERVAL
after the test (although it's unlikely anybody would use sec value for netns
and ms value for ssh):

# CHANGE_INTERVAL: The interval of the mtu change
TST_TIMEOUT=1
if tst_net_use_netns; then
    CHANGE_INTERVAL=${CHANGE_INTERVAL:-100ms}
else
    CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
fi
tst_is_int $CHANGE_INTERVAL && TST_TIMEOUT=$CHANGE_INTERVAL
TST_TIMEOUT=$(((TST_TIMEOUT + 30) * MTU_CHANGE_TIMES))

> > +	TST_TIMEOUT=$((30 * MTU_CHANGE_TIMES))
> > +fi
> > +
> >  # The array of the value which MTU is changed into sequentially
> >  # 552 - net.ipv4.route.min_pmtu
> >  CHANGE_VALUES="784 1142 552 1500 552 1500 552 748 552 1142 1500"
> > @@ -65,6 +69,7 @@ find_ipv4_max_packet_size()

> >  do_setup()
> >  {
> > +

> empty new line?
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
