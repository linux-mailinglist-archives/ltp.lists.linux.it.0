Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38E1C5D69
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 18:24:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B04503C280E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 18:24:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 43A093C269F
 for <ltp@lists.linux.it>; Tue,  5 May 2020 18:24:12 +0200 (CEST)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4F2E1600B0D
 for <ltp@lists.linux.it>; Tue,  5 May 2020 18:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=L7/JY
 +UyruaLV4AjMa677ZXpjakW2rMFjXvC0jYi8dY=; b=mLfQ9B0gyZkAiZy1QhTu1
 BoEsE9ByRkhwO0yOAosrp0EHQZE9SbzkVFaG9zS413PaZyR1zlOT6HNHGtv/wJT6
 f5V18/NPRsewDZV01o5SQa1QK6sGUpzIxj4n2rTGHehUpVBad8Uff2+KtnbkdEDX
 vFqB7o50nPdf59M29rJQVg=
Received: from [192.168.0.101] (unknown [223.64.160.5])
 by smtp14 (Coremail) with SMTP id EsCowADX59sGk7FeMH2lAg--.1903S2;
 Wed, 06 May 2020 00:23:34 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <20200429141411.9051-1-chrubis@suse.cz>
 <643ba523-3421-fa27-cdc9-9c64e60647c3@cn.fujitsu.com>
 <20200505141341.GB27810@yuki.lan>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <2b147323-9cc8-e2d9-5e3f-c95ed0b78e75@163.com>
Date: Wed, 6 May 2020 00:23:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200505141341.GB27810@yuki.lan>
X-CM-TRANSID: EsCowADX59sGk7FeMH2lAg--.1903S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr47CF1xXF17Cr47AFW5KFg_yoW5Ar1xpF
 98XF4qyrZ3Kr1ktrySq3WkXFWru3yUt3yDWrn8u34UKa15J34fZFsrGanY93sFqF45AFy8
 XF18Xw43Cr1jvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJtxhUUUUU=
X-Originating-IP: [223.64.160.5]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiygYbhFQHIKDRQAAAsR
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Do not fail on success
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

Hi Cyril


> Hi!
>>> The code in __loop_update_dio() uses inode->i_sb->s_bdev to get the
>>> logical block size for the backing file for the loop device. If that
>>> pointer is NULL, which happens to be the case for Btrfs, the checks for
>>> alignment and block size are ignored and direct I/O can be turned on
>>> regardless of the offset and logical block size.Since kernel comment "the above condition may be loosed in the future,
>> and direct I/O may be switched runtime at that time because most
>> of requests in sane applications should be PAGE_SIZE aligned". I think
>> pass is ok, also print filesystem let user know this fs igores this
>> align is better.
> 
> I do not get what you mean here. Should we change the TPASS message to
> something "LOOP_SET_DIRECT_IO succeeded, offset is ignored" or something
> similar?
Yes. Add a comment here is better.
> 
>>     loopinfo.lo_offset = 0;
>>     TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo),
>> TST_RETVAL_EQ0);
>>
>> These should be moved to the beginning of test function.
> 
> I guess that we can do so, just to be extra sure, but we do zero the
> loopinfo structure in lib/tst_device.c so we start with zero offset,
> hence it does not matter if we reset it at the start or at the end of
> the test.
When I debug this case as below(early return, ext4 filesystem):
TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
         if (TST_RET == 0) {
                 tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded 
unexpectedly");
                 SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
         }
	return;
this case will broke when using i parameter,
ioctl_loop05.c:50: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)

It seems the last test affected the next test, so I think we should use 
goto instead of return. Also including two typo, updata->update, need->needs
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -5,8 +5,8 @@
   *
   * This is a basic ioctl test about loopdevice.
   *
- * It is designed to test LOOP_SET_DIRECT_IO can updata a live
- * loop device dio mode. It need the backing file also supports
+ * It is designed to test LOOP_SET_DIRECT_IO can update a live
+ * loop device dio mode. It needs the backing file also supports
71,15 +71,16 @@ static void verify_ioctl_loop(void)

         TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
         if (TST_RET == 0) {
-               tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
+               tst_res(TPASS, "Ignoring offset, LOOP_SET_DIRECT_IO 
succeeded");
                 SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
-               return;
+               goto reset_offset;
         }
         if (TST_ERR == EINVAL)
                 tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as 
expected");
         else
                 tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed 
expected EINVAL got");

+reset_offset:
         loopinfo.lo_offset = 0;
         TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), 
TST_RETVAL_EQ0);


Best Regards
Yang Xu
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
