Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 194F417544B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 08:12:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32BEB3C6816
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 08:12:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 339643C67FE
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 08:12:33 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 825CD140118B
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 08:12:32 +0100 (CET)
Received: from mail-lf1-f72.google.com ([209.85.167.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1j8fFe-0007n4-Vq
 for ltp@lists.linux.it; Mon, 02 Mar 2020 07:12:31 +0000
Received: by mail-lf1-f72.google.com with SMTP id w22so913061lfe.1
 for <ltp@lists.linux.it>; Sun, 01 Mar 2020 23:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=omz09CB3OqdI+5l7F6Uz8eaXELPXI3NE3/hOHZzUEQo=;
 b=rS9B0HjYqasgLha/GNhUBTSNHOGIShFmacMtMBPoKn3UBae8AfkqS4mFDL9u7bMO+r
 tD5srTfw3tEgWhbOhTO0nQu6XSXiIp7VjAQvIowAUpAx62nsne5xafTZdD8A3cbjFy6G
 PrSXt0aaZ7dU2kXJKj/IMAiTrPv0nEeK4/decq1OdApTbmj+v79IT/eZXF5BunxwElwu
 nezoL3XeMYr3YMB2CoaCc+7J4iHnp0rc4ii8V1RvX7cGSi8DWayfxO4qynTCt8wOBJKe
 DycAOkGFRQnFfg0iWW/biw9Hq1Zxzrg++7P+VU1bR0aow3iw7jy/wyoZgAxqyfTebOGS
 jgBg==
X-Gm-Message-State: ANhLgQ0CB/i5wjFc7+6evemy1TyEQiqg/aEH5LmKl1IsFP3Cs21xXfgu
 Q4NGwgEXRJ85RvFQTN7BL/sfH2t6OEJV/EP6Zf1FqupvDQ1Vu3sWXzxQxuOKduWaTzVboboiRLF
 SBbYqJWXleqSkCZ1V1bMnaejO/pFp7OSoEbO8Wljk/oQ=
X-Received: by 2002:a2e:570f:: with SMTP id l15mr10876997ljb.236.1583133150189; 
 Sun, 01 Mar 2020 23:12:30 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvc2fQPSav870RTiQkFC3DhLx03AszyqnGPs+AT5VRlUKhektFgitMhN7nxsZMgKDCQkr6QpYZb8r/HGzMcuTk=
X-Received: by 2002:a2e:570f:: with SMTP id l15mr10876986ljb.236.1583133149906; 
 Sun, 01 Mar 2020 23:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
 <20190710072305.25806-2-po-hsu.lin@canonical.com>
 <20200221055936.GA13261@dell5510>
In-Reply-To: <20200221055936.GA13261@dell5510>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Mon, 2 Mar 2020 15:12:18 +0800
Message-ID: <CAMy_GT9VC5KvgCL68fVXVfKwErwKqiNab0s8SwPw9BZxMuLReg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2 1/3] zram/zram_lib.sh: fix variable name and
 algorithm retrieval
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

thanks for the reply, and sorry for the late response too, need some
time to throw myself back in time.

To my understanding, the zram_algs="lzo lzo lzo lzo" in zram01.sh is a
dummy mapping (placeholder?) for 4 compression algorithms with 4
different setup, one for (zram_sizes=26214400, zram_mem_limits=25M,
zram_filesystems=ext3), and one for (zram_sizes=26214400,
zram_mem_limits=25M, zram_filesystems=ext4) and so on.

With this patch the test will be more comprehensive, as it's not
trying to set the algorithm to "lzo" 4 times (as defined in zram_algs
from zram01.sh), but try to switch to all supported algorithm reported
back from  /sys/block/zram0/comp_algorithm

So yes, this zram_algs in zram01.sh will not be used at all after
applying my patch here, maybe it can be removed but I am not sure if
we should keep it there as a placeholder.

Cheers


On Fri, Feb 21, 2020 at 1:59 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi,
>
> > The compression algorithm was stored into a local variable "algs",
> > however the variable name zram_algs was used in the for loop later.
>
> > Unify them with algs so the default zram_algs defined in zram01 won't
> > be altered.
>
> > Also, use sed to get rid of the square brackets that indicates the
> > compression algorithm currently in use.
> >     $ cat /sys/block/zram0/comp_algorithm
> >     [lzo] lz4 lz4hc 842 zstd
>
> > Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> > ---
> >  testcases/kernel/device-drivers/zram/zram_lib.sh | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> > diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
> > index d0e7704a8..599e5f0f3 100755
> > --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> > +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> > @@ -98,10 +98,10 @@ zram_compress_alg()
>
> >       tst_resm TINFO "test that we can set compression algorithm"
>
> > -     local algs="$(cat /sys/block/zram0/comp_algorithm)"
> > +     local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
> >       tst_resm TINFO "supported algs: $algs"
> >       local i=0
> > -     for alg in $zram_algs; do
> > +     for alg in $algs; do
> >               local sys_path="/sys/block/zram${i}/comp_algorithm"
> >               echo "$alg" >  $sys_path || \
> >                       tst_brkm TFAIL "can't set '$alg' to $sys_path"
>
> Sorry for a late reply.
>
> What is the purpose of zram_algs="lzo lzo lzo lzo in zram01.sh?
> It should be removed now, right? (as you decided not to set the algorithms to the ones defined in the zram01.sh
> test at the end of this function as Cyril suggested at [1]
>
> Kind regards,
> Petr
>
> [1] http://lists.linux.it/pipermail/ltp/2019-July/012674.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
