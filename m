Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4533D952
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:25:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F04AA3C6405
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:25:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 205233C6340
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:25:32 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id CB3D114010E4
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:25:31 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8515020B39C5;
 Tue, 16 Mar 2021 09:25:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8515020B39C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1615911930;
 bh=0WQyAU+sUYUvNFbd8iMWMBlnllo8ARQyBXHmuopB4zg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=roEPolJhTU4EYEyQ5OnQRfg9xkMVALA/iI9cMtFn0EgtSr1IX8ffJNfSnPuUyDxO6
 zXQgutpuczdTFZntVxssZdIrIpLTvzT2fRnuCdLA+PQ1FiLASMfTwi3e7b23yQVzNm
 6hIsaQZgD5W003oe5eozzBkTTMOWGoFOZwoPGFsg=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210316150600.16461-1-pvorel@suse.cz>
 <20210316150600.16461-2-pvorel@suse.cz>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <cedd3e94-8374-9600-96b2-a14412e22e14@linux.microsoft.com>
Date: Tue, 16 Mar 2021 09:25:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316150600.16461-2-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] IMA/ima_keys.sh: Require evmctl 1.3.2
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 3/16/21 8:06 AM, Petr Vorel wrote:
> Test requires fix 19b77c8 ("ima-evm-utils: Fix reading of sigfile").
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   testcases/kernel/security/integrity/ima/tests/ima_keys.sh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index c9eef4b68..aba1711a5 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -92,7 +92,9 @@ test1()
>   # that the certificate is measured correctly by IMA.
>   test2()
>   {
> -	tst_require_cmds evmctl keyctl openssl
> +	tst_require_cmds keyctl openssl
> +
> +	require_evmctl "1.3.2"
>   
>   	local cert_file="$TST_DATAROOT/x509_ima.der"
>   	local keyring_name="key_import_test"
> 

Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

  -lakshmi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
