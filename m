Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D352DC28E
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 15:57:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E074C3C5800
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 15:57:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 50E143C57ED
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 15:57:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 00357200040
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 15:57:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 411B6AC91;
 Wed, 16 Dec 2020 14:57:15 +0000 (UTC)
Date: Wed, 16 Dec 2020 15:57:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <X9ogSVvjhY+iBpBD@pevik>
References: <20201215190545.19939-1-pvorel@suse.cz>
 <53607e8b-176f-5aaf-4b5f-9efabd1d756f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53607e8b-176f-5aaf-4b5f-9efabd1d756f@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Add max packet size
 detection for IPv4
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

> > -		tst_ping -s "1 1000 65507"
> > +		tst_ping -s "1 1000 $MAX_PACKET_SIZE"

> tst_ping -s "1 $((mtu / 2)) $mtu $MAX_PACKET_SIZE"?
Thinking about this twice: adding forth size prolong test a bit (test is already
quite slow. But it makes sense to me to test all 4 variants.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
