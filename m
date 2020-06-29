Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8738420CDF0
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 12:38:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 363F33C5736
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 12:38:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 60E8E3C2AE0
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 12:38:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id EDCE710011A8
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 12:37:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="95482820"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 18:37:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0E2574CE4B12;
 Mon, 29 Jun 2020 18:27:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 18:37:55 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <20200624113217.GC30917@yuki.lan>
 <1593330123-19631-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1418968619.19068649.1593417390787.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c11e8d9b-bd16-da32-e9eb-490226f4f4c1@cn.fujitsu.com>
Date: Mon, 29 Jun 2020 18:37:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1418968619.19068649.1593417390787.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0E2574CE4B12.AF51C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] tst_device: Add new api
 tst_find_backing_dev(path, dev)
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


> 
> 
> ----- Original Message -----
>> +This function finds the block dev that this path belongs to, it compares
>> path buf
>> +with the fifth column of each row in "/proc/self/mountinfo" and list 10th
>> column
>> +as its block dev.
> 
> Why not match major/minor numbers?
> 
> You said "But stat function has problem when filsystem uses virtual block
> (such as btrfs,fuse, then major numer is 0)." - Why is that a problem
> for comparison against /proc/self/mountinfo?
> 
Yes, you are right. I wrongly think btrfs filesystem affects the 10th 
columu value in /proc/self/mountinfo. In actually, it can show the 
correct backing block dev.
so this functon code as below:
void tst_find_backing_dev(const char *path, char *dev)
{
         char fmt[1024];
         struct stat buf;

         if (stat(path, &buf) < 0)
                  tst_brkm(TWARN | TERRNO, NULL, "stat() failed");

         snprintf(fmt, sizeof(fmt), "%%*i %%*i %u:%u %%*s %%*s %%*s %%*s 
%%*s %%*s %%s %%*s",
                         major(buf.st_dev), minor(buf.st_dev));

         SAFE_FILE_LINES_SCANF(NULL, "/proc/self/mountinfo", fmt, dev);

         if (stat(dev, &buf) < 0)
                  tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);

         if (S_ISBLK(buf.st_mode) != 1)
                 tst_brkm(TCONF, NULL, "dev(%s) isn't a block dev", dev);
}


ps: If you think it is ok, I will send a v5 patch about this.
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
