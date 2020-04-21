Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E711B23EF
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 12:35:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44FCC3C628C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 12:35:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B2DEA3C29A1
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 12:35:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2CC762011DC
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 12:35:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,409,1580745600"; d="scan'208";a="89352815"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 18:35:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E664A46B5FA8;
 Tue, 21 Apr 2020 18:24:46 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 18:35:20 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200417151050.GA2491@yuki.lan>
 <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
 <48142e6b-8169-2934-e8b2-f71927cd62b0@cn.fujitsu.com>
 <20200420130140.GB11604@yuki.lan>
 <d3063175-5014-51ea-9d1c-4a9f3e2243b1@cn.fujitsu.com>
 <20200421085544.GB6577@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <4b8ee0d5-6f5d-be72-a49a-6cfe3d13e06a@cn.fujitsu.com>
Date: Tue, 21 Apr 2020 18:35:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200421085544.GB6577@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E664A46B5FA8.AF179
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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
>>>> +void tst_assert_file_str(const char *file, const int lineno, const char
>>>> *path, const char *buf, const char *val)
>>>> +{
>>>> +       char sys_val[1024];
>>>> +
>>>> +       SAFE_FILE_LINES_SCANF(path, buf, sys_val);
>>>
>>> We should call the file_lines_scanf() here and pass the filename and
>>> lineno that this functions takes as parameter instead.
>> I don't understand the meaning of adding filename and line parameter(If
>> fail, it will report tst_assert.c: 29). Do you want to report the
>> correct parsed filename when failed?
>>
>> If so, I think lineno is meaningless and it also overides the place of
>> the code meet problem . I prefer to add some path info in safe_file_ops.c.
> 
> What I want is to show the test source filename and line on failure, for
> that we have to pass the lineno and file to the file_lines_scanf()
> function. I think that it makes much more sense to print the line in a
> test where the problem has happened rather than some location in the
> library code.
Oh, I see. ie TST_ASSERT_INT, modify ioctl_loop01.c
TST_ASSERT_INT(__FILE__, __LINE__, partscan_path, 0);
if partscan_path doesn't exist, it will report error as below:
safe_file_ops.c:142: BROK: Failed to open FILE 
'/sys/block/loop0/loop1/partscan' for reading at ioctl_loop01.c:46: 
ENOENT (2)

--- a/lib/tst_assert.c
+++ b/lib/tst_assert.c
-void tst_assert_int(const char *file, const int lineno, const char 
*path, int val)
+void tst_assert_int(const char *file, const int lineno, const char 
*source_path,
+                   const int source_pos, const char *path, int val)
  {
         int sys_val;

-       SAFE_FILE_SCANF(path, "%d", &sys_val);
+       safe_file_scanf(source_path, source_pos, NULL, path, "%d", &sys_val

diff --git a/include/tst_assert.h b/include/tst_assert.h
index 913fff1b5..03e57bbd9 100644
--- a/include/tst_assert.h
+++ b/include/tst_assert.h
@@ -7,8 +7,8 @@
  #ifndef TST_ASSERT_H__
  #define TST_ASSERT_H__

-#define TST_ASSERT_INT(path, val) \
-       tst_assert_int(__FILE__, __LINE__, path, val)
+#define TST_ASSERT_INT(source_path, source_pos, path, val) \
+       tst_assert_int(__FILE__, __LINE__, source_path, source_pos, 
path, val)

  /*
   * Asserts that integer value stored in file pointed by path equals to the
@@ -16,6 +16,7 @@
   * values in sysfs, procfs, etc.
   */
  void tst_assert_int(const char *file, const int lineno,
+                   const char *source_path, const int source_pos,
                     const char *path, int val);

  #define TST_ASSERT_FILE_INT(path, buf, val)

> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
