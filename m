Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D09F217CEB
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 04:06:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7B193C54DE
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 04:06:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BEEF33C223B
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 04:06:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2C747600725
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 04:05:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,326,1589212800"; d="scan'208";a="95913404"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 10:06:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EA9FD49B1116;
 Wed,  8 Jul 2020 10:06:22 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 10:06:22 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <1594016612-7975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <150668383.1091545.1594129246387.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1690c3ad-a7d4-fa18-db19-343e3e345f8c@cn.fujitsu.com>
Date: Wed, 8 Jul 2020 10:06:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <150668383.1091545.1594129246387.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EA9FD49B1116.AE421
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl09: Add test for BLKRRPART ioctl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan

Thanks for your review.
> 
> 
> ----- Original Message -----
> 
> Hi,
> 
>> +static void verify_ioctl(void)
>> +{
>> +	const char *const cmd_parted_old[] = {"parted", "-s", "test.img",
>> "mklabel", "msdos", "mkpart",
>> +						"primary", "ext4", "1M", "10M", NULL};
>> +	const char *const cmd_parted_new[] = {"parted", "-s", "test.img",
>> "mklabel", "msdos", "mkpart",
>> +						"primary", "ext4", "1M", "10M", "mkpart", "primary", "ext4", "10M",
>> "20M", NULL};
> 
> ^^ These (and other lines) goe way over 80 characters.
> 
OK.
>> +	struct loop_info loopinfo = {0};
>> +
>> +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>> +	if (dev_num < 0)
>> +		tst_brk(TBROK, "Failed to find free loop device");
>> +
>> +	tst_fill_file("test.img", 0, 1024 * 1024, 20);
> 
> 20MB feels a bit small, even though tests I ran passed on old and new kernels.
> LTP default is 256, to cover various filesystems, but here we don't even
> write anything..
In actually, ioctl_loop01 test case also uses 10M size and we only cover 
ext4 fileystem in here. I don't have objection about changing this size 
to 256M. Just reconfirm. If so, we should also modify ioctl_loop01 code.
> 
> Other than that, it looks good to me:
> Acked-by: Jan Stancek <jstancek@redhat.com>
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
