Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B33108D0
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 11:17:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A063C70D5
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 11:17:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7EB243C2EB7
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 11:17:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 39B8B1A01147
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 11:17:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9D1D2ACF4;
 Fri,  5 Feb 2021 10:17:28 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:17:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YB0bN4BMGZyVvNeA@pevik>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
 <20210202133454.59224-4-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202133454.59224-4-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] lib/tst_net.sh: calc median instead of mean
 in tst_netload()
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

> Sometimes the tests can get the following results on a test network:

> gre01   1 TINFO: run server 'netstress -D ltp_v0...
> gre01   1 TINFO: run client 'netstress -l -D ltp_v0... 5 times
> gre01   1 TPASS: netstress passed, mean time 4633 ms, data: 128 22627 134 142 137
> ...
> vxlan03 1 TINFO: run server 'netstress -D ltp_v0...
> vxlan03 1 TINFO: run client 'netstress -l -D ltp_v0... 5 times
> vxlan03 1 TPASS: netstress passed, mean time 4584 ms, data: 142 140 146 145 22350

> One unsuccessful run can have a huge impact on the final result,
> when using the mean time with such data.

> A more suitable solution for short runs would be to obtain a median
> time that can remove all outliers. This will lead to more consistent
> performance test results. For example, instead of the above runs, we
> would get this:

> gre01   1 TPASS: netstress passed, median time 137 ms, data: 128 22627 134 142 137
> vxlan03 1 TPASS: netstress passed, median time 145 ms, data: 142 140 146 145 22350
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
