Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3074B46
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 12:14:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5CBD3C1D0D
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 12:14:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3C3363C1CFC
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 12:14:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 43A0D601631
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 12:14:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,306,1559491200"; d="scan'208";a="72186911"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Jul 2019 18:14:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 44C6A4CDE65B;
 Thu, 25 Jul 2019 18:14:02 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 25 Jul 2019 18:13:58 +0800
Message-ID: <5D3980E6.8010104@cn.fujitsu.com>
Date: Thu, 25 Jul 2019 18:13:58 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Amir Goldstein <amir73il@gmail.com>, Cyril Hrubis <chrubis@suse.cz>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxg-5UUTB6Z=4Ma9+6LkLVnCz6NBFS4=7Zq_pJfNhZFRqA@mail.gmail.com>
 <5D3941C4.2070601@cn.fujitsu.com>
 <CAOQ4uxg7w51AVD6fig9HH0s7vjC=G2fz8H1nauBZ3V5TiRzuVQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxg7w51AVD6fig9HH0s7vjC=G2fz8H1nauBZ3V5TiRzuVQ@mail.gmail.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 44C6A4CDE65B.AE8F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

on 2019/07/25 16:08, Amir Goldstein wrote:

> On Thu, Jul 25, 2019 at 8:44 AM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
>> on 2019/07/25 13:24, Amir Goldstein wrote:
>>
>>> On Thu, Jul 25, 2019 at 8:02 AM Yang Xu<xuyang2018.jy@cn.fujitsu.com>   wrote:
>>>>
>>>>    static void setup(void)
>>>>    {
>>>>           syscall_info();
>>>> +       char dev_path[1024];
>>> Why? What is the point of filling this string if you're not going to
>>> use it. That's exactly what tst_find_free_loopdev(NULL, 0) is for.
>>> I don't think you understood Cyril's comment about the API
>>> correctly.
>>> He meant he rather keep the *option* in the API to fill out the
>>> suggested loopdev file name. Not that you *have* to fill it.
>>>
>>> Thanks,
>>> Amir.
>>>
>> Hi Amir
>>
>>    I think you don't see the whole patch.
>>
>>    I use this dev_path as below:
>>
>>    fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);
>>
>> on v5 patch, I use  tst_find_free_loopdev(NULL, 0) and create a customized loop dev named "file_block" by mknod .
>>
>> But why we don't use a path directly filled by tst_find_free_loopdev(dev_path, len)? It will not change lib internal state or overwirte data.
>>
>> I only use a standard loop device as same as char device use "/dev/null".
>>
> Right, sorry, missed that.
> It is generally better not to define 1024 array on the stack.
> Most LTP tests define test path vars as static char arrays in top of test file.
Hi Amir

  I think it is a code-style preference. IMO, 1024 array is not enough large and this function is not
interate or recursion call.  It don't make stack overflow. Also, this test path is only used in setup().
  So, I think keeping it is no problem.

>
>>
>>>>           if (access(FILE_DIR_PATH, F_OK) == -1)
>>>>                   SAFE_MKDIR(FILE_DIR_PATH, 0777);
>>>> +       /*
>>>> +        * call tst_find_free_loopdev(), avoid overwriting its
>>>> +        * content on used loopdev.
>>>> +        */
>>>> +       loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>>>> +
>>>> +       SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
>>>>
>>>>           fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>>>>           fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
>>>>           fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
>>>> -       fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
>>>>           fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
>>>>           fd_closed = -1;
>>>>           fd_append = SAFE_OPEN(FILE_DEST_PATH,
>>>>                           O_RDWR | O_CREAT | O_APPEND, 0664);
>>>> +       fd_immutable = SAFE_OPEN(FILE_IMMUTABLE_PATH, O_RDWR | O_CREAT, 0664);
>>>> +       fd_swapfile = SAFE_OPEN(FILE_SWAP_PATH, O_RDWR | O_CREAT, 0600);
>>>> +
>>>> +       if (loop_devn == -1)
>>>> +               fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);
>>>> +
>>         I use the dev_path string.
> (loop_devn != 1) ??
Sorry for the obvious error.


Hi Cyril

Would you mind me to send a v7 patch or you merge this patchset with changing this obvious error
if you think it is ok?


> Thanks,
> Amir.
>
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
