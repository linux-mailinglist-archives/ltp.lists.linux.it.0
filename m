Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F03F0079
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:31:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0FBC3C561B
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:30:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA3633C5567
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:30:56 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B972E600716
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:30:55 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0EF9E9F75E;
 Wed, 18 Aug 2021 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629279054; bh=18Y1NGciVmQ2Mp0lL475WvAdSqLvAlYwJoZuKBV2Rik=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=aCa6fD3yEEpBnlMVgHCB3PixST+l80S9WGnwYhtJk14qrt3u6UVFHxGO6IHTswgr2
 f0U1oy01uPEzJDTgOiXV92pzvDBExojCA4/+AOBgyanAcYhiTdRd7CvxB0iVCik3lB
 ZEJQCFDRYjF6tXHIsyYuKKH6VesVN89S0oSn8R88=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-2-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <7ac7a1d6-2d97-f8f5-8d60-040eb0753681@jv-coder.de>
Date: Wed, 18 Aug 2021 11:30:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818091224.27578-2-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/3] tst_test.sh: Simplify tst_cmd_available()
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
Cc: Elliott Hughes <enh@google.com>, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 8/18/2021 11:12 AM, Petr Vorel wrote:
> "command -v" [1] and "type" [2] are POSIX. They're supported in all
> common shells (bash, zsh, dash, busybox sh, mksh). Thus we don't have to
> fallback on "which", which has been discontinued after 2.21 release in
> 2015 due this (git repository is empty [3]).
>
> Use "type" instead of "command -v" which is IMHO more known.
>
> Also drop explicit return as the exit code is reliable an all
> implementations.
>
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html
> [2] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/type.html
> [3] https://git.savannah.gnu.org/cgit/which.git
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   testcases/lib/tst_test.sh | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index c6aa2c487..fa35a64f1 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -346,18 +346,7 @@ tst_virt_hyperv()
>   
>   tst_cmd_available()
>   {
> -	if type command > /dev/null 2>&1; then
> -		command -v $1 > /dev/null 2>&1 || return 1
> -	else
> -		which $1 > /dev/null 2>&1
> -		if [ $? -eq 0 ]; then
> -			return 0
> -		elif [ $? -eq 127 ]; then
> -			tst_brk TCONF "missing which command"
> -		else
> -			return 1
> -		fi
> -	fi
> +	type $1 >/dev/null 2>&1
I guess there was a reason, why command was used here in the first place.
Iirc type is often a shell builtin, that can have different behavior, 
while command -v is posix and should be extremely portable.
So maybe it is better to use "command -v" instead of type here. I hope 
most distributions have a command-command...

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
