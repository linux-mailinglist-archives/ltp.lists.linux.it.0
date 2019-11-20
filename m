Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573F103A0A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 13:29:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C4973C2386
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 13:29:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 79FCF3C14F0
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 13:29:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 563431003AF5
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 13:29:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7267BB3C7;
 Wed, 20 Nov 2019 12:29:11 +0000 (UTC)
Date: Wed, 20 Nov 2019 13:29:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191120122910.GD14963@rei.lan>
References: <cover.1574087532.git.jstancek@redhat.com>
 <53c6b3308d3e77fd95cae17b2a7ed1d4e8b2f60e.1574087532.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53c6b3308d3e77fd95cae17b2a7ed1d4e8b2f60e.1574087532.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] perf_event_open02: migrate to newlib
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> @@ -312,15 +238,13 @@ static void cleanup(void)
>  {
>  	int i;
>  
> -	for (i = 0; i < n; i++) {
> -		if (hwfd[i] > 0 && close(hwfd[i]) == -1)
> -			tst_resm(TWARN | TERRNO, "close(%d) failed", hwfd[i]);
> -		if (tskfd[i] > 0 && close(tskfd[i]) == -1)
> -			tst_resm(TWARN | TERRNO, "close(%d) failed", tskfd[i]);
> +	for (i = 0; i < ntotal; i++) {
> +		SAFE_CLOSE(hwfd[i]);
> +		SAFE_CLOSE(tskfd[i]);

Shouldn't we check that the hwfd[i] and tskfd[i] are > 0?

I guess that we may do SAFE_CLOSE(0) repeatedly here in a case that
perf_event_open() failed somewhere in the middle of the setup().

Otherwise this is a nice cleanup, acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
