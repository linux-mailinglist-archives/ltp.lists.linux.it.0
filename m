Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E537961D
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 19:38:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFABD3C8C55
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 19:38:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A75E83C5787
 for <ltp@lists.linux.it>; Mon, 10 May 2021 19:38:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 46D8D1400C58
 for <ltp@lists.linux.it>; Mon, 10 May 2021 19:38:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D2FBAE86
 for <ltp@lists.linux.it>; Mon, 10 May 2021 17:38:10 +0000 (UTC)
Date: Mon, 10 May 2021 19:38:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YJlvgWqtQWo98j4J@pevik>
References: <20210504190240.24250-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504190240.24250-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/5] docparser formatting improvements
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

Hi,

> originally there was only commit "docparse: Make tags in table
> clickable".
> I added few more formatting changes. Most important is to filter by
> .tags keys.

> Kind regards,
> Petr

> Petr Vorel (5):
>   docparse: Move CVE and git link into Info column
>   docparse: Filter .tags by key
>   docparse: Make tags in table clickable
>   docparse: Sort alphabetically tags in table
>   docparse: Fix headers

>  docparse/testinfo.pl | 92 +++++++++++++++++++++++++++++---------------
>  1 file changed, 62 insertions(+), 30 deletions(-)

given it should not affected tests I didn't wait for review of the last two and
I merged whole patchset. Thanks for your time to review the first three.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
