Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4D387C66
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 17:25:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 041DB3CA69E
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 17:25:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D348E3CA59C
 for <ltp@lists.linux.it>; Tue, 18 May 2021 17:25:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03B021A0111C
 for <ltp@lists.linux.it>; Tue, 18 May 2021 17:25:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E12D0AFBF;
 Tue, 18 May 2021 15:25:52 +0000 (UTC)
Date: Tue, 18 May 2021 17:25:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YKPcf1zzYPi8hS1k@pevik>
References: <20210517085637.16866-1-aleksei.kodanev@bell-sw.com>
 <YKNYkNOqsmhv9kSJ@pevik>
 <7a5dec7a-ed23-2f62-a02f-75667df75835@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a5dec7a-ed23-2f62-a02f-75667df75835@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/lib6/getaddrinfo01: rewrite with the new
 API + use static hostnames
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

> Thank you for review!
Thank you for finding a time to cleanup this, it'd take long time to me to
rewrite it.

> > Moving everything to /etc/hosts based setup is a great idea
> > as we get rid of network setup related failures.

> > Do we lost any getaddrinfo() test coverage for bypassing DNS?

> We may lose some DNS lookups queries because the files almost always
> will be checked first by nss, and I think this is covered by another
> test, dns-stress{01|02} (focus more on the server than the client).

+1, we don't need to worry.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
