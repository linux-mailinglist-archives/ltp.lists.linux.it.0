Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97F3078B5
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 15:54:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F07E73C792F
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 15:54:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2E80F3C5E76
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 15:53:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E242D200DAE
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 15:53:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02D04ACBA
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 14:53:58 +0000 (UTC)
Date: Thu, 28 Jan 2021 15:53:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YBLQBCUzE2PzK8Dj@pevik>
References: <20210121130033.20764-1-pvorel@suse.cz>
 <20210121130033.20764-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121130033.20764-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] testinfo.pl: Optimize imports
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

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
Merged this simple one.

Kind regards,
Petr

> ---
>  docparse/testinfo.pl | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

> diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
> index b636b3c0e..b5ab02bc1 100755
> --- a/docparse/testinfo.pl
> +++ b/docparse/testinfo.pl
> @@ -6,8 +6,7 @@
>  use strict;
>  use warnings;

> -use JSON;
> -use LWP::Simple;
> +use JSON qw(decode_json);
>  use Cwd qw(abs_path);
>  use File::Basename qw(dirname);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
