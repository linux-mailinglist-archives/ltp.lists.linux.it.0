Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E2310CDE
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:05:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF4203C70F9
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 16:05:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3D3A53C7305
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:04:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AFD17600B13
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 16:04:47 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="104236231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 16:15:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2B1C54CE6033;
 Fri,  5 Feb 2021 16:15:10 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 16:15:10 +0800
Message-ID: <601CFE91.2030909@cn.fujitsu.com>
Date: Fri, 5 Feb 2021 16:15:13 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1612440762-22389-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ehgnR0Ad5VzR63KgtjFBoqH5N_1b13T7f5Gw6n3EkzdA@mail.gmail.com>
In-Reply-To: <CAEemH2ehgnR0Ad5VzR63KgtjFBoqH5N_1b13T7f5Gw6n3EkzdA@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2B1C54CE6033.AAAA7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/5] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li

I have reply this email, but I don't see it on inbox or patchwork, so again
>     +
>     +#ifdef HAVE_MALLINFO
>     +void test_mallopt(void)
>
>
> what about renaming to test_mallinfo(void) ?
Yes, sorry for this typo.
>
>     +{
>     + struct mallinfo info;
>     + int size;
>     + char *buf;
>     +
>     + buf = SAFE_MALLOC(20480);
>     +
>     + info = mallinfo();
>     + if (info.uordblks > 20480 && info.hblkhd == 0) {
>     + tst_res(TPASS, "malloc() uses sbrk when size < 128k");
>     + } else {
>     + tst_res(TFAIL, "malloc() use mmap when size < 128k");
>     + tst_print_mallinfo("Test malloc(20480)", &info);
>     + }
>     + free(buf);
>     +
>     + info = mallinfo();
>     + size = MAX(info.fordblks, 131072);
>     +
>     + buf = SAFE_MALLOC(size);
>     + info = mallinfo();
>     + if (info.hblkhd > size && info.hblks > 0) {
>     + tst_res(TPASS, "malloc() uses mmap when size >= 128k");
>     + } else {
>     + tst_res(TFAIL, "malloc uses sbrk when size >= 128k");
>
>
> Why not 'TFAIL | TERRNO' ?
mallinfo should always succeed.
>
>     + tst_print_mallinfo("Test malloc(1024*128)", &info);
>     + }
>     +
>     + free(buf);
>     +}
>     +
>     +static void setup(void)
>     +{
>     + if (mallopt(M_MMAP_THRESHOLD, 131072) == 0)
>     + tst_res(TFAIL, "mallopt(M_MMAP_THRESHOLD, 128K) failed");
>
>
> Here as well.
mallopt man-pages said even mallopt fails, return 0 and it doesn't set 
errno.
>
>     +}
>     +
>     +static struct tst_test test = {
>     + .setup = setup,
>     + .test_all = test_mallopt,
>     +};
>     +
>     +#else
>     +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
>     +#endif
>     --
>     2.23.0
>
>
>
>
>
> --
> Regards,
> Li Wang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
