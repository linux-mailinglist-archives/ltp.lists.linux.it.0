Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1EF426B15
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Oct 2021 14:42:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C516A3C95A2
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Oct 2021 14:42:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1024A3C1C56
 for <ltp@lists.linux.it>; Fri,  8 Oct 2021 14:42:35 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 19F881A00152
 for <ltp@lists.linux.it>; Fri,  8 Oct 2021 14:42:33 +0200 (CEST)
X-QQ-mid: bizesmtp45t1633696949tpwkw9rf
Received: from [10.4.23.19] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 08 Oct 2021 20:42:28 +0800 (CST)
X-QQ-SSF: 0140000000200040D000B00C0000000
X-QQ-FEAT: F3yR32iATbhXb+82YLeQj/S9HqN/7wWDWGmP1JYsEBrgdHfRdVsTpTwPh5Xz/
 qu8qSLijPLxENFElxjFayfKwpVt39Toro85RyYCWH4hPOUrYDcmOOXkpMqiHtouUmn1O2R9
 M+mt6L2pu7Mlbk5c63iHQLkf3GvmOSulch3upWy/j/mJ2SLtFi/yamZxPj4gatbLj7Si8pl
 cjsoqd/U1Ql1GD1Bxor7TOHck5gInmbhZTIxn75BVaZqixL1ozwEtajiOvrAY7QYWFrfo4t
 YLvVv3yo412Jsz3qdiCKRLVlMcL7zESDxdJIySWKjlo2skYSXLWDvLUgKOIOebpOQyXBo9n
 J8tdv0ZfWNLl0Kwsf7QM8kQ2cwttNhsH3pzXj+s
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210929083249.22320-1-zhanglianjie@uniontech.com>
 <20210929083249.22320-2-zhanglianjie@uniontech.com> <YV7f8yhhvy7L9YIX@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <9895d2c0-82a1-833f-c920-b57d1757a7dc@uniontech.com>+692C6C190B815603
Date: Fri, 8 Oct 2021 20:42:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YV7f8yhhvy7L9YIX@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/readdir21: Convert to new API
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

Hi,

On 2021-10-07 19:54, Cyril Hrubis wrote:
> On Wed, Sep 29, 2021 at 04:32:49PM +0800, zhanglianjie wrote:
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

>> -static struct test_case_t {
>> +static struct tcase {
>>   	unsigned int *fd;
>>   	struct old_linux_dirent *dirp;
>>   	unsigned int count;
>>   	int exp_errno;
>> -} test_cases[] = {
>> +} tcases[] = {
>>   	{&del_dir_fd, &dirp, sizeof(struct old_linux_dirent), ENOENT},
>>   	{&file_fd, &dirp, sizeof(struct old_linux_dirent), ENOTDIR},
>>   	{&invalid_fd, &dirp, sizeof(struct old_linux_dirent), EBADF},
>> -#if !defined(UCLINUX)
>>   	{&dir_fd, (struct old_linux_dirent *)-1,
>>   	 sizeof(struct old_linux_dirent), EFAULT},
>> -#endif
>>   };
> 
> I guess that we also miss EINVAL error here with invalid count.
> 
The count here is not used, there is no way to test EINVAL.

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
