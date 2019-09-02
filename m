Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9313A529A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 11:16:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23F833C212F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 11:16:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2DE723C20C5
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 11:16:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1C2BC200BAF
 for <ltp@lists.linux.it>; Mon,  2 Sep 2019 11:16:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64CDBAFFC;
 Mon,  2 Sep 2019 09:16:39 +0000 (UTC)
Date: Mon, 2 Sep 2019 11:16:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yixin Zhang <yixin.zhang@intel.com>
Message-ID: <20190902091637.GB21733@dell5510>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
 <20190809062000.8671-3-yixin.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809062000.8671-3-yixin.zhang@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp 3/5] runtest/ltp-aiodio.part4: rename
 aiodio_append tests to avoid duplication
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

Hi,
> The name AD00{1..9} is already used in ltp-aiodio.part1, change them to
> ADA00{1..9}.
Not really have a strong opinion about trying to keep runtest names unique
across different runtests, but adding A is not really descriptive :).

I leave the final decision to Cyril.

Kind regards,
Petr

> Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
> ---
>  runtest/ltp-aiodio.part4 | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

> diff --git a/runtest/ltp-aiodio.part4 b/runtest/ltp-aiodio.part4
> index bb8abfdf1..1c845cd7d 100644
> --- a/runtest/ltp-aiodio.part4
> +++ b/runtest/ltp-aiodio.part4
> @@ -34,16 +34,16 @@ DIO07 dio_sparse
>  DIO08 dio_sparse
>  DIO09 dio_sparse
>  #Running aiodio_append
> -AD000 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD001 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD002 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD003 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD004 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD005 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD006 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD007 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD008 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD009 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA000 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA001 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA002 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA003 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA004 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA005 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA006 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA007 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA008 aiodio_append $TMPDIR/aiodio.$$/file2
> +ADA009 aiodio_append $TMPDIR/aiodio.$$/file2
>  #Running dio_append
>  ADI000 dio_append
>  ADI001 dio_append

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
