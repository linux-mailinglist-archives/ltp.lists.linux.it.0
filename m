Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5C1CD356
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:55:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 991D83C560B
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:55:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 866D53C25CF
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:55:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 92405600B9E
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:55:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,378,1583164800"; d="scan'208";a="91906897"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 May 2020 15:55:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 6D8D64CE2E6A
 for <ltp@lists.linux.it>; Mon, 11 May 2020 15:55:18 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 11 May 2020 15:55:19 +0800
Message-ID: <5EB904E5.8020109@cn.fujitsu.com>
Date: Mon, 11 May 2020 15:55:17 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1588918535-4682-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5EB51F9D.6080404@cn.fujitsu.com>
 <207ce727-a0a4-2c2a-19f7-87aef956ffb5@cn.fujitsu.com>
In-Reply-To: <207ce727-a0a4-2c2a-19f7-87aef956ffb5@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6D8D64CE2E6A.AD198
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Ensure do zero offset in
 kernel always
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

On 2020/5/8 17:23, Yang Xu wrote:
> Hi Xiao
>
>
>> On 2020/5/8 14:15, Yang Xu wrote:
>>> Currently, we use return instead of zero_offset. I debug this code
>>> (early return, ext4 filesystem)as below:
>>> ---------------------------------------
>>> TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
>>> if (TST_RET == 0) {
>>>     tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
>>>          SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
>>> }
>>> return;
>>> ---------------------------------------
>>> this case will broke when using i parameter,
>>> ioctl_loop05.c:62: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed:
>>> EINVAL (22)
Hi Xu,

Sorry for the late reply.

Without modifying code, we can also fall into this branch by running 
ioctl_loop05 under btrfs, so could we simple the description of issue?

>>>
>>> It seems the last test affected this test, so I think we should use
>>> goto instead of return. Also including a typo, updata->update.
>>>
>>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>>> ---
>>>   testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>>> b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>>> index 6cf701f47..a103aaa94 100644
>>> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>>> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>>> @@ -5,7 +5,7 @@
>>>    *
>>>    * This is a basic ioctl test about loopdevice.
>>>    *
>>> - * It is designed to test LOOP_SET_DIRECT_IO can updata a live
>>> + * It is designed to test LOOP_SET_DIRECT_IO can update a live
>> Hi Xu,
>>
>> What does the line changes?
> just a typo, updata->update

Sorry for missing the typo.

>>
>>>    * loop device dio mode. It needs the backing file also supports
>>>    * dio mode and the lo_offset is aligned with the logical block size.
>>>    *
>>> @@ -85,13 +85,14 @@ static void verify_ioctl_loop(void)
>>>       if (TST_RET == 0) {
>>>           tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
>>>           SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
>>> -        return;
>>> +        goto zero_offset;
>>>       }
>>>       if (TST_ERR == EINVAL)
>>>           tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as
>>> expected");
>>>       else
>>>           tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed
>>> expected EINVAL got");
>>>
>>> +zero_offset:
>>>       loopinfo.lo_offset = 0;
>>>       TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS,&loopinfo),
>>> TST_RETVAL_EQ0);
>>
>> You have cleared the struct loopinfo at the beginning of
>> verify_ioctl_loop(), so could we just drop loopinfo.lo_offset = 0 and
>> move 'TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS,&loopinfo),
>> TST_RETVAL_EQ0);' to the beginning?
> Yes. IMO, at the beginning or end, they all work well.

Agreed, but it seems simpler to clear resouce at the beginning of 
verify_ioctl_loop(), like this:
-----------------------------------
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c 
b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index 6cf701f47..6c9ea2802 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
...
@@ -57,6 +57,7 @@ static void verify_ioctl_loop(void)
         struct loop_info loopinfo;

         memset(&loopinfo, 0, sizeof(loopinfo));
+       TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), 
TST_RETVAL_EQ0);

         tst_res(TINFO, "Without setting lo_offset or sizelimit");
         SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 1);
@@ -91,9 +92,6 @@ static void verify_ioctl_loop(void)
                 tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as 
expected");
         else
                 tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed 
expected EINVAL got");
-
-       loopinfo.lo_offset = 0;
-       TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), 
TST_RETVAL_EQ0);
-----------------------------------

Best Regards,
Xiao Yang
>>
>> Thanks,
>> Xiao Yang
>>>   }
>>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
