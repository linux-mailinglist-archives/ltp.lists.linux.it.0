Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF913D8E85
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 15:06:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECB513C9055
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 15:06:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A2453C1882
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 15:06:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B5EFD140118E
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 15:06:25 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 152AA21A78;
 Wed, 28 Jul 2021 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627477585;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c7OMi7VvYcXr0WCkQGANFjZWVUSO80pUXoCg47pu8oM=;
 b=Q0iyIXgrz/pvC7ePzS/dHLdLiFdsld1UyhXNV0b5hdwOeXOociX94/RYfA9bzb/3YUYKwI
 ny9QDI2tTmLavgx2ik0yrZQJtTb3euaHkt0owkxJQpF7eJ4HDzPOEkM9E8KxBHqtSb8htx
 cULeT/AZdoBfPEMC2/LFezb5ZWYQqJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627477585;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c7OMi7VvYcXr0WCkQGANFjZWVUSO80pUXoCg47pu8oM=;
 b=rN8YGytqmb02vRtPGndygEZ5ec3sjMsifXwXvyP8eMyC8DAXliMlemFcUWhDHtquNwmBdZ
 0y/TMSXPcQKdLuDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E46EF13318;
 Wed, 28 Jul 2021 13:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id XGhbNlBWAWEnYwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jul 2021 13:06:24 +0000
Date: Wed, 28 Jul 2021 15:06:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YQFWT/0MBcZsLNVV@pevik>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
 <YPkjE3KHHnhYklp/@pevik>
 <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
 <8cc8d5bc-b651-8e15-6389-69f36cf6bb49@bell-sw.com>
 <YP/ZxhYSZb/NusUs@pevik>
 <c94e1459-07d5-ceb0-f113-9d3f57343983@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c94e1459-07d5-ceb0-f113-9d3f57343983@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] lib/tst_test.sh: skip test if ip returns
 "Error: Unknown device type"
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

> On 27.07.2021 13:02, Petr Vorel wrote:
> > Hi Alexey, Radoslav,

> >> Hi Radoslav,

> >> On 27.07.2021 11:20, Radoslav Kolev wrote:
> >>> On 7/22/21 10:49 AM, Petr Vorel wrote:
> >>>> Hi Radoslav,

> >>>>> In network stress test groups there are tests expecting
> >>>>> CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
> >>>>> fail. There is a check for VTI support in the ip utility, but not
> >>>>> for the kernel. Skip these tests if vti device type is not known by
> >>>>> the kernel.
> >>>> LGTM.
> >>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> >>> Thanks for the review, Petr!

> >>> Alexey, please let me know if you have any comments.



> >> What about checking vti drivers in stress/ipsec/ipsec_lib.sh:tst_ipsec_setup_vti()
> >> Similar to the checks for xfrm_user driver there...

> >> For example:

> >> tst_net_run -q "tst_check_drivers ip_vti ip6_vti" || \
> >>     tst_brk TCONF "vti driver not available on lhost or rhost"


> >> I think this should work for wireguard02 test as well.

> > The above LGTM, Radoslav, do you have time to look into it?
> > Alexey, do we also accept this patch? IMHO this error should be mostly TCONF and
> > it'd work for other possible drivers.


> Not sure if we really want to add the new patterns every time the
> error message from ip changes. For example depending on the ip/libc
> the error can be "Error: Unknown device type." or "RTNETLINK answers:
> Not supported".
Sure, more effective ways are always welcome.

> We could also save the error message in setup by passing the wrong
> type and then compare it during the test:

> no_dev_msg="$(ip link add ltp0 type ltp0 2>&1)"
Yep, that'd be safer. But your original proposal to check ip_vti ip6_vti
is IMHO the best solution. Radoslav, would you send a new patch with it?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
