Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF83DDEE7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 20:06:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D58353C8B03
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 20:06:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF68D3C6074
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 20:06:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6585B1A0099E
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 20:06:38 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AB9E2203F;
 Mon,  2 Aug 2021 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627927598;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OeYK3H93guGtDi6Y8VsZlC8PgAJioAlk2NE95ozdlBs=;
 b=QD7Xuz4FC9JiILVvrGCVDqmwXWjUVBP4/S67dP8DYnaHjwuAi8zQvrIFd10b013Kz5Sz4U
 r+/dCSZ4lHaXOfBinjtq4Gk49uTzyRuqNVdMBuaAYrt4hP7y9zOc+JZviRbUtJIIRMjNlQ
 L95j3gXy6uGKlU9aBdlniDQDzM1GmHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627927598;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OeYK3H93guGtDi6Y8VsZlC8PgAJioAlk2NE95ozdlBs=;
 b=l9Hn42t2pvfow7Ce/tECCNdyKwob99l12JRvwpKvPzxlvzUxNs0gVqZhoJ8Ap4Ta6Y2HzA
 +orxGXoAj0/+IyAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6E66F13B47;
 Mon,  2 Aug 2021 18:06:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id KUHcGC40CGFnNAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 18:06:38 +0000
Date: Mon, 2 Aug 2021 20:06:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YQg0LIXG8LK0OV74@pevik>
References: <20210714140716.1568-1-pvorel@suse.cz>
 <20210714140716.1568-3-pvorel@suse.cz>
 <57d4c109-d01a-2c7f-39c7-41013e70abf9@bell-sw.com>
 <YQBD4w2nKwY2G1l+@pevik>
 <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0638d98-88d5-76d7-78a1-631c801d88ad@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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

> Hi Petr,
> On 27.07.2021 20:35, Petr Vorel wrote:
> > Hi Alexey,

> >> On 14.07.2021 17:07, Petr Vorel wrote:
> >>> net_stress.broken_ip runtest file is correct, but some users try to run
> >>> tests manually.

> >>> Fixes: #843

> ...
> >>>  do_test()

> >> The generic version looks fine:

> >> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>

> > I didn't understand whether you'd prefer to add TST_IPV6=6 (or TST_IPV6=) where
> > needed or accept this patchset. Both would work.

> I think for manual runs it is better to set TST_IPV6=6 in the test
> so it will run the test rather the require passing some options.
It looks like specifying TST_IPV6=6 is not enough, because tests are using
$NS_ICMP_SENDER_DATA_MAXSIZE which is defined in tst_net.sh according to
TST_IPV6. We can

1) overwrite NS_ICMP_SENDER_DATA_MAXSIZE="$NS_ICMPV6_SENDER_DATA_MAXSIZE"
2) check TST_IPV6 before running tst_net_parse_args and if set overwrite -6 flag

But both are quite ugly, thus unless you have better idea I merge this patchset.

Kind regards,
Petr

> > Kind regards,
> > Petr



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
