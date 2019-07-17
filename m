Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601F6BA51
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:35:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B0CD3C1D28
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:35:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CC85E3C0300
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:35:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A6EB560062B
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:35:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,274,1559491200"; d="scan'208";a="71631347"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Jul 2019 18:35:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 773024CDB2E5;
 Wed, 17 Jul 2019 18:34:59 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 17 Jul 2019 18:35:01 +0800
Message-ID: <5D2EF9D1.3020102@cn.fujitsu.com>
Date: Wed, 17 Jul 2019 18:34:57 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Amir Goldstein <amir73il@gmail.com>
References: <20190711125108.GB8709@rei>
 <1563356676-2384-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxiV_weQXVnDn0vFq5exk=Z_F=70Lk1D+783fOV=hsf_6A@mail.gmail.com>
In-Reply-To: <CAOQ4uxiV_weQXVnDn0vFq5exk=Z_F=70Lk1D+783fOV=hsf_6A@mail.gmail.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 773024CDB2E5.AEC8A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: alter find_free_loopdev()
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


> On Wed, Jul 17, 2019 at 12:45 PM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
>> Alter find_free_loopdev() to tst_find_free_loopdev(path, path_len),
>> it passes the dev_path inside of the tst_device.c and NULL from other
>> tests. It returns the free loopdev minor (and -1 for no free loopdev).
>> We can call tst_find_free_loopdev(NULL, 0) to get a free minor number
>> without changing lib internal state.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> Reviewed-by: Amir Goldstein<amir73il@gmail.com>
>> ---
>>   doc/test-writing-guidelines.txt | 12 ++++++++++++
>>   include/tst_device.h            |  5 +++++
>>   lib/tst_device.c                | 34 +++++++++++++++++----------------
>>   3 files changed, 35 insertions(+), 16 deletions(-)
>>
>> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
>> index 4b1e7d25b..c65c707e6 100644
>> --- a/doc/test-writing-guidelines.txt
>> +++ b/doc/test-writing-guidelines.txt
>> @@ -1045,6 +1045,18 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
>>   -------------------------------------------------------------------------------
>>   #include "tst_test.h"
>>
>> +int tst_find_free_loopdev(const char *path, size_t path_len);
>> +-------------------------------------------------------------------------------
>> +
>> +This function finds a free loopdev and returns the free loopdev minor (-1 for no
>> +free loopdev). If path is non-NULL, it will be filled with free loopdev path.
>> +We can call tst_find_free_loopdev(NULL, 0) in tests to get a free minor number
>> +without changing lib internal state.
>> +
>> +[source,c]
>> +-------------------------------------------------------------------------------
>> +#include "tst_test.h"
>> +
>>   unsigned long tst_dev_bytes_written(const char *dev);
>>   -------------------------------------------------------------------------------
>>
>> diff --git a/include/tst_device.h b/include/tst_device.h
>> index 61902b7e0..42b9fa95b 100644
>> --- a/include/tst_device.h
>> +++ b/include/tst_device.h
>> @@ -44,6 +44,11 @@ int tst_umount(const char *path);
>>    */
>>   int tst_clear_device(const char *dev);
>>
>> +/*
>> + * Finds a free loop device for use and returns the free loopdev minor(-1 for no
>> + * free loopdev). If path is non-NULL, it will be filled with free loopdev path.
>> + */
>> +int tst_find_free_loopdev(const char *path, size_t path_len);
>>   /*
>>    * Reads test block device stat file and returns the bytes written since the
>>    * last call of this function.
>> diff --git a/lib/tst_device.c b/lib/tst_device.c
>> index 65fcc1337..f2516fb08 100644
>> --- a/lib/tst_device.c
>> +++ b/lib/tst_device.c
>> @@ -53,22 +53,22 @@ static const char *dev_variants[] = {
>>          "/dev/block/loop%i"
>>   };
>>
>> -static int set_dev_path(int dev)
>> +static int set_dev_path(int dev, char *path, size_t path_len)
>>   {
>>          unsigned int i;
>>          struct stat st;
>>
>>          for (i = 0; i<  ARRAY_SIZE(dev_variants); i++) {
>> -               snprintf(dev_path, sizeof(dev_path), dev_variants[i], dev);
>> +               snprintf(path, path_len, dev_variants[i], dev);
>>
>> -               if (stat(dev_path,&st) == 0&&  S_ISBLK(st.st_mode))
>> +               if (stat(path,&st) == 0&&  S_ISBLK(st.st_mode))
>>                          return 1;
>>          }
>>
>>          return 0;
>>   }
>>
>> -static int find_free_loopdev(void)
>> +int tst_find_free_loopdev(char *path, size_t path_len)
> Another option is to leave this function internal and export a wrapper
> for the exact needed functionality:
>
> /* Just find a free minor number */
> int tst_find_free_loopdev(void)
> {
>          return find_free_loopdev(NULL, 0);
> }
>
> I don't mind wither way.
Hi Amir

The second way looks better for me.  But I also want to hear the idea of cyril.

>>   {
>>          int ctl_fd, dev_fd, rc, i;
>>          struct loop_info loopinfo;
>> @@ -80,12 +80,14 @@ static int find_free_loopdev(void)
>>                  rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
>>                  close(ctl_fd);
>>                  if (rc>= 0) {
>> -                       set_dev_path(rc);
>> -                       tst_resm(TINFO, "Found free device '%s'", dev_path);
>> -                       return 0;
>> +                       if (path)
>> +                               set_dev_path(rc, path, path_len);
>> +                       tst_resm(TINFO, "Found free device %d '%s'",
>> +                               rc, path ?: "");
>> +                       return rc;
>>                  }
>>                  tst_resm(TINFO, "Couldn't find free loop device");
>> -               return 1;
>> +               return -1;
>>          }
>>
>>          switch (errno) {
>> @@ -104,24 +106,24 @@ static int find_free_loopdev(void)
>>           * Older way is to iterate over /dev/loop%i and /dev/loop/%i and try
>>           * LOOP_GET_STATUS ioctl() which fails for free loop devices.
>>           */
>> -       for (i = 0; i<  256; i++) {
>> +       for (i = 0; path&&  i<  256; i++) {
>>
>> -               if (!set_dev_path(i))
>> +               if (!set_dev_path(i, path, path_len))
>>                          continue;
>>
>> -               dev_fd = open(dev_path, O_RDONLY);
>> +               dev_fd = open(path, O_RDONLY);
>>
>>                  if (dev_fd<  0)
>>                          continue;
>>
>>                  if (ioctl(dev_fd, LOOP_GET_STATUS,&loopinfo) == 0) {
>> -                       tst_resm(TINFO, "Device '%s' in use", dev_path);
>> +                       tst_resm(TINFO, "Device '%s' in use", path);
>>                  } else {
>>                          if (errno != ENXIO)
>>                                  continue;
>> -                       tst_resm(TINFO, "Found free device '%s'", dev_path);
>> +                       tst_resm(TINFO, "Found free device '%s'", path);
>>                          close(dev_fd);
>> -                       return 0;
>> +                       return i;
>>                  }
>>
>>                  close(dev_fd);
>> @@ -129,7 +131,7 @@ static int find_free_loopdev(void)
>>
>>          tst_resm(TINFO, "No free devices found");
>>
>> -       return 1;
>> +       return -1;
>>   }
>>
>>   static int attach_device(const char *dev, const char *file)
>> @@ -274,7 +276,7 @@ const char *tst_acquire_device__(unsigned int size)
>>                  return NULL;
>>          }
>>
>> -       if (find_free_loopdev())
>> +       if (tst_find_free_loopdev(dev_path, sizeof(dev_path)) == -1)
>>                  return NULL;
>>
>>          if (attach_device(dev_path, DEV_FILE))
>> --
>> 2.18.1
>>
>>
>>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
