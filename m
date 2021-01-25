Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6B3022CA
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 09:28:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F5033C5F2F
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 09:28:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9AF3B3C1C6D
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 09:28:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 32B4B1A000BE
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 09:28:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 037B8AAC6;
 Mon, 25 Jan 2021 08:28:48 +0000 (UTC)
Date: Mon, 25 Jan 2021 09:28:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YA6BPtiWooSjiiUt@pevik>
References: <20210125064747.26759-1-liwang@redhat.com>
 <20210125064747.26759-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125064747.26759-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 2/2] swapping01: check memory swap usage per
 process
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Since previously swapping01 read the system FreeSwap for counting
> usage of swap-size, that's not precise on system especially with
> eating-memory daemon=A0in the background. Now, we try to check the
> 'VmmSwap' in proc/PID/status=A0per process, to get rid of=A0the potential
> influence from=A0other processes=A0which easily leads to false positive.

LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Petr Vorel <pvorel@suse.cz>
> Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  testcases/kernel/mem/swapping/swapping01.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

> diff --git a/testcases/kernel/mem/swapping/swapping01.c b/testcases/kerne=
l/mem/swapping/swapping01.c
> index 8106f6466..0f693f313 100644
> --- a/testcases/kernel/mem/swapping/swapping01.c
> +++ b/testcases/kernel/mem/swapping/swapping01.c
> @@ -137,8 +137,7 @@ static void check_swapping(void)
>  		i++;
>  	}

> -	swap_free_now =3D SAFE_READ_MEMINFO("SwapFree:");
> -	swapped =3D swap_free_init - swap_free_now;
> +	swapped =3D SAFE_READ_PROC_STATUS(pid, "VmSwap:");
>  	if (swapped > mem_over_max) {
>  		kill(pid, SIGCONT);
>  		tst_brk(TFAIL, "heavy swapping detected: "

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
