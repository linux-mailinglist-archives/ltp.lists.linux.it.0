Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942D3F0083
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:31:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC4C53C55BD
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:31:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2384D3C5593
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:31:54 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7EA7F10009E5
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:31:54 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 779119FB63;
 Wed, 18 Aug 2021 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629279113; bh=78HprldC4tZaP6ZAXci1TyjDTxVrKRG8FjI8pWc/dLs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=SfBUvciKE3PwSWvZ6oH61BheYd1yP/HmJg8NBcmHJ1sVOK6huIbk0MGybsv45Dl7E
 7ZVX7LM1mT8B5OCBRddCi1fBWWHsu71HMkE37FbDJWFrIFMx8M4T33wXKTlWGO1MNe
 pbzWpswO9YNhrpdqqvwzqMz1wloPHT1LLjEmx/hw=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-3-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <a695f1b3-ce44-b4b5-6a11-edd75df093fc@jv-coder.de>
Date: Wed, 18 Aug 2021 11:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818091224.27578-3-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] binfmt_misc02.sh: Use "command -v" instead of
 "which"
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 8/18/2021 11:12 AM, Petr Vorel wrote:
> "which" has been discontinued after 2.21 release in 2015 due this (git
> repository is empty [1]) it provides warning on Debian/Ubuntu [2].
>
> Use "command -v" which is POSIX [3] and supported on all common shells
> (bash, zsh, dash, busybox sh, mksh).
>
> [1] https://git.savannah.gnu.org/cgit/which.git
> [2] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
> [3] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
> index 9dbcd68cc..cb4e770e3 100755
> --- a/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
> +++ b/testcases/kernel/fs/binfmt_misc/binfmt_misc02.sh
> @@ -19,7 +19,7 @@
>   
>   TST_CNT=6
>   TST_TESTFUNC=do_test
> -TST_NEEDS_CMDS="which cat head"
> +TST_NEEDS_CMDS="cat head"
>   
>   . binfmt_misc_lib.sh
>   
> @@ -89,17 +89,17 @@ verify_binfmt_misc()
>   do_test()
>   {
>   	case $1 in
> -	1) verify_binfmt_misc ":textension:E::extension::$(which cat):" \
> +	1) verify_binfmt_misc ":textension:E::extension::$(type cat):" \
>   			      "$TST_DATAROOT/file.extension" "1";;
> -	2) verify_binfmt_misc ":tmagic:M:1:This::$(which cat):" \
> +	2) verify_binfmt_misc ":tmagic:M:1:This::$(type cat):" \
>   			      "$TST_DATAROOT/file.magic" "1";;
> -	3) verify_binfmt_misc ".textension.E..extension..$(which cat)." \
> +	3) verify_binfmt_misc ".textension.E..extension..$(type cat)." \
>   			      "$TST_DATAROOT/file.extension" "1";;
> -	4) verify_binfmt_misc ",tmagic,M,1,This,,$(which cat)," \
> +	4) verify_binfmt_misc ",tmagic,M,1,This,,$(type cat)," \
>   			      "$TST_DATAROOT/file.magic" "1";;
> -	5) verify_binfmt_misc ":textension:E::ltp::$(which cat):" \
> +	5) verify_binfmt_misc ":textension:E::ltp::$(type cat):" \
>   			      "$TST_DATAROOT/file.extension" "0";;
> -	6) verify_binfmt_misc ":tmagic:M:0:This::$(which cat):" \
> +	6) verify_binfmt_misc ":tmagic:M:0:This::$(type cat):" \
>   			      "$TST_DATAROOT/file.magic" "0";;
This does not match the description, you say you replace which with 
command, but actually you replaced it with type.

>   	esac
>   }


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
