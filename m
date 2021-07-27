Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D73EB3D727F
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 12:02:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF1383C9106
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 12:02:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2088C3C200C
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 12:02:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 09FF71000D52
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 12:02:48 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1419E1FEF8;
 Tue, 27 Jul 2021 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627380168;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u2f9OGfnmwajFJNgY1+R9GfvFGr1TPOTh/5N+yU+9Bk=;
 b=gg1Wts1fO8zwn8SLK9R02jPAHg0mP4tP0eKvhNQiVrevPesdNMDCOQJ+RzDmmXKV/qc61H
 TjQBtKa8NWEAQMrZ9zO01ee69C+zD6Tro83YCgaOJMNXMHLuNtU32/W20mDoXBoZuaF7li
 7wtIIK21EE9ktr9gw10WyipXC5ZkU/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627380168;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u2f9OGfnmwajFJNgY1+R9GfvFGr1TPOTh/5N+yU+9Bk=;
 b=1I4RZh58SzfvU4Irr5z5zAN8WCBAGtoAj3d2UOlnpEhQ32M0Q8ZzmSv1y1HWPhsqCTklhJ
 +q92qalCr1i88eDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D24F0133DE;
 Tue, 27 Jul 2021 10:02:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id NPlCMcfZ/2AQPAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jul 2021 10:02:47 +0000
Date: Tue, 27 Jul 2021 12:02:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YP/ZxhYSZb/NusUs@pevik>
References: <20210722063422.18059-1-radoslav.kolev@suse.com>
 <YPkjE3KHHnhYklp/@pevik>
 <8b564e10-d87e-aaf0-03a4-1af347f02d4b@suse.com>
 <8cc8d5bc-b651-8e15-6389-69f36cf6bb49@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cc8d5bc-b651-8e15-6389-69f36cf6bb49@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Cc: radosla.kolev@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey, Radoslav,

> Hi Radoslav,

> On 27.07.2021 11:20, Radoslav Kolev wrote:
> > On 7/22/21 10:49 AM, Petr Vorel wrote:
> >> Hi Radoslav,

> >>> In network stress test groups there are tests expecting
> >>> CONFIG_NET_IPVTI to be enabled in the kernel, and if it's not they
> >>> fail. There is a check for VTI support in the ip utility, but not
> >>> for the kernel. Skip these tests if vti device type is not known by
> >>> the kernel.
> >> LGTM.
> >> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > Thanks for the review, Petr!

> > Alexey, please let me know if you have any comments.



> What about checking vti drivers in stress/ipsec/ipsec_lib.sh:tst_ipsec_setup_vti()
> Similar to the checks for xfrm_user driver there...

> For example:

> tst_net_run -q "tst_check_drivers ip_vti ip6_vti" || \
>     tst_brk TCONF "vti driver not available on lhost or rhost"


> I think this should work for wireguard02 test as well.

The above LGTM, Radoslav, do you have time to look into it?
Alexey, do we also accept this patch? IMHO this error should be mostly TCONF and
it'd work for other possible drivers.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
