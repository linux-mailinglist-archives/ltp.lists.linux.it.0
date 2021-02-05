Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3033108E2
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 11:22:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C7AD3C70D8
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 11:22:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9B49B3C53BE
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 11:21:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4D8681001194
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 11:21:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DF40AD2B;
 Fri,  5 Feb 2021 10:21:57 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:21:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <YB0cRKmBcO4qgLf8@pevik>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202133454.59224-1-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] lib/tst_net.sh: calc median instead of mean
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

> This series of patches is intended to improve the reliability
> of results in network tests that using tst_netload().

> After TST_NETLOAD_RUN_COUNT was added, we get several results (5 by
> default). The first patch allows all of them to be displayed along
> with the final result. It helps to debug test performance failures.

> Further patches replace the mean calculation of such data set with
> the median one. It allows to exclude extreme points from the final
> result.

Thanks for improving stability of these tests!
I've also noticed often failures in net.features and some of ipsec tests,
this should help.

FYI as TODO I'd like some of net.features have also as functional tests
(ignoring the performance).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
