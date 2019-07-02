Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07D5CE49
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 13:21:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FF1C3C1DAC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 13:21:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 18AD23C1D54
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 13:21:21 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7185914016A5
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 13:21:20 +0200 (CEST)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hiGqd-0001fl-H5
 for ltp@lists.linux.it; Tue, 02 Jul 2019 11:21:19 +0000
Received: by mail-wr1-f72.google.com with SMTP id r4so6832346wrt.13
 for <ltp@lists.linux.it>; Tue, 02 Jul 2019 04:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7lBGWTgo/sSFfC+QMcT86ksAMpTCkXZg6aQt8pqQ0H8=;
 b=rpGRlHG2eo/6datC6DXtjVwyyRqc7CcAKxS+0DXpzVzxXpuohdvpfazqF9HMSXVAzH
 og7NMUIjNXpUXuiPQBgW96ze+aXUgIfFsS8AbIJ3hI8Fjjvn4LKorgD4y9g/7jJh0D40
 dedGpPHn+0ZljlpGEPFfD/RN++tOMF+7sGyqYThT+ykRkD94C0OXPFh6hCmOGG/AOXCa
 8PS62+Y+reygiLdJyx55c7s1ZJiJhHFB00weIZJB72CZCt64a+wjKs3egFOa2D+PF5CC
 9KA4lwlOdlzOLWFhzAhE4on8PPMSOtsGNjwZxH7zTybthsjbNCchaUTuARbDyRNH0J6j
 t3eg==
X-Gm-Message-State: APjAAAWZuIdSnACiW0tebKIxFJp29prTgINaSc31CKKE/vEtgdnOVvoc
 iQAE/Ly08KaTQATk7tuaGNKqAR028/hwmLmWfi8BfqfPEpO0x70HPes9UzSLRgBUie+P44pO6QO
 G3zFMCDK011cFihCIt3rLAAwS90FRCT1BI2HiT79Wt/I=
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr3329864wma.48.1562066479018; 
 Tue, 02 Jul 2019 04:21:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwytoHDnYbBDon+C3q7k5mJ9ipHQPSkn0NcZ5+uqKMEzhMQsWW6XnDDK/ReRDZ5MF5MzTM0bilsa0MLfchnPOc=
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr3329851wma.48.1562066478788; 
 Tue, 02 Jul 2019 04:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190702110419.21221-1-po-hsu.lin@canonical.com>
In-Reply-To: <20190702110419.21221-1-po-hsu.lin@canonical.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Tue, 2 Jul 2019 19:21:07 +0800
Message-ID: <CAMy_GT_-OQ5XBE7A89HgRFx7sNVN-J9POjM6KxYfF9w1X5EtYg@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] zram/zram_lib.sh: fix local variable assignment
 for DASH
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

OK for this one I think there is a better way to keep it one-liner.

It fails because there are more than one value returned:
    [lzo] lz4 lz4hc 842 zstd

But if we use quotes to enclose it, it works
    local algs="$(cat /sys/block/zram0/comp_algorithm)"

Please ignore this patch, I will revise this.
Thanks!

On Tue, Jul 2, 2019 at 7:04 PM Po-Hsu Lin <po-hsu.lin@canonical.com> wrote:
>
> The /bin/sh was symbolically link to dash in Ubuntu.
> This is making the one-liner local variable assignment not working [1]:
>     /opt/ltp/testcases/bin/zram01.sh: 102: local: 842: bad variable name
>
> Break it into two lines to solve this issue.
>
> [1] https://wiki.ubuntu.com/DashAsBinSh#local
>
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  testcases/kernel/device-drivers/zram/zram_lib.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
> index 45116af3e..5cf1ba435 100755
> --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> @@ -98,11 +98,13 @@ zram_compress_alg()
>
>         tst_resm TINFO "test that we can set compression algorithm"
>
> -       local algs=$(cat /sys/block/zram0/comp_algorithm)
> +       local algs
> +       algs=$(cat /sys/block/zram0/comp_algorithm)
>         tst_resm TINFO "supported algs: $algs"
>         local i=0
>         for alg in $zram_algs; do
> -               local sys_path="/sys/block/zram${i}/comp_algorithm"
> +               local sys_path
> +               sys_path="/sys/block/zram${i}/comp_algorithm"
>                 echo "$alg" >  $sys_path || \
>                         tst_brkm TFAIL "can't set '$alg' to $sys_path"
>                 i=$(($i + 1))
> --
> 2.17.1
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
