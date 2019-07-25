Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E008674593
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 07:44:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E7343C1CFC
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 07:44:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 268A33C1C93
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 07:44:49 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 106F7600F8E
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 07:44:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,305,1559491200"; d="scan'208";a="72169037"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Jul 2019 13:44:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id CEC744CDE65B;
 Thu, 25 Jul 2019 13:44:38 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 25 Jul 2019 13:44:37 +0800
Message-ID: <5D3941C4.2070601@cn.fujitsu.com>
Date: Thu, 25 Jul 2019 13:44:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Amir Goldstein <amir73il@gmail.com>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxg-5UUTB6Z=4Ma9+6LkLVnCz6NBFS4=7Zq_pJfNhZFRqA@mail.gmail.com>
In-Reply-To: <CAOQ4uxg-5UUTB6Z=4Ma9+6LkLVnCz6NBFS4=7Zq_pJfNhZFRqA@mail.gmail.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: CEC744CDE65B.AFB09
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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

on 2019/07/25 13:24, Amir Goldstein wrote:

> On Thu, Jul 25, 2019 at 8:02 AM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
>>
>>
>>   static void setup(void)
>>   {
>>          syscall_info();
>> +       char dev_path[1024];
> Why? What is the point of filling this string if you're not going to
> use it. That's exactly what tst_find_free_loopdev(NULL, 0) is for.
> I don't think you understood Cyril's comment about the API
> correctly.
> He meant he rather keep the *option* in the API to fill out the
> suggested loopdev file name. Not that you *have* to fill it.
>
> Thanks,
> Amir.
>
Hi Amir

  I think you don't see the whole patch.

  I use this dev_path as below:

  fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);

on v5 patch, I use  tst_find_free_loopdev(NULL, 0) and create a customized loop dev named "file_block" by mknod .

But why we don't use a path directly filled by tst_find_free_loopdev(dev_path, len)? It will not change lib internal state or overwirte data.

I only use a standard loop device as same as char device use "/dev/null".

Thanks
Yang Xu


>
>>          if (access(FILE_DIR_PATH, F_OK) == -1)
>>                  SAFE_MKDIR(FILE_DIR_PATH, 0777);
>> +       /*
>> +        * call tst_find_free_loopdev(), avoid overwriting its
>> +        * content on used loopdev.
>> +        */
>> +       loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>> +
>> +       SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
>>
>>          fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>>          fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
>>          fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
>> -       fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
>>          fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
>>          fd_closed = -1;
>>          fd_append = SAFE_OPEN(FILE_DEST_PATH,
>>                          O_RDWR | O_CREAT | O_APPEND, 0664);
>> +       fd_immutable = SAFE_OPEN(FILE_IMMUTABLE_PATH, O_RDWR | O_CREAT, 0664);
>> +       fd_swapfile = SAFE_OPEN(FILE_SWAP_PATH, O_RDWR | O_CREAT, 0600);
>> +
>> +       if (loop_devn == -1)
>> +               fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);
>> +
       I use the dev_path string.

>> +       fd_chrdev = SAFE_OPEN(FILE_CHRDEV, O_RDWR, 0600);
>> +       fd_fifo = SAFE_OPEN(FILE_FIFO, O_RDWR, 0600);
>> +
>> +       SAFE_WRITE(1, fd_src, CONTENT, CONTSIZE);
>> +       close(fd_src);
>> +       fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY, 0664);
>> +       fd_dup = SAFE_OPEN(FILE_SRC_PATH, O_WRONLY|O_CREAT, 0666);
>> +
>> +       fd_copy = SAFE_OPEN(FILE_COPY_PATH, O_RDWR | O_CREAT | O_TRUNC, 0664);
>> +       chattr_i_nsup = run_command("chattr", "+i", FILE_IMMUTABLE_PATH);
>> +
>> +       if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES)) {
>> +               tst_res(TCONF, "Insufficient disk space to create swap file");
>> +               swap_nsup = 3;
>> +               return;
>> +       }
>> +
>> +       if (tst_fill_file(FILE_SWAP_PATH, 0, sysconf(_SC_PAGESIZE), 10) != 0) {
>> +               tst_res(TCONF, "Failed to create swapfile");
>> +               swap_nsup = 4;
>> +               return;
>> +       }
>>
>> -       SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
>> +       swap_nsup = run_command("mkswap", FILE_SWAP_PATH, NULL);
>> +       swap_nsup = run_command("swapon", FILE_SWAP_PATH, NULL);
>>   }
>>
>>   static struct tst_test test = {
>> @@ -113,6 +218,6 @@ static struct tst_test test = {
>>          .needs_root = 1,
>>          .mount_device = 1,
>>          .mntpoint = MNTPOINT,
>> -       .dev_fs_type = "ext4",
>> +       .all_filesystems = 1,
>>          .test_variants = TEST_VARIANTS,
>>   };
>> --
>> 2.18.1
>>
>>
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
