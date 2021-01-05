Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2522EA741
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 10:26:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9F963C31F1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 10:26:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AAD8F3C2A9D
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 10:26:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 514006009D1
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 10:26:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CFF4B720;
 Tue,  5 Jan 2021 09:26:09 +0000 (UTC)
Date: Tue, 5 Jan 2021 10:26:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <X/Qwr3CwJmggYZuC@pevik>
References: <20201221112250.27944-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221112250.27944-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] unzip01.sh: Fix failure with BusyBox unzip
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

> BusyBox unzip uses the word 'inflating' instead of 'extracting'.
> Detect it and check for the correct match in the output.

> Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> ---
>  testcases/commands/unzip/unzip01.sh | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

> diff --git a/testcases/commands/unzip/unzip01.sh b/testcases/commands/unzip/unzip01.sh
> index 750718de4..1b9a1665f 100755
> --- a/testcases/commands/unzip/unzip01.sh
> +++ b/testcases/commands/unzip/unzip01.sh
> @@ -12,6 +12,14 @@ TST_NEEDS_TMPDIR=1
>  TST_NEEDS_CMDS="unzip"
>  . tst_test.sh

> +EXTRACT_MATCH=""
FYI shell syntax allow to drop quotes here:
EXTRACT_MATCH=

> +
> +if unzip 2>&1 | grep -q 'BusyBox'; then
> +	EXTRACT_MATCH="inflating"
> +else
> +	EXTRACT_MATCH="extracting"
> +fi

Thanks for a fix. Obviously correct, I pushed it with a tiny change (readability):

EXTRACT_MATCH="extracting"

if unzip 2>&1 | grep -q 'BusyBox'; then
	EXTRACT_MATCH="inflating"
fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
