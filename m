Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFF1E170D
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 23:24:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B594A3C3349
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 23:24:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E04FA3C2306
 for <ltp@lists.linux.it>; Mon, 25 May 2020 23:24:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1BB401000945
 for <ltp@lists.linux.it>; Mon, 25 May 2020 23:24:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DAAF0AC2C;
 Mon, 25 May 2020 21:24:05 +0000 (UTC)
Date: Mon, 25 May 2020 23:24:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <20200525212401.GA30581@dell5510>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220092529.3239-4-pengfei.xu@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig
 verification to avoid umip wrong abort case
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> From v5.5 main line, umip kconfig changed from "CONFIG_X86_INTEL_UMIP=y"
> to "CONFIG_X86_UMIP=y".
> We could use "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y" to check kconfig
> CONFIG_X86_INTEL_UMIP=y(old kernel) or CONFIG_X86_UMIP=y(new kernel) for umip.

> Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> ---
>  testcases/kernel/security/umip/umip_basic_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
> index 1baa26c52..24eca8890 100644
> --- a/testcases/kernel/security/umip/umip_basic_test.c
> +++ b/testcases/kernel/security/umip/umip_basic_test.c
> @@ -171,7 +171,7 @@ static struct tst_test test = {
>  	.forks_child = 1,
>  	.test = verify_umip_instruction,
>  	.needs_kconfigs = (const char *[]){
> -		"CONFIG_X86_INTEL_UMIP=y",
> +		"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",

We're sorry to get to your patch now, after 5 months.

Thanks for a report and your effort to fix the problem. But this does not work,
because current implementation does not support '|' as bitwise or, with this
patch will result on tests being skipped for both cases.

While it'd be easy to implement support for bitwise or in tst_kconfig_read(),
it might be enough just to check for kernel version:

.needs_kconfigs = (const char *[]){
#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
	"CONFIG_X86_INTEL_UMIP=y",
#else
	"CONFIG_X86_UMIP=y",
#endif

But that will work unless this feature is not backported (IMHO commit
b971880fe79f ("x86/Kconfig: Rename UMIP config parameter") is kind of cleanup,
therefore unlikely to be backported, but it can happen).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
