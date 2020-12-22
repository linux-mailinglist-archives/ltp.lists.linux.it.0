Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14F2E0DAD
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 18:10:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFF163C56FA
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 18:10:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 00FBA3C332D
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 18:10:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B5F191A00E5D
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 18:10:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07E38ACF1;
 Tue, 22 Dec 2020 17:10:35 +0000 (UTC)
Date: Tue, 22 Dec 2020 18:10:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201222171033.GB126602@pevik>
References: <20201221110120.26165-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221110120.26165-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpio_tests.sh: Fix failure with BusyBox cpio
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

Hi Radoslav,

> A very limited BusyBox cpio requires the archive format to be
> explicitly set to newc when creating an archive.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...

> +ARCHIVE_FORMAT=""
ARCHIVE_FORMAT=
(quotes not needed)

> +
> +if cpio 2>&1 | grep -q '\-o\sCreate (requires -H newc)'; then
> +	ARCHIVE_FORMAT="-H newc"
> +fi
> +
>  cpio_test()
>  {
>  	ROD mkdir "dir"
> @@ -16,7 +22,7 @@ cpio_test()
>  	done

>  	ROD find dir -type f > filelist
> -	EXPECT_PASS cpio -o \> cpio.out \< filelist
> +	EXPECT_PASS cpio -o $ARCHIVE_FORMAT \> cpio.out \< filelist
>  	ROD mv "dir" "dir_orig"
>  	ROD mkdir "dir"
>  	EXPECT_PASS cpio -i \< cpio.out

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
