Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F77A625
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:42:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E0DF3C1D5D
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:42:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 606BE3C1441
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:42:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E37A61A01112
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:42:21 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,326,1559491200"; d="scan'208";a="72520529"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 18:42:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 2DE824CDD99E;
 Tue, 30 Jul 2019 18:42:20 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 30 Jul 2019 18:42:11 +0800
Message-ID: <5D401F02.5080209@cn.fujitsu.com>
Date: Tue, 30 Jul 2019 18:42:10 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729130107.GA27006@rei.lan>
In-Reply-To: <20190729130107.GA27006@rei.lan>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 2DE824CDD99E.AEFED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/3] lib: alter find_free_loopdev()
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


> Hi!
>> +int tst_find_free_loopdev(const char *path, size_t path_len);
>>   /*
>>    * Reads test block device stat file and returns the bytes written since the
>>    * last call of this function.
>> diff --git a/lib/tst_device.c b/lib/tst_device.c
>> index 65fcc1337..f2516fb08 100644
>> --- a/lib/tst_device.c
>> +++ b/lib/tst_device.c
>> @@ -53,22 +53,22 @@ static const char *dev_variants[] = {
>>   	"/dev/block/loop%i"
>>   };
>>
>> -static int set_dev_path(int dev)
>> +static int set_dev_path(int dev, char *path, size_t path_len)
>>   {
>>   	unsigned int i;
>>   	struct stat st;
>>
>>   	for (i = 0; i<  ARRAY_SIZE(dev_variants); i++) {
>> -		snprintf(dev_path, sizeof(dev_path), dev_variants[i], dev);
>> +		snprintf(path, path_len, dev_variants[i], dev);
>>
>> -		if (stat(dev_path,&st) == 0&&  S_ISBLK(st.st_mode))
>> +		if (stat(path,&st) == 0&&  S_ISBLK(st.st_mode))
>>   			return 1;
>>   	}
>>
>>   	return 0;
>>   }
>>
>> -static int find_free_loopdev(void)
>> +int tst_find_free_loopdev(char *path, size_t path_len)
>>   {
>>   	int ctl_fd, dev_fd, rc, i;
>>   	struct loop_info loopinfo;
>> @@ -80,12 +80,14 @@ static int find_free_loopdev(void)
>>   		rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
>>   		close(ctl_fd);
>>   		if (rc>= 0) {
>> -			set_dev_path(rc);
>> -			tst_resm(TINFO, "Found free device '%s'", dev_path);
>> -			return 0;
>> +			if (path)
>> +				set_dev_path(rc, path, path_len);
>> +			tst_resm(TINFO, "Found free device %d '%s'",
>> +				rc, path ?: "");
>> +			return rc;
>>   		}
>>   		tst_resm(TINFO, "Couldn't find free loop device");
>> -		return 1;
>> +		return -1;
>>   	}
>>
>>   	switch (errno) {
>> @@ -104,24 +106,24 @@ static int find_free_loopdev(void)
>>   	 * Older way is to iterate over /dev/loop%i and /dev/loop/%i and try
>>   	 * LOOP_GET_STATUS ioctl() which fails for free loop devices.
>>   	 */
>> -	for (i = 0; i<  256; i++) {
>> +	for (i = 0; path&&  i<  256; i++) {
> There is still a small problem here in the fallback code for older
> kernels. The way we detect a free device there is by opening the device
> and doing the LOOP_GET_STATUS ioctl(). So by disabling this loop if path
> is not set we broke the detection on older kernels when NULL is passed
> to the function.
>
> We should work with a local temporary path in this loop and copy it over
> to the path if we are succesfull and if path is not NULL.
>
Hi Cyril

Thanks for pointing out it.  I will fix it on next version. as below:

int tst_find_free_loopdev(char *path, size_t path_len)
  {
         int ctl_fd, dev_fd, rc, i;
         struct loop_info loopinfo;
+       char buf[1024];

         /* since Linux 3.1 */
         ctl_fd = open(LOOP_CONTROL_FILE, O_RDWR);
@@ -80,12 +81,14 @@ static int find_free_loopdev(void)
                 rc = ioctl(ctl_fd, LOOP_CTL_GET_FREE);
                 close(ctl_fd);
                 if (rc>= 0) {
-                       set_dev_path(rc);
-                       tst_resm(TINFO, "Found free device '%s'", dev_path);
-                       return 0;
+                       if (path)
+                               set_dev_path(rc, path, path_len);
+                       tst_resm(TINFO, "Found free device %d '%s'",
+                               rc, path ?: "");
+                       return rc;
                 }
                 tst_resm(TINFO, "Couldn't find free loop device");
-               return 1;
+               return -1;
         }


  static int find_free_loopdev(void)
          */
         for (i = 0; i<  256; i++) {

-               if (!set_dev_path(i))
+               if (!set_dev_path(i, buf, sizeof(buf)))
                         continue;

-               dev_fd = open(dev_path, O_RDONLY);
+               dev_fd = open(buf, O_RDONLY);

                 if (dev_fd<  0)
                         continue;

                 if (ioctl(dev_fd, LOOP_GET_STATUS,&loopinfo) == 0) {
-                       tst_resm(TINFO, "Device '%s' in use", dev_path);
+                       tst_resm(TINFO, "Device '%s' in use", buf);
                 } else {
                         if (errno != ENXIO)
                                 continue;
-                       tst_resm(TINFO, "Found free device '%s'", dev_path);
+                       tst_resm(TINFO, "Found free device '%s'", buf);
                         close(dev_fd);
-                       return 0;
+                       if (path != NULL)
+                               strcpy(path, buf);
+                       return i;
                 }


Thanks
Yang Xu

>> -		if (!set_dev_path(i))
>> +		if (!set_dev_path(i, path, path_len))
>>   			continue;
>>
>> -		dev_fd = open(dev_path, O_RDONLY);
>> +		dev_fd = open(path, O_RDONLY);
>>
>>   		if (dev_fd<  0)
>>   			continue;
>>
>>   		if (ioctl(dev_fd, LOOP_GET_STATUS,&loopinfo) == 0) {
>> -			tst_resm(TINFO, "Device '%s' in use", dev_path);
>> +			tst_resm(TINFO, "Device '%s' in use", path);
>>   		} else {
>>   			if (errno != ENXIO)
>>   				continue;
>> -			tst_resm(TINFO, "Found free device '%s'", dev_path);
>> +			tst_resm(TINFO, "Found free device '%s'", path);
>>   			close(dev_fd);
>> -			return 0;
>> +			return i;
>>   		}
>>
>>   		close(dev_fd);
>> @@ -129,7 +131,7 @@ static int find_free_loopdev(void)
>>
>>   	tst_resm(TINFO, "No free devices found");
>>
>> -	return 1;
>> +	return -1;
>>   }




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
